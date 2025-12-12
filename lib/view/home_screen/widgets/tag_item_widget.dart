import 'package:flutter/material.dart';
import 'package:pinterest_ui/view/components/custom_text/custom_text.dart';
// import 'package:pinterest_ui/utils/app_size/app_size.dart'; // Unused
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TagItemWidget extends StatelessWidget {
  final String tag;

  const TagItemWidget({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: CustomText(text: tag, fontSize: 12.sp, color: Colors.black),
    );
  }
}
