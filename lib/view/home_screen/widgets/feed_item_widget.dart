import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinterest_ui/view/components/custom_image/custom_network_image.dart';
import 'package:pinterest_ui/view/components/custom_text/custom_text.dart';
// import 'package:pinterest_ui/utils/app_size/app_size.dart'; // Unused
import 'package:pinterest_ui/view/home_screen/controller/home_controller.dart';
import 'package:pinterest_ui/models/feed_item_model.dart';
import 'package:pinterest_ui/core/app_routes/app_routes.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:visibility_detector/visibility_detector.dart';

class FeedItemWidget extends StatelessWidget {
  final FeedItem item;
  final int index;

  const FeedItemWidget({super.key, required this.item, required this.index});

  void _handleVisibilityChanged(VisibilityInfo info) {
    if (item.isVideo) {
      Get.find<HomeController>().updateVisibility(index, info.visibleFraction);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    if (item.isVideo && item.videoUrl != null) {
      controller.initializeVideo(index, item.videoUrl!);
    }

    return VisibilityDetector(
      key: Key('${item.imageUrl}_$index'),
      onVisibilityChanged: _handleVisibilityChanged,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoute.homeDetailsScreen, arguments: item);
        },
        onLongPress: () => controller.manualPlay(index),
        onLongPressEnd: (_) => controller.manualPause(index),
        child: MouseRegion(
          onEnter: (_) => controller.manualPlay(index),
          onExit: (_) => controller.manualPause(index),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: AspectRatio(
                      aspectRatio: item.aspectRatio,
                      child: Stack(
                        children: [
                          CustomNetworkImage(
                            imageUrl: item.imageUrl,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          if (item.isVideo)
                            Obx(() {
                              final isPlaying =
                                  controller.currentlyPlayingIndex.value ==
                                  index;
                              final isInitialized =
                                  controller.isVideoInitialized[index] == true;
                              final videoController = controller
                                  .getVideoController(index);

                              if (isPlaying &&
                                  isInitialized &&
                                  videoController != null) {
                                return Positioned.fill(
                                  child: VideoPlayer(videoController),
                                );
                              }
                              return const SizedBox.shrink();
                            }),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: Container(
                      padding: EdgeInsets.all(6.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite_border,
                        size: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  if (item.isVideo && item.duration != null)
                    Positioned(
                      top: 8.h,
                      left: 8.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          item.duration!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 8.h),
              CustomText(
                text: item.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
