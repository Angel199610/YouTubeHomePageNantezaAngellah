import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/video_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of different video thumbnails
    List<String> thumbnails = [
      'https://pbs.twimg.com/media/F0uv1NwXwAESyaF?format=jpg&name=4096x4096',
      'https://pbs.twimg.com/profile_images/1600947977455128576/3NHgKZE1_400x400.jpg',
      'https://blog.flutterflow.io/content/images/size/w1200/2022/03/flutter_mux_live_cover_wide.png',
      'https://blog.flutterflow.io/content/images/size/w1200/2022/03/flutter_mux_live_cover_wide.png',
      'https://blog.flutterflow.io/content/images/size/w1200/2022/03/flutter_mux_live_cover_wide.png',
      'https://blog.flutterflow.io/content/images/size/w1200/2022/03/flutter_mux_live_cover_wide.png',
    ];

    // List of video titles
    List<String> titles = [
      'Who is Your Father? by Rev.Kesiena Esiri',
      'Holy Ghost Power by Rev. Kesiena Esiri',
      'Mastering FlutterFlow',
      'Understanding State Management',
      'Building Responsive UIs',
      'Deploying Flutter Apps'
    ];

    // List of channel names
    List<String> channelNames = [
      'Remnant Christian Network',
      'Remnant Christian Network (RCN)',
      'Build fully functional apps with Firebase integration. FlutterFlow Official',
      'CodeWithMe. Africa Talk Uganda',
      'Control every pixel to create customized designs. GDG UI Experts',
      'Build, test, and deploy beautiful mobile, web, desktop. DevOps Academy',
    ];

    // List of views
    List<String> views = [
      '1.5M views',
      '950K views',
      '450K views',
      '780K views',
      '1.2M views',
      '600K views',
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(56.0), // Set the height of the app bar
        child: CustomAppBar(),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Column(
        children: [
          // Video categories (horizontal scrolling)
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CategoryButton(label: 'All'),
                CategoryButton(label: 'Music'),
                CategoryButton(label: 'Gaming'),
                CategoryButton(label: 'News'),
              ],
            ),
          ),
          // Expanded to let the GridView take up available space
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Add padding around the grid
              child: GridView.builder(
                itemCount: thumbnails.length, // Number of thumbnails
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 thumbnails per row
                  crossAxisSpacing:
                      5.0, // Space between thumbnails horizontally
                  mainAxisSpacing: 20.0, // Space between thumbnails vertically
                  childAspectRatio: 16 / 16, // Aspect ratio of video thumbnails
                ),
                itemBuilder: (context, index) {
                  return VideoCard(
                    title: titles[index], // Different title for each video
                    thumbnailUrl: thumbnails[index], // Different thumbnail
                    channelName: channelNames[index], // Different channel name
                    views: views[index], // Different view count
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Category button widget
class CategoryButton extends StatelessWidget {
  final String label;

  const CategoryButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(label),
      ),
    );
  }
}
