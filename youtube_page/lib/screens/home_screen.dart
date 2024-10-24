import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/video_card.dart';

// CategoryButton widget for the categories at the top
class CategoryButton extends StatelessWidget {
  final String label;

  const CategoryButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ElevatedButton(
        onPressed: () {
          // Action when the button is pressed
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 253, 253, 253),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),  // Rounded corners
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Color.fromARGB(255, 9, 9, 9)),
        ),
      ),
    );
  }
}

// Main HomeScreen widget
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of different video thumbnails
    List<String> thumbnails = [
      'https://pbs.twimg.com/profile_images/1600947977455128576/3NHgKZE1_400x400.jpg',
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
      'Deploying Flutter Apps',
    ];

    // List of channel names
    List<String> channelNames = [
      'Remnant Christian Network Ghana.',
      'Remnant Christian Network Warri. (RCN)',
      'Design professional screens. FlutterFlow Official.',
      'CodeWithMe.',
      'GDG UI Experts.',
      'DevOps Academy.',
    ];

    // List of views
    List<String> views = [
      '3 months ago. 1.5M views',
      '2 months ago. 950K views',
      '2 days ago. 450K views',
      '3 years ago. 780K views',
      '5 months ago. 1.2M views',
      '10 months ago. 600K views',
    ];

    // List of video URLs
    List<String> videoUrls = [
      'https://www.youtube.com/watch?v=ZTghat-vrH0',
      'https://www.youtube.com/watch?v=ZTghat-vrH0',
      'https://www.youtube.com/watch?v=Mao8syRG6UE',
      'https://www.youtube.com/watch?v=Mao8syRG6UE',
      'https://www.youtube.com/watch?v=Mao8syRG6UE',
      'https://www.youtube.com/watch?v=Mao8syRG6UE',
    ];

    // List of YouTube Shorts thumbnails and URLs
    List<String> shortsThumbnails = [
      'https://blog.flutterflow.io/content/images/size/w1200/2022/03/flutter_mux_live_cover_wide.png',
      'https://pbs.twimg.com/profile_images/1600947977455128576/3NHgKZE1_400x400.jpg',
      'https://blog.flutterflow.io/content/images/size/w1200/2022/03/flutter_mux_live_cover_wide.png',
    ];

    List<String> shortsUrls = [
      'https://www.youtube.com/shorts/Btsr6z35K3Q',
      'https://www.youtube.com/shorts/Btsr6z35K3Q',
      'https://www.youtube.com/shorts/Btsr6z35K3Q',
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0), // Set the height of the app bar
        child: CustomAppBar(),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SingleChildScrollView(
        // Allows entire screen to scroll
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  CategoryButton(label: 'Podcast'),
                ],
              ),
            ),

            // Add space between category buttons and videos
            const SizedBox(height: 20), // Adjust the height as needed

            // First set of videos
            GridView.builder(
              shrinkWrap: true, // Make sure GridView doesn't take infinite height
              physics: const NeverScrollableScrollPhysics(), // Disable scrolling inside GridView
              itemCount: 4, // Display 4 videos initially
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 thumbnails per row
                crossAxisSpacing: 5.0, // Space between thumbnails horizontally
                mainAxisSpacing: 20.0, // Space between thumbnails vertically
                childAspectRatio: 16 / 16, // Aspect ratio of video thumbnails
              ),
              itemBuilder: (context, index) {
                return VideoCard(
                  title: titles[index], // Different title for each video
                  thumbnailUrl: thumbnails[index], // Different thumbnail
                  channelName: channelNames[index], // Different channel name
                  views: views[index], // Different view count
                  videoUrl: videoUrls[index], // Different video URL
                );
              },
            ),

            // YouTube Shorts Section (Horizontal scrolling)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.play_circle_outline,
                          color: Colors.white,
                          size: 24, // Adjusting the size of the icon
                        ),
                        SizedBox(width: 8), // Space between the icon and text
                        Text(
                          'Shorts',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300, // Set height for Shorts section
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: shortsThumbnails.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            // Launch the Shorts URL when the card is tapped
                            if (await canLaunchUrl(Uri.parse(shortsUrls[index]))) {
                              await launchUrl(Uri.parse(shortsUrls[index]));
                            } else {
                              throw 'Could not launch ${shortsUrls[index]}';
                            }
                          },
                          child: Container(
                            width: 150, // Width of each Short
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Thumbnail for the short with round border
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0), // Round border
                                  child: AspectRatio(
                                    aspectRatio: 9 / 16, // Vertical video aspect ratio
                                    child: Image.network(
                                      shortsThumbnails[index],
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return const Center(
                                          child: Icon(Icons.broken_image, color: Colors.grey),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                // Short description
                                const Text(
                                  'Build apps with no code', // Update this for each short as needed
                                  style: TextStyle(color: Colors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Add space between Shorts and remaining videos
            const SizedBox(height: 20), // Adjust the height as needed

            // Remaining set of videos
            GridView.builder(
              shrinkWrap: true, // Make sure GridView doesn't take infinite height
              physics: const NeverScrollableScrollPhysics(), // Disable scrolling inside GridView
              itemCount: 2, // Display remaining 2 videos
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 thumbnails per row
                crossAxisSpacing: 5.0, // Space between thumbnails horizontally
                mainAxisSpacing: 20.0, // Space between thumbnails vertically
                childAspectRatio: 16 / 16, // Aspect ratio of video thumbnails
              ),
              itemBuilder: (context, index) {
                return VideoCard(
                  title: titles[index + 4], // Different title for each video
                  thumbnailUrl: thumbnails[index + 4], // Different thumbnail
                  channelName: channelNames[index + 4], // Different channel name
                  views: views[index + 4], // Different view count
                  videoUrl: videoUrls[index + 4], // Different video URL
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}





































// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart'; // Add this import
// import '../widgets/app_bar.dart';
// import '../widgets/bottom_navigation_bar.dart';
// import '../widgets/video_card.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // List of different video thumbnails
//     List<String> thumbnails = [
//       'https://pbs.twimg.com/profile_images/1600947977455128576/3NHgKZE1_400x400.jpg',
//       'https://pbs.twimg.com/profile_images/1600947977455128576/3NHgKZE1_400x400.jpg',
//       'https://blog.flutterflow.io/content/images/size/w1200/2022/03/flutter_mux_live_cover_wide.png',
//       'https://blog.flutterflow.io/content/images/size/w1200/2022/03/flutter_mux_live_cover_wide.png',
//       'https://blog.flutterflow.io/content/images/size/w1200/2022/03/flutter_mux_live_cover_wide.png',
//       'https://blog.flutterflow.io/content/images/size/w1200/2022/03/flutter_mux_live_cover_wide.png',
//     ];

//     // List of video titles
//     List<String> titles = [
//       'Who is Your Father? by Rev.Kesiena Esiri',
//       'Holy Ghost Power by Rev. Kesiena Esiri',
//       'Mastering FlutterFlow',
//       'Understanding State Management',
//       'Building Responsive UIs',
//       'Deploying Flutter Apps',
//     ];

//     // List of channel names
//     List<String> channelNames = [
//       'Remnant Christian Network',
//       'Remnant Christian Network (RCN)',
//       'FlutterFlow Official',
//       'CodeWithMe',
//       'GDG UI Experts',
//       'DevOps Academy',
//     ];

//     // List of views
//     List<String> views = [
//       '1.5M views',
//       '950K views',
//       '450K views',
//       '780K views',
//       '1.2M views',
//       '600K views',
//     ];

//     // List of video URLs
//     List<String> videoUrls = [
//       'https://www.youtube.com/watch?v=ZTghat-vrH0',
//       'https://www.youtube.com/watch?v=ZTghat-vrH0',
//       'https://www.youtube.com/watch?v=Mao8syRG6UE',
//       'https://www.youtube.com/watch?v=Mao8syRG6UE',
//       'https://www.youtube.com/watch?v=Mao8syRG6UE',
//       'https://www.youtube.com/watch?v=Mao8syRG6UE',
//     ];

//     // List of YouTube Shorts thumbnails and URLs
//     List<String> shortsThumbnails = [
//       'https://i.ytimg.com/vi/WGkN3GV2w-U/maxresdefault.jpg',
//       'https://i.ytimg.com/vi/WGkN3GV2w-U/maxresdefault.jpg',
//       'https://i.ytimg.com/vi/WGkN3GV2w-U/maxresdefault.jpg',
//     ];

//     List<String> shortsUrls = [
//       'https://www.youtube.com/shorts/Btsr6z35K3Q',
//       'https://www.youtube.com/shorts/Btsr6z35K3Q',
//       'https://www.youtube.com/shorts/Btsr6z35K3Q',
//     ];

//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize:
//             const Size.fromHeight(56.0), // Set the height of the app bar
//         child: CustomAppBar(),
//       ),
//       bottomNavigationBar: CustomBottomNavigationBar(),
//       body: Column(
//         children: [
//           // Video categories (horizontal scrolling)
//           SizedBox(
//             height: 50,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: const [
//                 CategoryButton(label: 'All'),
//                 CategoryButton(label: 'Music'),
//                 CategoryButton(label: 'Gaming'),
//                 CategoryButton(label: 'News'),
//                 CategoryButton(label: 'Podcast'),
//               ],
//             ),
//           ),

//           // YouTube Shorts Section (Horizontal scrolling)
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: SizedBox(
//               height: 250, // Set height for Shorts section
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: shortsThumbnails.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () async {
//                       // Launch the Shorts URL when the card is tapped
//                       if (await canLaunchUrl(Uri.parse(shortsUrls[index]))) {
//                         await launchUrl(Uri.parse(shortsUrls[index]));
//                       } else {
//                         throw 'Could not launch ${shortsUrls[index]}';
//                       }
//                     },
//                     child: Container(
//                       width: 150, // Width of each Short
//                       margin: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Thumbnail for the short
//                           AspectRatio(
//                             aspectRatio: 9 / 16, // Vertical video aspect ratio
//                             child: Image.network(
//                               shortsThumbnails[index],
//                               fit: BoxFit.cover,
//                               errorBuilder: (context, error, stackTrace) {
//                                 return const Center(
//                                   child: Icon(Icons.broken_image,
//                                       color: Colors.grey),
//                                 );
//                               },
//                             ),
//                           ),
//                           const SizedBox(height: 8.0),
//                           // Short description
//                           const Text(
//                             'Short Title',
//                             style: TextStyle(color: Colors.white),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),

//           // Expanded to let the GridView take up available space
//           Expanded(
//             child: Padding(
//               padding:
//                   const EdgeInsets.all(8.0), // Adding padding around the grid
//               child: GridView.builder(
//                 itemCount: thumbnails.length, // Number of thumbnails
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2, // 2 thumbnails per row
//                   crossAxisSpacing:
//                       5.0, // Space between thumbnails horizontally
//                   mainAxisSpacing: 20.0, // Space between thumbnails vertically
//                   childAspectRatio: 16 / 16, // Aspect ratio of video thumbnails
//                 ),
//                 itemBuilder: (context, index) {
//                   return VideoCard(
//                     title: titles[index], // Different title for each video
//                     thumbnailUrl: thumbnails[index], // Different thumbnail
//                     channelName: channelNames[index], // Different channel name
//                     views: views[index], // Different view count
//                     videoUrl: videoUrls[index], // Different video URL
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Category button widget
// class CategoryButton extends StatelessWidget {
//   final String label;

//   const CategoryButton({super.key, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: ElevatedButton(
//         onPressed: () {},
//         child: Text(label),
//       ),
//     );
//   }
// }





































// import 'package:flutter/material.dart';
// import '../widgets/app_bar.dart';
// import '../widgets/bottom_navigation_bar.dart';
// import '../widgets/video_card.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // List of different video thumbnails
//     List<String> thumbnails = [
//       'https://pbs.twimg.com/media/F0uv1NwXwAESyaF?format=jpg&name=4096x4096',
//       'https://pbs.twimg.com/profile_images/1600947977455128576/3NHgKZE1_400x400.jpg',
//       'https://blog.flutterflow.io/content/images/size/w1200/2022/03/flutter_mux_live_cover_wide.png',
//       'https://blog.flutterflow.io/content/images/size/w1200/2022/03/flutter_mux_live_cover_wide.png',
//       'https://blog.flutterflow.io/content/images/size/w1200/2022/03/flutter_mux_live_cover_wide.png',
//       'https://blog.flutterflow.io/content/images/size/w1200/2022/03/flutter_mux_live_cover_wide.png',
//     ];

//     // List of video titles
//     List<String> titles = [
//       'Who is Your Father? by Rev.Kesiena Esiri',
//       'Holy Ghost Power by Rev. Kesiena Esiri',
//       'Mastering FlutterFlow',
//       'Understanding State Management',
//       'Building Responsive UIs',
//       'Deploying Flutter Apps'
//     ];

//     // List of channel names
//     List<String> channelNames = [
//       'Remnant Christian Network',
//       'Remnant Christian Network (RCN)',
//       'Build fully functional apps with Firebase integration. FlutterFlow Official',
//       'CodeWithMe. Africa Talk Uganda',
//       'Control every pixel to create customized designs. GDG UI Experts',
//       'Build, test, and deploy beautiful mobile, web, desktop. DevOps Academy',
//     ];

//     // List of views
//     List<String> views = [
//       '1.5M views',
//       '950K views',
//       '450K views',
//       '780K views',
//       '1.2M views',
//       '600K views',
//     ];

//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize:
//             const Size.fromHeight(56.0), // Set the height of the app bar
//         child: CustomAppBar(),
//       ),
//       bottomNavigationBar: CustomBottomNavigationBar(),
//       body: Column(
//         children: [
//           // Video categories (horizontal scrolling)
//           SizedBox(
//             height: 50,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: const [
//                 CategoryButton(label: 'All'),
//                 CategoryButton(label: 'Music'),
//                 CategoryButton(label: 'Gaming'),
//                 CategoryButton(label: 'News'),
//               ],
//             ),
//           ),
//           // Expanded to let the GridView take up available space
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0), // Add padding around the grid
//               child: GridView.builder(
//                 itemCount: thumbnails.length, // Number of thumbnails
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2, // 2 thumbnails per row
//                   crossAxisSpacing:
//                       5.0, // Space between thumbnails horizontally
//                   mainAxisSpacing: 20.0, // Space between thumbnails vertically
//                   childAspectRatio: 16 / 16, // Aspect ratio of video thumbnails
//                 ),
//                 itemBuilder: (context, index) {
//                   return VideoCard(
//                     title: titles[index], // Different title for each video
//                     thumbnailUrl: thumbnails[index], // Different thumbnail
//                     channelName: channelNames[index], // Different channel name
//                     views: views[index], // Different view count
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Category button widget
// class CategoryButton extends StatelessWidget {
//   final String label;

//   const CategoryButton({super.key, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: ElevatedButton(
//         onPressed: () {},
//         child: Text(label),
//       ),
//     );
//   }
// }
