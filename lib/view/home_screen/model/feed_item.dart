class FeedItem {
  final String imageUrl;
  final String title;
  final String? duration;
  final bool isVideo;
  final double aspectRatio;
  final String? videoUrl;

  // New Fields for Details Screen
  final String authorName;
  final String authorAvatar;
  final String clientName;
  final String businessName;
  final String phoneNumber;
  final String website;
  final String socialMedia;
  final String location;
  final String description;
  final List<String> tags;
  final String likes;
  final String views;
  final String shares;

  FeedItem({
    required this.imageUrl,
    required this.title,
    this.duration,
    this.isVideo = false,
    this.aspectRatio = 1.0,
    this.videoUrl,
    // Details Fields
    this.authorName = "Zain Tariq",
    this.authorAvatar =
        "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d",
    this.clientName = "Sarah Khan",
    this.businessName = "Khan Digital Agency",
    this.phoneNumber = "01824821720",
    this.website = "www.khanzone.com",
    this.socialMedia = "facebook.com/rahimstore",
    this.location = "Dhaka, Bangladesh",
    this.description =
        "A modern and minimal aesthetic image perfect for inspiration. This visual is ideal for mood boards, creative ideas, and trending -style content.",
    this.tags = const [
      "Modern style",
      "creative shot",
      "clean design",
      "photography idea",
      "minimal aesthetic",
    ],
    this.likes = "62",
    this.views = "1k",
    this.shares = "20",
  });
}
