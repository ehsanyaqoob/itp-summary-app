import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trafficlly/utills/export.dart';
import 'package:trafficlly/widgets/challan_analysis_section.dart';
import 'package:trafficlly/widgets/challan_bar_chart.dart';
import 'package:trafficlly/widgets/challan_pie_chart.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ChallanController challanController = Get.put(ChallanController());
  final DrivingLicenceController dlController = Get.put(DrivingLicenceController());
  final TotalDlAmountController dlAmountController = Get.put(TotalDlAmountController());
  DateTime? _lastBackPressTime;

  Future<void> _refreshData() async {
    // Show a loading feedback on the screen via RefreshIndicator
    await Future.wait([
      challanController.fetchChallanDataWithDelay(),
      dlController.fetchLicenceDataWithDelay(),
      dlAmountController.fetchLatestAmount(),
    ]);
  }

  Future<bool> _onWillPop() async {
    final currentTime = DateTime.now();

    if (_lastBackPressTime == null ||
        currentTime.difference(_lastBackPressTime!) >
            const Duration(seconds: 2)) {
      _lastBackPressTime = currentTime;

      Fluttertoast.showToast(
        msg: "Press back again to exit app",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.primary.withOpacity(0.9),
        textColor: AppColors.white,
        fontSize: 14.0.sp,
      );

      return false;
    }

    SystemNavigator.pop();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    const double paddingHorizontal = 16.0; // Use raw double for const

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        // Using a regular AppBar for the header section
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.scaffoldBackgroundColor,
          surfaceTintColor: AppColors.scaffoldBackgroundColor,
          toolbarHeight: 70.h,
          title: Padding(
            // Adjust padding to align with body content
            padding: EdgeInsets.symmetric(horizontal: paddingHorizontal * 0.2), 
            child: _buildHeader(),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: _refreshData,
          color: AppColors.primary,
          backgroundColor: AppColors.scaffoldBackgroundColor,
          child: SingleChildScrollView(
            // Use SingleChildScrollView to allow the refresh indicator to work naturally
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal)
                .copyWith(top: 0, bottom: 24.h), // Remove top padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // The main content starts here, no need for extra space
                const SummaryCards(),
                SizedBox(height: 30.h),
                _analysisSection(challanController.challanData.value),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Extracted Header Widget for AppBar title
  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(Assets.logo, width: 42.w, height: 42.h),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "Stay aware, stay safe.",
                fontSize: 11.5.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.appBlack1,
              ),
              CustomText(
                text: "ذمہ دار ڈرائیونگ سے ہی محفوظ شہر ممکن ہے",
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.appBlack1,
              ),
            ],
          ),
        ),
        Icon(
          Icons.notifications_none,
          size: 28.sp,
          color: AppColors.primary,
        ),
      ],
    );
  }

  Widget _analysisSection(dynamic data) {
    return ChallanAnalysisSection(
      title: "Amount Analysis",
      firstChartTitle: "Amount Comparison",
      firstChart: ChallanBarChart(data: data, showAmount: true),
      secondChartTitle: "Amount Distribution",
      secondChart: ChallanPieChart(data: data, showAmount: true),
    );
  }
}