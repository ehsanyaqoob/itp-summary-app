import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trafficlly/widgets/custom_text.dart';
import '../utills/colors.dart';

class CustomTabView extends StatefulWidget {
  final List<TabItem> tabs;

  const CustomTabView({Key? key, required this.tabs}) : super(key: key);

  @override
  _CustomTabViewState createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ✅ Scrollable Tabs with Animated Pills
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(widget.tabs.length, (index) {
              bool isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  margin: EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    gradient: isSelected
                        ? LinearGradient(
                            colors: [AppColors.primary, AppColors.secondary],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : LinearGradient(
                            colors: [Colors.white, Colors.white],
                          ),
                    borderRadius: BorderRadius.circular(18.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 10,
                        offset: Offset(4, 6),
                      ),
                    ],
                    border: Border.all(color: AppColors.primary, width: 0.5),
                  ),
                  child: Center(
                    child: CustomText(
                      text: widget.tabs[index].title,
                      color: isSelected ? Colors.white : Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),

        SizedBox(height: 10),

        // ✅ Tab Views
        Expanded(
          child: IndexedStack(
            index: selectedIndex,
            children: widget.tabs.map((tab) => tab.view).toList(),
          ),
        ),
      ],
    );
  }
}

// ✅ TabItem Model
class TabItem {
  final String title;
  final Widget view;

  TabItem({required this.title, required this.view});
}

// ✅ Dashboard Views
class ChallansView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SummaryCard(
          title: "Total Challans",
          value: "250",
          icon: Icons.receipt,
          color: AppColors.primary,
        ),
        SummaryCard(
          title: "Pending Challans",
          value: "50",
          icon: Icons.warning_amber_rounded,
          color: AppColors.primary,
        ),
      ],
    );
  }
}

class DlAmountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SummaryCard(
          title: "Total DL Amount",
          value: "PKR 500,000",
          icon: Icons.account_balance_wallet,
          color: AppColors.primary,
        ),
      ],
    );
  }
}

class ChallanAmountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SummaryCard(
          title: "Total Challan Amount",
          value: "PKR 1,200,000",
          icon: Icons.money,
          color: AppColors.primary,
        ),
      ],
    );
  }
}

class DrivingLicencesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SummaryCard(
          title: "Total Licences Issued",
          value: "10,000",
          icon: Icons.badge,
          color: AppColors.primary,
        ),
      ],
    );
  }
}

// ✅ Summary Card Widget
class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const SummaryCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: color, size: 32),
        title: CustomText(
          text: title,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
        subtitle: CustomText(
          text: value,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: Colors.grey[700]!,
        ),
      ),
    );
  }
}
