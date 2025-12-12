import 'package:get/get.dart';
import 'package:pinterest_ui/models/feed_item_model.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  RxList<FeedItem> feedItems = <FeedItem>[].obs;
  RxInt currentlyPlayingIndex = (-1).obs;

  final Map<int, VideoPlayerController> _videoControllers = {};
  RxMap<int, bool> isVideoInitialized = <int, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    _loadFeedItems();
  }

  @override
  void onClose() {
    for (var controller in _videoControllers.values) {
      controller.dispose();
    }
    super.onClose();
  }

  List<FeedItem> _allFeedItems = [];

  void _loadFeedItems() {
    _allFeedItems = [
      FeedItem(
        imageUrl: 'https://picsum.photos/id/1015/600/400', // River/Landscape
        title: 'New Era of Creative Marketplace',
        aspectRatio: 0.75,
      ),
      FeedItem(
        imageUrl: 'https://picsum.photos/id/1016/400/400', // Nature
        title: 'Innovative Marketplace Design H...',
        duration: '0:09',
        aspectRatio: 1.0,
        videoUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ),
      FeedItem(
        imageUrl: 'https://picsum.photos/id/1018/600/900', // Nature vertical
        title: 'Redefining the Creative Economy',
        aspectRatio: 1.5,
      ),
      FeedItem(
        imageUrl: 'https://picsum.photos/id/1019/600/500', // Tech/Architecture
        title: 'Modern Vision for a Creative Platf...',
        duration: '0:15',
        aspectRatio: 0.8,
        videoUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      ),
      FeedItem(
        imageUrl: 'https://picsum.photos/id/1025/600/700', // Dog in blanket
        title: 'Next-Level Design & Talent Mark...',
        aspectRatio: 1.2,
      ),
      FeedItem(
        imageUrl: 'https://picsum.photos/id/1021/600/400', // Foggy forest
        title: 'Digital Renaissance Marketplace...',
        duration: '0:11',
        aspectRatio: 0.7,
        videoUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ),
      FeedItem(
        imageUrl: 'https://picsum.photos/id/1022/600/800', // Dark sky
        title: 'Creative Network for the Future...',
        aspectRatio: 1.3,
      ),
      FeedItem(
        imageUrl: 'https://picsum.photos/id/1023/600/600', // Bear
        title: 'Smart & Scalable Creative Market...',
        aspectRatio: 1.0,
      ),
    ];
    feedItems.value = List.from(_allFeedItems);
  }

  void filterFeed(String type) {
    if (type == "Video") {
      feedItems.value = _allFeedItems.where((item) => item.isVideo).toList();
    } else if (type == "Profiles") {
      feedItems.value = _allFeedItems.where((item) => !item.isVideo).toList();
    } else {
      feedItems.value = List.from(_allFeedItems);
    }
  }

  VideoPlayerController? getVideoController(int index) {
    return _videoControllers[index];
  }

  void initializeVideo(int index, String videoUrl) {
    if (_videoControllers.containsKey(index)) return;

    final controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    _videoControllers[index] = controller;

    controller.initialize().then((_) {
      controller.setLooping(true);
      controller.setVolume(0);
      isVideoInitialized[index] = true;
    });
  }

  void updateVisibility(int index, double visibleFraction) {
    if (visibleFraction > 0.6) {
      if (currentlyPlayingIndex.value != index) {
        _stopCurrentVideo();
        currentlyPlayingIndex.value = index;
        _playVideo(index);
      }
    } else if (visibleFraction < 0.3 && currentlyPlayingIndex.value == index) {
      currentlyPlayingIndex.value = -1;
      _pauseVideo(index);
    }
  }

  void _playVideo(int index) {
    final controller = _videoControllers[index];
    if (controller != null && isVideoInitialized[index] == true) {
      controller.play();
    }
  }

  void _pauseVideo(int index) {
    final controller = _videoControllers[index];
    if (controller != null) {
      controller.pause();
      controller.seekTo(Duration.zero);
    }
  }

  void _stopCurrentVideo() {
    if (currentlyPlayingIndex.value != -1) {
      _pauseVideo(currentlyPlayingIndex.value);
    }
  }

  void manualPlay(int index) {
    if (currentlyPlayingIndex.value != index) {
      _stopCurrentVideo();
      currentlyPlayingIndex.value = index;
      _playVideo(index);
    }
  }

  void manualPause(int index) {
    if (currentlyPlayingIndex.value == index) {
      _pauseVideo(index);
      currentlyPlayingIndex.value = -1;
    }
  }
}
