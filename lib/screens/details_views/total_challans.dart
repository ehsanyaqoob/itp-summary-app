import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trafficlly/utills/export.dart';
import 'package:trafficlly/widgets/app_bar_widget.dart';
import 'package:trafficlly/widgets/challan_analysis_section.dart';
import 'package:trafficlly/widgets/challan_bar_chart.dart';
import 'package:trafficlly/widgets/challan_pie_chart.dart';
import 'package:trafficlly/widgets/shimmer.dart';

class TotalChallansView extends StatelessWidget {
  final ChallanController controller = Get.find<ChallanController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Challan Tickets',
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: AppColors.white, size: 28.sp),
            onPressed: _showFilterBottomSheet,
          ),
          IconButton(
            icon: Icon(Icons.sync, color: AppColors.white, size: 28.sp),
            onPressed: controller.fetchChallanDataOnFilter,
          ),
        ],
      ),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Obx(() {
        if (controller.isLoading.value || controller.isInitialLoad.value) {
          return ShimmerClass();
        }
        return _buildContent();
      }),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        children: [
          _buildFilterBadge(),
          SizedBox(height: 20.h),
          _buildSummaryCard(),
          SizedBox(height: 20.h),
          _buildTicketBreakdown(),
          SizedBox(height: 20.h),
          ChallanAnalysisSection(
            title: "Ticket Analysis",
            firstChartTitle: "Ticket Comparison",
            firstChart: ChallanBarChart(data: controller.challanData.value, showAmount: false),
            secondChartTitle: "Ticket Distribution",
            secondChart: ChallanPieChart(data: controller.challanData.value),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBadge() {
    return Center(
      child: Obx(() => Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: AppColors.primary.withOpacity(0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.calendar_today, size: 16.sp, color: AppColors.primary),
                SizedBox(width: 8.w),
                CustomText(
                  text: controller.selectedFilter.value.capitalizeFirst ?? "Daily",
                  fontSize: 14.sp,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildSummaryCard() {
    final challanData = controller.challanData.value;
    final totalTickets = challanData.eTicket;
    final paidPercentage = totalTickets == 0 ? 0.0 : challanData.paidTickets / totalTickets;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, AppColors.appSecondary],
          ),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            CustomText(
              text: 'Total Tickets Issued',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.white.withOpacity(0.9),
            ),
            SizedBox(height: 12.h),
            CustomText(
              text: totalTickets.toString(),
              fontSize: 36.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
            SizedBox(height: 16.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(3.r),
              child: LinearProgressIndicator(
                value: paidPercentage,
                backgroundColor: AppColors.white.withOpacity(0.3),
                color: AppColors.lime, 
                minHeight: 6.h,
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatItem('Paid', challanData.paidTickets.toString(), AppColors.lime),
                _buildStatItem('Unpaid', challanData.unpaidTickets.toString(), AppColors.appRed),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value, Color color) {
    return Column(
      children: [
        CustomText(
          text: label,
          fontSize: 14.sp,
          color: AppColors.white.withOpacity(0.8),
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 4.h),
        CustomText(
          text: value,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ],
    );
  }

  Widget _buildTicketBreakdown() {
    final challanData = controller.challanData.value;
    final paidPercent = controller.paidPercentage.toStringAsFixed(1);
    final unpaidPercent = controller.unpaidPercentage.toStringAsFixed(1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: CustomText(
            text: 'Ticket Breakdown',
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.appBlack1,
          ),
        ),
        SizedBox(height: 12.h),
        _buildBreakdownItem(
          icon: Icons.check_circle_outlined,
          label: 'Paid Tickets',
          value: '${challanData.paidTickets} ($paidPercent%)',
          color: AppColors.lime,
        ),
        SizedBox(height: 10.h),
        _buildBreakdownItem(
          icon: Icons.pending_actions_outlined,
          label: 'Unpaid Tickets',
          value: '${challanData.unpaidTickets} ($unpaidPercent%)',
          color: AppColors.orange,
        ),
      ],
    );
  }

  Widget _buildBreakdownItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.appBlack1.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: CustomText(
              text: label,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.appBlack1,
            ),
          ),
          CustomText(
            text: value,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ],
      ),
    );
  }

  void _showFilterBottomSheet() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: 'Select Time Period',
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.appBlack1,
            ),
            SizedBox(height: 16.h),
            ...['Daily', 'Weekly', 'Monthly', 'Yearly', 'Overall'].map((filter) => ListTile(
                  leading: Icon(Icons.calendar_today_outlined, color: AppColors.primary),
                  title: CustomText(
                    text: filter,
                    fontSize: 16.sp,
                    color: AppColors.appBlack1,
                  ),
                  trailing: Obx(() => controller.selectedFilter.value.toLowerCase() == filter.toLowerCase()
                      ? Icon(Icons.check, color: AppColors.primary)
                      : SizedBox()),
                  onTap: () {
                    controller.changeFilter(filter.toLowerCase());
                    Get.back(); 
                  },
                )),
          ],
        ),
      ),
    );
  }
}