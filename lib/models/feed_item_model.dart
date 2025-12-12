class FeedItem {
  final String imageUrl;
  final String? videoUrl;
  final String title;
  final String description;
  final String? duration;

  // Legacy fields
  final double aspectRatio;
  final String authorName;
  final String authorAvatar;
  final String likes;
  final String views;
  final String shares;
  final String clientName;
  final String businessName;
  final String phoneNumber;
  final String website;
  final String socialMedia;
  final String location;
  final List<String> tags;

  FeedItem({
    required this.imageUrl,
    this.videoUrl,
    required this.title,
    this.description = '',
    this.duration,
    this.aspectRatio = 1.0,
    this.authorName = 'Unknown',
    this.authorAvatar = '',
    this.likes = '0',
    this.views = '0',
    this.shares = '0',
    this.clientName = '',
    this.businessName = '',
    this.phoneNumber = '',
    this.website = '',
    this.socialMedia = '',
    this.location = '',
    this.tags = const [],
  });

  bool get isVideo => videoUrl != null && videoUrl!.isNotEmpty;
}
