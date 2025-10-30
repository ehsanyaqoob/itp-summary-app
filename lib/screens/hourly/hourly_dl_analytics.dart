import 'package:flutter/material.dart';
import 'package:trafficlly/utills/colors.dart';
import 'package:trafficlly/widgets/App_Bar_Widget.dart';
import 'package:trafficlly/widgets/custom_text.dart';

class HourlyDLAnalytics extends StatefulWidget {
  const HourlyDLAnalytics({super.key});

  @override
  State<HourlyDLAnalytics> createState() => _HourlyDLAnalyticsState();
}

class _HourlyDLAnalyticsState extends State<HourlyDLAnalytics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Hourly DL Analytics',
      ),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            const HourlyDLAnalysisSection(),
          ],
        ),
      ),
    );
  }
}

class HourlyDLAnalysisSection extends StatelessWidget {
  const HourlyDLAnalysisSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: "DL Analysis",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Placeholder for Bar Chart
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

        // Placeholder for Pie Chart
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
    );
  }
}