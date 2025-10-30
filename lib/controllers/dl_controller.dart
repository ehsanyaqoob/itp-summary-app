// driving_licence_controller.dart
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/io_client.dart';
import 'package:trafficlly/models/dl_model.dart';
import 'package:trafficlly/utills/export.dart';
// driving_licence_controller.dart
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/io_client.dart';
import 'package:trafficlly/models/dl_model.dart';
import 'package:trafficlly/utills/export.dart';

class DrivingLicenceController extends GetxController {
  Rx<DrivingLicenceModel> licenceData = DrivingLicenceModel(
    todayRecords: 0,
    totalPaidToday: 0.0,
    totalUnpaidToday: 0.0,
    totalAmountOfToday: 0,
    todayPaidTicket: 0,
    todayUnPaidTicket: 0,
    weeklyTotalRecord: 0,
    paidThisWeek: 0.0,
    unpaidThisWeek: 0.0,
    totalAmountOfToWeek: 0,
    weekPaidTicket: 0,
    weekUnPaidTicket: 0,
    monthlyTotalRecord: 0,
    paidThisMonth: 0.0,
    unpaidThisMonth: 0.0,
    totalAmountOfToMonth: 0,
    monthPaidTicket: 0,
    monthUnPaidTicket: 0,
    yearlyTotalRecord: 0,
    paidThisYear: 0.0,
    unpaidThisYear: 0.0,
    totalAmountOfToYear: 0,
    yearPaidTicket: 0,
    yearUnPaidTicket: 0,
    approveLearner: 0,
    inprocessLearner: 0,
    pendingLearner: 0,
    rejectedLearner: 0,
    maleLearner: 0,
    femaleLearner: 0,
  ).obs;

