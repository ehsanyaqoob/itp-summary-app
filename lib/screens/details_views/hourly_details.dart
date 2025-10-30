import 'package:intl/intl.dart';
import 'package:trafficlly/utills/export.dart';

class HourlySummary extends StatefulWidget {
  @override
  _HourlySummaryState createState() => _HourlySummaryState();
}

class _HourlySummaryState extends State<HourlySummary> {
  late Timer _timer;
  String currentTime = _getFormattedTime();
  String currentDate = _getFormattedDate();

  final List<Map<String, dynamic>> cardsData = [
     {
    "title": "Major Challan Hours",
    "percentage": "↑ 34%",
    "percentageColor": Colors.green,
    "route": HourlyChallansAnalytics(),  
  },
  {
    "title": "Major DL Hours",
    "percentage": "↓ 50%",
    "percentageColor": Colors.red,
    "route": HourlyDLAnalytics(), 
  },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = _getFormattedTime();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  static String _getFormattedTime() {
    return DateFormat('hh:mm:ss a').format(DateTime.now());
  }

  static String _getFormattedDate() {
    return DateFormat('dd MMM, yyyy').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(cardsData.length, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: _buildCard(cardsData[index]),
        );
      }),
    );
  }

  Widget _buildCard(Map<String, dynamic> card) {
    return GestureDetector(
  onTap: () => Get.to(card["route"]), 
      child: Container(
        height: 80.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: LinearGradient(
            colors: [AppColors.platinum.withOpacity(0.85), AppColors.nyanza],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: card["title"],
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  // color: Colors.white,
                ),
                SizedBox(height: 2),
                CustomText(
                  text: currentDate,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  // color: Colors.white70,
                ),
              ],
            ),

            CustomText(
              text: currentTime,
              fontSize: 14.sp,
              // color: Colors.white,
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              decoration: BoxDecoration(
                color: card["percentageColor"].withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: CustomText(
                text: card["percentage"],
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: card["percentageColor"],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
