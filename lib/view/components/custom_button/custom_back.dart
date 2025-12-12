import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget implements PreferredSizeWidget {
  final bool isBack;
  const CustomBackButton({super.key, this.isBack = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isBack
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Get.back(),
            )
          : null,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
