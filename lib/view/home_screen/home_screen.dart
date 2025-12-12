import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
// import 'package:stan/core/utils/app_sizer.dart'; // Wait, I need to fix this one too.
// import 'package:pinterest_ui/utils/app_size/app_size.dart'; // Unused
import 'package:pinterest_ui/utils/app_size/app_sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinterest_ui/view/home_screen/controller/home_controller.dart';
// import 'package:pinterest_ui/view/widgets/feed_item_widget.dart'; // REMOVED NEW WIDGET
import 'package:pinterest_ui/view/home_screen/widgets/feed_item_widget.dart'; // Using the one in the same folder structure
import 'package:pinterest_ui/view/home_screen/widgets/home_appbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      appBar: HomeAppbarWidget(),
      body: Padding(
        padding: AppSizes.padding,
        child: Obx(
          () => MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16.h,
            crossAxisSpacing: 12.w,
            itemCount: homeController.feedItems.length,
            itemBuilder: (context, index) {
              return FeedItemWidget(
                item: homeController.feedItems[index],
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }
}
