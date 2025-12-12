# 🎨 Pinterest UI Clone

A high-fidelity Flutter implementation of a Pinterest-style user interface, featuring a responsive staggered grid layout, video playback integration, and a modern aesthetic design. This project demonstrates advanced layout handling and responsive UI principles in Flutter.

## ✨ Features

- **Staggered Grid Layout**: Implements a dynamic, masonry-style grid that perfectly mimics the Pinterest feed.
- **Mixed Content Support**: Seamlessly displays both static images and video content within the feed.
- **Responsive Design**: utilizing `flutter_screenutil` to ensure pixel-perfect rendering across varied screen sizes (optimized for 375x812 design).
- **Video Autoplay**: Smart visibility detection handles video playback, autoplaying videos when they come into view.
- **SVG Assest Integration**: High-quality SVG icons for a crisp, scalable UI.
- **Modern Aesthetic**: Clean lines, smooth interactions (hover effects, long-press to play), and a curated color palette.
- **Named Routing**: Clean navigation structure using `GetX` named routes.

## 🛠 Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **State Management & Routing**: [GetX](https://pub.dev/packages/get)
- **Responsive UI**: [flutter_screenutil](https://pub.dev/packages/flutter_screenutil)
- **Grid Layout**: [flutter_staggered_grid_view](https://pub.dev/packages/flutter_staggered_grid_view)
- **Video Player**: [video_player](https://pub.dev/packages/video_player)
- **Assets**: [flutter_svg](https://pub.dev/packages/flutter_svg) & [cached_network_image](https://pub.dev/packages/cached_network_image)
- **Visibility Detection**: [visibility_detector](https://pub.dev/packages/visibility_detector)

## 📂 Project Structure

```
lib/
├── core/
│   └── app_routes/       # Application routing constants
├── models/               # Data models (FeedItem)
├── utils/
│   ├── app_colors/       # Centralized color palette
│   ├── app_const/        # Asset paths (IconPath, LogoPath)
│   └── app_size/         # Responsive size configurations
├── view/
│   ├── components/       # Reusable UI components (CustomImage, CustomText)
│   └── home_screen/      # Main feature screens and controllers
│       ├── controller/   # HomeController (Logic for feed & video)
│       └── widgets/      # Screen-specific widgets (FeedItemWidget, HomeAppbar)
└── main.dart             # Application entry point
```

## 🚀 Getting Started

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/pinterest_ui.git
    ```
2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
3.  **Run the app:**
    ```bash
    flutter run
    ```

## 📸 Design

The UI is designed to closely match high-fidelity screenshots, focusing on:
- Exact icon sizing and positioning.
- Correct typography and spacing.
- Pinterest-like "Waterfall" layout.

---
*Built with ❤️ using Flutter*