  RxBool isLoading = false.obs;
  RxString selectedFilter = 'Daily'.obs;
  RxBool isInitialLoad = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLicenceDataWithDelay();
  }

  Future<void> fetchLicenceDataWithDelay() async {
    isLoading.value = true;
    isInitialLoad.value = true;

    await Future.wait([
      _fetchApiData(),
      Future.delayed(const Duration(seconds: 2)),
    ]);

    isLoading.value = false;
    isInitialLoad.value = false;
  }

  Future<void> fetchLicenceDataOnFilter() async {
    isLoading.value = true;

    await Future.wait([
      _fetchApiData(),
      Future.delayed(const Duration(seconds: 1)),
    ]);

    isLoading.value = false;
  }

  Future<void> _fetchApiData() async {
    final url = Uri.parse('https://dlims.islamabadpolice.gov.pk/api/dlims-statistic');
    print('🔃 Fetching Driving Licence data for: ${selectedFilter.value}');

    try {
      final HttpClient httpClient = HttpClient()
        ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;

      final IOClient ioClient = IOClient(httpClient);

      final response = await ioClient.get(url).timeout(
        const Duration(seconds: 10),
        onTimeout: () => throw TimeoutException('API timed out'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        licenceData.value = DrivingLicenceModel.fromJson(jsonResponse, selectedFilter.value);
        print('✅ Driving Licence data loaded successfully for ${selectedFilter.value}');
        print('📊 Total Records: ${licenceData.value.getTotalRecords(selectedFilter.value)}');
      } else {
        print('❌ API Error: ${response.statusCode} - ${response.body}');
        Get.snackbar(
          'Error',
          'Failed to fetch data: ${response.statusCode}',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print("❌ DL API Error: $e");
      Get.snackbar(
        'Connection Error',
        'Unable to connect to server',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
    }
  }

  void changeFilter(String filter) {
    selectedFilter.value = filter;
    fetchLicenceDataOnFilter();
  }
}



class TotalDlAmountController extends GetxController {
  RxDouble totalAmount = 0.0.obs;
  RxBool isLoading = false.obs;
  RxString selectedFilter = 'Daily'.obs;
  RxList<Map<String, dynamic>> transactions = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchLatestAmount();
  }

  Future<void> fetchLatestAmount() async {
    isLoading.value = true;
    
    try {
      await _fetchApiData();
      // Simulate some delay for better UX
      await Future.delayed(Duration(seconds: 1));
    } catch (e) {
      print("Error fetching DL amount: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _fetchApiData() async {
    final url = Uri.parse('https://dlims.islamabadpolice.gov.pk/api/dlims-statistic');
    print('🔃 Fetching DL Amount data for: ${selectedFilter.value}');

    try {
      final HttpClient httpClient = HttpClient()
        ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;

      final IOClient ioClient = IOClient(httpClient);

      final response = await ioClient.get(url).timeout(
        const Duration(seconds: 10),
        onTimeout: () => throw TimeoutException('API timed out'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        _processApiData(jsonResponse);
        print('✅ DL Amount data loaded successfully');
      } else {
        print('❌ API Error: ${response.statusCode}');
        Get.snackbar(
          'Error',
          'Failed to fetch data: ${response.statusCode}',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print("❌ DL Amount API Error: $e");
      Get.snackbar(
        'Connection Error',
        'Unable to connect to server',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
    }
  }

  void _processApiData(Map<String, dynamic> jsonData) {
    // Update total amount based on selected filter
    switch (selectedFilter.value.toLowerCase()) {
      case 'daily':
        totalAmount.value = double.tryParse(jsonData['totalAmountOfToday']?.toString() ?? '0.0') ?? 0.0;
        break;
      case 'weekly':
        totalAmount.value = double.tryParse(jsonData['totalAmountOfToWeek']?.toString() ?? '0.0') ?? 0.0;
        break;
      case 'monthly':
        totalAmount.value = double.tryParse(jsonData['totalAmountOfToMonth']?.toString() ?? '0.0') ?? 0.0;
        break;
      case 'yearly':
        totalAmount.value = double.tryParse(jsonData['totalAmountOfToYear']?.toString() ?? '0.0') ?? 0.0;
        break;
      default:
        totalAmount.value = double.tryParse(jsonData['totalAmountOfToday']?.toString() ?? '0.0') ?? 0.0;
    }

    // Generate mock transactions based on API data
    _generateTransactions(jsonData);
  }

  void _generateTransactions(Map<String, dynamic> jsonData) {
    // Create realistic transactions based on API data
    List<Map<String, dynamic>> newTransactions = [];
    
    // Use actual data from API for more realistic transactions
    int paidToday = int.tryParse(jsonData['todayPaidTicket']?.toString() ?? '0') ?? 0;
    double amountToday = double.tryParse(jsonData['totalPaidToday']?.toString() ?? '0.0') ?? 0.0;
    
    if (paidToday > 0 && amountToday > 0) {
      // Create transactions based on today's data
      double avgAmount = amountToday / paidToday;
      
      for (int i = 0; i < 3; i++) {
        newTransactions.add({
          "date": _getRecentDate(i),
          "amount": (avgAmount * (0.8 + 0.4 * (i / 3))).toStringAsFixed(0),
          "type": _getRandomTransactionType(i),
          "status": "Completed",
        });
      }
    } else {
      // Fallback mock data
      newTransactions = [
        {"date": "2024-06-02", "amount": "8000", "type": "License Renewal", "status": "Completed"},
        {"date": "2024-06-08", "amount": "5000", "type": "New License", "status": "Completed"},
        {"date": "2024-06-12", "amount": "6000", "type": "Fine Payment", "status": "Completed"},
      ];
    }
    
    transactions.assignAll(newTransactions);
  }

  String _getRecentDate(int daysAgo) {
    final now = DateTime.now();
    final date = now.subtract(Duration(days: daysAgo * 2));
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  String _getRandomTransactionType(int index) {
    List<String> types = [
      "License Renewal",
      "New License",
      "Fine Payment",
      "Duplicate License",
      "License Upgrade"
    ];
    return types[index % types.length];
  }

  void changeFilter(String filter) {
    selectedFilter.value = filter;
    fetchLatestAmount();
  }

  double getProgressValue() {
    // Calculate progress based on amount (you can customize this logic)
    if (totalAmount.value == 0) return 0.0;
    double maxAmount = 100000.0; // Adjust this based on your expected max amount
    double progress = totalAmount.value / maxAmount;
    return progress > 1.0 ? 1.0 : progress;
  }
}