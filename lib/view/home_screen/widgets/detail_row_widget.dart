import 'package:flutter/material.dart';
import 'package:pinterest_ui/view/components/custom_text/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailRowWidget extends StatelessWidget {
  final String label;
  final String value;

  const DetailRowWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120.w,
          child: CustomText(
            text: label,
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
          child: CustomText(
            text: value,
            fontSize: 14.sp,
            color: Colors.grey.shade500,
            textAlign: TextAlign.start,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
