import 'package:flutter/material.dart';
import 'package:pinterest_ui/view/components/custom_text/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatItemWidget extends StatelessWidget {
  final IconData icon;
  final String count;
  final Color color;

  const StatItemWidget({
    super.key,
    required this.icon,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 24.sp, color: color),
        CustomText(text: count, fontSize: 12.sp, fontWeight: FontWeight.w600),
      ],
    );
  }
}
