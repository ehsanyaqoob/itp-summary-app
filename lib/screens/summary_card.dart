import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trafficlly/models/dl_model.dart';
import 'package:trafficlly/screens/details_views/total_dl_amount.dart';
import 'package:trafficlly/screens/details_views/total_driving_licences.dart';
import 'package:trafficlly/utills/export.dart';
import 'package:intl/intl.dart';

class SummaryCards extends StatelessWidget {
  const SummaryCards({super.key});

  @override
  Widget build(BuildContext context) {
    final NumberFormat _amountFormat = NumberFormat('#,##0', 'en_PK');

    final ChallanController challanController = Get.find<ChallanController>();
    final DrivingLicenceController dlController =
        Get.find<DrivingLicenceController>();

    return Obx(() {
      final ChallanModel challan = challanController.challanData.value;
      final DrivingLicenceModel dlData = dlController.licenceData.value;

      final dlCollectionAmount = _amountFormat.format(
        dlData.getTotalAmount('daily'),
      );
      final challanTickets = challan.eTicket;
      final challanFineAmount = _amountFormat.format(challan.fineAmount);
      final dlRecords = dlData.getTotalRecords('daily').toString();

      final List<Map<String, dynamic>> cardsData = [
        {
          "icon": FontAwesomeIcons.ticket,
          "label": "$challanTickets\n Traffic Tickets",
          "startColor": AppColors.primary,
          "endColor": AppColors.appSecondary,
          "route": TotalChallansView(),
        },
        {
          "icon": FontAwesomeIcons.idCard,
          "label": "$dlRecords\n Driving Licences",
          "startColor": AppColors.violatorHistory,
          "endColor": AppColors.lime,
          "route": TotalDrivingLicencesView(),
        },
        {
          "icon": FontAwesomeIcons.moneyBill,
          "label": "Rs $challanFineAmount\n Traffic Tickets Fine Amount",
          "startColor": AppColors.challanAmountColor,
          "endColor": AppColors.accent,
          "route": TotalChallanAmount(),
        },
        {
          "icon": FontAwesomeIcons.sackDollar,
          "label": "Rs $dlCollectionAmount\n Driving Licences Collection Fee",
          "startColor": AppColors.appRed,
          "endColor": AppColors.orange,
          "route": TotalDlAmount(),
        },
      ];

      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 1.3,
        ),
        itemCount: cardsData.length,
        itemBuilder: (context, index) {
          final card = cardsData[index];
          return _buildCard(
            icon: card["icon"] as IconData,
            label: card["label"] as String,
            startColor: card["startColor"] as Color,
            endColor: card["endColor"] as Color,
            onTap: () => Get.to(card["route"]),
          );
        },
      );
    });
  }

  Widget _buildCard({
    required IconData icon,
    required String label,
    required Color startColor,
    required Color endColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18.0),
          boxShadow: [
            BoxShadow(
              color: startColor.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(4, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: -20,
              right: -20,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: -10,
              left: -10,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(icon, size: 32.sp, color: AppColors.white),
                    SizedBox(height: 8.h),
                    CustomText(
                      textAlign: TextAlign.center,
                      text: label,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white.withOpacity(0.95),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
