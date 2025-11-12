import 'package:trafficlly/models/dl_model.dart';
import 'package:trafficlly/utills/export.dart';
import 'package:trafficlly/widgets/App_Bar_Widget.dart';
import 'package:trafficlly/widgets/shimmer.dart';

class TotalDrivingLicencesView extends StatefulWidget {
  @override
  _TotalDrivingLicencesViewState createState() => _TotalDrivingLicencesViewState();
}

class _TotalDrivingLicencesViewState extends State<TotalDrivingLicencesView> {
  final DrivingLicenceController controller = Get.find<DrivingLicenceController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Driving Licences',
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: AppColors.white, size: 28.sp),
            onPressed: _showFilterBottomSheet,
          ),
          IconButton(
            icon: Icon(Icons.sync, color: AppColors.white, size: 28.sp),
            onPressed: controller.fetchLicenceDataWithDelay,
          ),
        ],
      ),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Obx(() => controller.isLoading.value && controller.isInitialLoad.value
          ? ShimmerClass()
          : _buildContent()),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        children: [
          _buildFilterBadge(),
          SizedBox(height: 20.h),
          DrivingLicencesInfoCard(
            selectedFilter: controller.selectedFilter.value,
            data: controller.licenceData.value,
            formatAmount: controller.formatAmount,
          ),
          SizedBox(height: 20.h),
          LearnerStatisticsCard(data: controller.licenceData.value),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Select Time Period',
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.appBlack1,
            ),
            SizedBox(height: 16.h),
            ...["Daily", "Weekly", "Monthly", "Yearly"]
                .map((filter) => ListTile(
                      dense: true,
                      leading: Icon(Icons.calendar_today_outlined, color: AppColors.primary, size: 24.sp),
                      title: CustomText(
                        text: filter,
                        fontSize: 16.sp,
                        color: AppColors.appBlack1,
                      ),
                      trailing: Obx(() => controller.selectedFilter.value.toLowerCase() == filter.toLowerCase()
                          ? Icon(Icons.check, color: AppColors.primary)
                          : SizedBox.shrink()),
                      onTap: () {
                        controller.changeFilter(filter.toLowerCase());
                        Get.back();
                      },
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}

class DrivingLicencesInfoCard extends StatelessWidget {
  final String selectedFilter;
  final DrivingLicenceModel data;
  final String Function(double) formatAmount;

  const DrivingLicencesInfoCard({
    required this.selectedFilter,
    required this.data,
    required this.formatAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.platinum, AppColors.nyanza ?? AppColors.bgGrey],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          Divider(thickness: 1, color: AppColors.primary.withOpacity(0.5), height: 20.h),
          _buildInfoRow(Icons.receipt, "Total Records", data.getTotalRecords(selectedFilter).toString(), AppColors.deepPurple),
          SizedBox(height: 10.h),
          Divider(thickness: 1, color: AppColors.grey.withOpacity(0.3), height: 20.h),
          _buildInfoRow(Icons.payments, "Paid Amount", "Rs. ${formatAmount(data.getPaidAmount(selectedFilter))}", AppColors.violatorHistory),
          _buildInfoRow(Icons.money_off, "Unpaid Amount", "Rs. ${formatAmount(data.getUnpaidAmount(selectedFilter))}", AppColors.appRed),
          _buildInfoRow(Icons.account_balance_wallet, "Total Amount", "Rs. ${formatAmount(data.getTotalAmount(selectedFilter))}", AppColors.primary),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.calendar_today, color: AppColors.primary, size: 24.sp),
        SizedBox(width: 8.w),
        CustomText(
          text: "${selectedFilter.capitalizeFirst} DL Summary",
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [Icon(icon, color: color, size: 22.sp), SizedBox(width: 12.w), CustomText(text: title, fontSize: 15.sp, fontWeight: FontWeight.w500, color: AppColors.appBlack1)]),
          CustomText(text: value, fontSize: 15.sp, fontWeight: FontWeight.bold, color: color),
        ],
      ),
    );
  }
}

class LearnerStatisticsCard extends StatelessWidget {
  final DrivingLicenceModel data;

  const LearnerStatisticsCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [BoxShadow(color: AppColors.grey.withOpacity(0.2), blurRadius: 6, offset: Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.school, color: AppColors.primary, size: 24.sp), SizedBox(width: 8.w), CustomText(text: "Learner Summary", fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.primary)]),
          Divider(thickness: 1, color: AppColors.primary.withOpacity(0.5), height: 20.h),
          _buildLearnerRow(Icons.verified, "Approved", data.approveLearner.toString(), AppColors.lime),
          _buildLearnerRow(Icons.hourglass_empty, "In Process", data.inprocessLearner.toString(), AppColors.appSecondary),
          _buildLearnerRow(Icons.pending, "Pending", data.pendingLearner.toString(), AppColors.amber),
          _buildLearnerRow(Icons.cancel, "Rejected", data.rejectedLearner.toString(), AppColors.appRed),
          Divider(thickness: 1, color: AppColors.grey.withOpacity(0.3), height: 20.h),
          CustomText(text: 'Applicant Gender', color: AppColors.black,
          fontSize: 18.0,

          ),
          _buildLearnerRow(Icons.male, "Male", data.maleLearner.toString(), AppColors.primary),
          _buildLearnerRow(Icons.female, "Female", data.femaleLearner.toString(), AppColors.deepPurple),
        ],
      ),
    );
  }

  Widget _buildLearnerRow(IconData icon, String title, String value, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [Icon(icon, color: color, size: 22.sp), SizedBox(width: 10.w), CustomText(text: title, fontSize: 15.sp, color: AppColors.appBlack1)]),
          CustomText(text: value, fontSize: 15.sp, fontWeight: FontWeight.bold, color: color),
        ],
      ),
    );
  }
}
