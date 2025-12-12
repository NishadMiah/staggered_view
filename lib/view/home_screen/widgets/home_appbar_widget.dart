import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pinterest_ui/view/components/custom_image/custom_image.dart';
import 'package:pinterest_ui/view/components/custom_text/custom_text_field.dart';
import 'package:pinterest_ui/utils/app_colors/app_colors.dart';
// import 'package:pinterest_ui/utils/app_size/app_size.dart'; // Unused
import 'package:pinterest_ui/utils/app_size/app_sizes.dart';
import 'package:pinterest_ui/utils/app_const/icon_path.dart';
import 'package:pinterest_ui/utils/app_const/logo_path.dart';
import 'package:pinterest_ui/view/home_screen/controller/home_controller.dart'; // This is legacy controller
import 'package:pinterest_ui/core/app_routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSizes.padding,
      child: Column(
        children: [
          Gap(50.h),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              CustomImage(
                imageSrc: LogoPath.appLogo,
                height: 40.h,
                width: 100.w,
                boxFit: BoxFit.contain,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoute.notificationScreen);
                },
                child: Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.containerColor,
                  ),
                  child: CustomImage(
                    imageSrc: IconPath.notification,
                    height: 20.h,
                    width: 20.w,
                  ),
                ),
              ),
            ],
          ),
          Gap(16.h),
          CustomTextField(
            prefixIcon: Container(
              padding: EdgeInsets.all(8.r),
              child: CustomImage(
                imageSrc: IconPath.search,
                height: 20.h,
                width: 20.w,
              ),
            ),
            hintText: "Search",
            suffixIcon: PopupMenuButton<String>(
              color: Colors.white,
              offset: Offset(0, 40.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              onSelected: (value) {
                Get.find<HomeController>().filterFeed(value);
              },
              itemBuilder: (context) => [
                PopupMenuItem(value: "Video", child: Text("Video")),
                PopupMenuItem(value: "Profiles", child: Text("Profiles")),
              ],
              child: Container(
                padding: EdgeInsets.all(14.r),
                child: CustomImage(
                  imageSrc: IconPath.filter,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(130.h);
}
