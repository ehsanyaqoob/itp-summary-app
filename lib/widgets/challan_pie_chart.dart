import 'package:fl_chart/fl_chart.dart';
import 'package:trafficlly/utills/export.dart';

class ChallanPieChart extends StatelessWidget {
  final ChallanModel data;
  final bool showAmount;

  const ChallanPieChart({
    required this.data,
    this.showAmount = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalValue = showAmount 
        ? data.fineAmount 
        : (data.paidTickets + data.unpaidTickets).toDouble();
    final paidValue = showAmount ? data.paidAmount : data.paidTickets.toDouble();
    final unpaidValue = showAmount ? data.unpaidAmount : data.unpaidTickets.toDouble();
    
    final paidPercent = totalValue > 0 ? (paidValue / totalValue) * 100 : 0;
    final unpaidPercent = totalValue > 0 ? (unpaidValue / totalValue) * 100 : 0;

    return Stack(
      alignment: Alignment.center,
      children: [
        PieChart(
          PieChartData(
            centerSpaceRadius: 60,
            sectionsSpace: 2,
            startDegreeOffset: -90,
            sections: [
              PieChartSectionData(
                value: paidValue,
                color: AppColors.lime,
                title: paidValue > 0 ? '${paidPercent.toStringAsFixed(1)}%' : '',
                radius: 60,
                titleStyle: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                badgeWidget: _badgeWidget(Icons.check, AppColors.lime),
                badgePositionPercentageOffset: 0.98,
              ),
              PieChartSectionData(
                value: unpaidValue,
                color: AppColors.appRed,
                title: unpaidValue > 0 ? '${unpaidPercent.toStringAsFixed(1)}%' : '',
                radius: 60,
                titleStyle: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                badgeWidget: _badgeWidget(Icons.close, AppColors.appRed),
                badgePositionPercentageOffset: 0.98,
              ),
            ],
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              showAmount ? 'Amount' : 'Tickets',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.text,
              ),
            ),
            SizedBox(height: 4),
            CustomText(
              text: 
              showAmount 
                  ? 'PKR ${totalValue.toStringAsFixed(0)}'
                  : totalValue.toInt().toString(),
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.appBlack1,
            
            ),
          ],
        )
      ],
    );
  }

  Widget _badgeWidget(IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Icon(icon, size: 16, color: AppColors.white),
    );
  }
}