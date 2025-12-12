import 'package:get/get.dart';
import 'package:pinterest_ui/models/feed_item_model.dart';
import 'package:video_player/video_player.dart';

class HomeDetailsController extends GetxController {
  late FeedItem item;
  RxList<FeedItem> relatedItems = <FeedItem>[].obs;

  VideoPlayerController? videoController;
  final RxBool isPlaying = false.obs;
  final RxBool isInitialized = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is FeedItem) {
      item = Get.arguments as FeedItem;
      if (item.isVideo && item.videoUrl != null) {
        _initializeVideo(item.videoUrl!);
      }
    } else {
      // Fallback or error handling
      item = FeedItem(imageUrl: "", title: "Error");
    }
    _loadRelatedItems();
  }

  @override
  void onClose() {
    videoController?.dispose();
    super.onClose();
  }

  void _initializeVideo(String url) async {
    videoController = VideoPlayerController.networkUrl(Uri.parse(url));
    try {
      await videoController!.initialize();
      isInitialized.value = true;
      update();
    } catch (e) {
      print("Error initializing video: $e");
    }
  }

  void togglePlay() {
    if (videoController != null && videoController!.value.isInitialized) {
      if (videoController!.value.isPlaying) {
        videoController!.pause();
        isPlaying.value = false;
      } else {
        videoController!.play();
        isPlaying.value = true;
      }
    }
  }

  void _loadRelatedItems() {
    // Mock related items (similar to HomeScreen)
    relatedItems.value = [
      FeedItem(
        imageUrl:
            "https://images.unsplash.com/photo-1513584685908-95c9e1346610",
        title: "New Era of Creative Market...",
        aspectRatio: 0.8,
        authorName: item.authorName, // Maintain author for consistency in mock
      ),
      FeedItem(
        imageUrl: "https://images.unsplash.com/photo-1542385350-58c535496660",
        title: "Creative Marketing",
        aspectRatio: 1.2,
      ),
      FeedItem(
        imageUrl:
            "https://images.unsplash.com/photo-1531297461136-82lw9b629b3c",
        title: "Office Setup Ideas",
        aspectRatio: 1.0,
      ),
      FeedItem(
        imageUrl:
            "https://images.unsplash.com/photo-1517486808906-6ca8b3f04846",
        title: "Working from Home",
        aspectRatio: 1.5,
      ),
    ];
  }
}
