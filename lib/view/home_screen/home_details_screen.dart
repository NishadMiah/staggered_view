import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pinterest_ui/view/components/custom_button/custom_back.dart';
import 'package:pinterest_ui/view/components/custom_image/custom_network_image.dart';
import 'package:pinterest_ui/view/components/custom_text/custom_text.dart';
import 'package:pinterest_ui/utils/app_colors/app_colors.dart';
// import 'package:pinterest_ui/utils/app_size/app_size.dart'; // Unused
import 'package:pinterest_ui/utils/app_size/app_sizes.dart';
import 'package:pinterest_ui/view/home_screen/controller/home_details_controller.dart';
import 'package:pinterest_ui/view/home_screen/widgets/feed_item_widget.dart';
import 'package:pinterest_ui/view/home_screen/widgets/detail_row_widget.dart';
import 'package:pinterest_ui/view/home_screen/widgets/stat_item_widget.dart';
import 'package:pinterest_ui/view/home_screen/widgets/tag_item_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:video_player/video_player.dart';

class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeDetailsController controller = Get.put(HomeDetailsController());
    final item = controller.item;

    return Scaffold(
      appBar: CustomBackButton(isBack: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSizes.padding,
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.containerColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r),
                      ),
                      child: SizedBox(
                        height: 157.h,
                        width: double.infinity,
                        child: item.isVideo
                            ? GetBuilder<HomeDetailsController>(
                                builder: (controller) {
                                  if (controller.isInitialized.value &&
                                      controller.videoController != null) {
                                    return Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        VideoPlayer(
                                          controller.videoController!,
                                        ),
                                        GestureDetector(
                                          onTap: controller.togglePlay,
                                          child: Container(
                                            color: Colors.transparent,
                                            child: Obx(
                                              () => !controller.isPlaying.value
                                                  ? Container(
                                                      padding: EdgeInsets.all(
                                                        12.r,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        Icons.play_arrow,
                                                        size: 48.sp,
                                                        color: Colors.white,
                                                      ),
                                                    )
                                                  : SizedBox.shrink(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Stack(
                                      children: [
                                        CustomNetworkImage(
                                          imageUrl: item.imageUrl,
                                          height: 300.h,
                                          width: double.infinity,
                                        ),
                                        Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ],
                                    );
                                  }
                                },
                              )
                            : CustomNetworkImage(
                                imageUrl: item.imageUrl,
                                height: 300.h,
                                width: double.infinity,
                              ),
                      ),
                    ),
                    Gap(10.h),

                    Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CustomNetworkImage(
                                imageUrl: item.authorAvatar,
                                height: 40.h,
                                width: 40.w,
                                boxShape: BoxShape.circle,
                              ),
                              Gap(12.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: item.authorName,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  CustomText(
                                    text: "Inspire",
                                    fontSize: 12.sp,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              StatItemWidget(
                                icon: Icons.favorite,
                                count: item.likes,
                                color: Colors.red,
                              ),
                              Gap(16.w),
                              StatItemWidget(
                                icon: Icons.remove_red_eye_outlined,
                                count: item.views,
                                color: Colors.grey,
                              ),
                              Gap(16.w),
                              StatItemWidget(
                                icon: Icons.share_outlined,
                                count: item.shares,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Gap(15.h),

              DetailRowWidget(label: "Client Name:", value: item.clientName),
              Gap(8.h),
              DetailRowWidget(
                label: "Business Name:",
                value: item.businessName,
              ),
              Gap(8.h),
              DetailRowWidget(label: "Phone Number:", value: item.phoneNumber),
              Gap(8.h),
              DetailRowWidget(label: "Website:", value: item.website),
              Gap(8.h),
              DetailRowWidget(label: "social media:", value: item.socialMedia),
              Gap(8.h),
              DetailRowWidget(label: "location:", value: item.location),

              Gap(16.h),

              CustomText(
                text: "Modern Aesthetic Visual Inspiration",
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.start,
              ),
              Gap(12.h),
              CustomText(
                text: item.description,
                fontSize: 14.sp,
                color: Colors.grey.shade600,
                textAlign: TextAlign.start,
                maxLines: 5,
              ),

              Gap(16.h),

              CustomText(
                text: "Tag",
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.start,
              ),
              Gap(12.h),
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: item.tags
                    .map((tag) => TagItemWidget(tag: tag))
                    .toList(),
              ),

              Gap(20.h),

              MasonryGridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.w,
                itemCount: controller.relatedItems.length,
                itemBuilder: (context, index) {
                  final relatedItem = controller.relatedItems[index];
                  return FeedItemWidget(item: relatedItem, index: index);
                },
              ),
              Gap(30.h),
            ],
          ),
        ),
      ),
    );
  }
}
