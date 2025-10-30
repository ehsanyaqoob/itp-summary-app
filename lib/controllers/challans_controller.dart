// controller/challan_controller.dart
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/io_client.dart';
import 'package:trafficlly/models/challans_model.dart';

class ChallanController extends GetxController {
  Rx<ChallanModel> challanData = ChallanModel(
    eTicket: 0,
    fineAmount: 0.0,
    paidAmount: 0.0,
    unpaidAmount: 0.0,
    paidTickets: 0,
    unpaidTickets: 0,
  ).obs;

  RxBool isLoading = false.obs;
 // Explicitly set the default filter to 'daily'
    RxString selectedFilter = 'daily'.obs; 
    RxBool isInitialLoad = true.obs;

    @override
    void onInit() {
      super.onInit();
      // Ensure the filter is set to 'daily' before fetching data on startup
      selectedFilter.value = 'daily'; 
      fetchChallanDataWithDelay();
    }
  Future<void> fetchChallanDataWithDelay() async {
    isLoading.value = true;
    
    await Future.wait([
      _fetchApiData(),
      Future.delayed(Duration(seconds: 2)), // Minimum 2 second delay
    ]);
    
    isLoading.value = false;
    isInitialLoad.value = false;
  }

  Future<void> fetchChallanDataOnFilter() async {
    isLoading.value = true;
    
    await Future.wait([
      _fetchApiData(),
      Future.delayed(Duration(seconds: 2)), // Minimum 2 second delay
    ]);
    
    isLoading.value = false;
  }

  Future<void> _fetchApiData() async {
    final url = Uri.parse('https://traffic.islamabadpolice.gov.pk/v1/api/challan-summary');
    print('🔃 Fetching Challan data for: ${selectedFilter.value}');

    try {
      final HttpClient httpClient = HttpClient()
        ..badCertificateCallback = (X509Certificate cert, String host, int port) {
          print('⚠️ Bypassing certificate validation for: $host');
          return true;
        };

      final IOClient ioClient = IOClient(httpClient);
      print('⏳ Making GET request to $url');

      final response = await ioClient.get(url).timeout(
        const Duration(seconds: 8),
        onTimeout: () {
          print('⏱️ Request timed out after 8 seconds.');
          throw TimeoutException('API timed out');
        },
      );

      print('📥 Response Status: ${response.statusCode}');
      print('📦 Raw Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        challanData.value = ChallanModel.fromJson(jsonResponse, selectedFilter.value);
        print('✅ Parsed Challan Data: ${challanData.value}');
      } else {
        print('❌ API Error: ${response.statusCode}');
      }
    } catch (e) {
      print('⚠️ Exception during fetch: $e');
    }
  }

  void changeFilter(String filter) {
    selectedFilter.value = filter;
    fetchChallanDataOnFilter();
  }

  double get paidPercentage => challanData.value.eTicket > 0 
      ? (challanData.value.paidTickets / challanData.value.eTicket) * 100 
      : 0;

  double get unpaidPercentage => challanData.value.eTicket > 0 
      ? (challanData.value.unpaidTickets / challanData.value.eTicket) * 100 
      : 0;
}