import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trafficlly/utills/export.dart';
class ShimmerClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        children: [
          // Summary card shimmer
          Container(
            height: 180.h,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(16.r),
            ),
            margin: EdgeInsets.only(bottom: 20.h),
          ),
          
          // Breakdown items shimmer
          ...List.generate(3, (index) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 80.h,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}