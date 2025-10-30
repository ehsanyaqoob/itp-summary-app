import 'package:trafficlly/utills/export.dart';

import 'custom_text_formfield.dart';

class InfoCard extends StatelessWidget {
  final String username;
  final String fullName;

  const InfoCard({
    Key? key,
    required this.username,
    required this.fullName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildInfoColumn("Username", username),
          Container(
            height: 40,
            width: 1,
            color: Colors.white.withOpacity(0.7), // Vertical divider
          ),
          _buildInfoColumn("Full Name", fullName),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: 14,
          color: Colors.white70,
          fontWeight: FontWeight.w500,
          textDecorationStyle: TextDecorationStyle.solid,
        ),
        SizedBox(height: 4),
        CustomText(
          text: value,
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          textDecorationStyle: TextDecorationStyle.solid,
        ),
      ],
    );
  }
}
