import 'package:flutter/material.dart';
import 'package:trafficlly/utills/colors.dart';
import 'package:trafficlly/widgets/App_Bar_Widget.dart';
import 'package:trafficlly/widgets/custom_text.dart';

class HourlyChallansAnalytics extends StatefulWidget {
  const HourlyChallansAnalytics({super.key});

  @override
  State<HourlyChallansAnalytics> createState() =>
      _HourlyChallansAnalyticsState();
}

class _HourlyChallansAnalyticsState extends State<HourlyChallansAnalytics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Challans Analytics',
      ),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "Challan Analysis",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Bar Chart Placeholder
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: CustomText(
                    text: "Bar Chart ",
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 20),

                // Pie Chart Placeholder
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: CustomText(
                    text: "Pie Chart ",
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
