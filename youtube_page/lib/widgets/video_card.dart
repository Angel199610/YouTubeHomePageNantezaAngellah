import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  final String title;
  final String thumbnailUrl;
  final String channelName;
  final String views;

  const VideoCard({
    super.key,
    required this.title,
    required this.thumbnailUrl,
    required this.channelName,
    required this.views,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Use AspectRatio to maintain the thumbnail's aspect ratio
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              thumbnailUrl,
              fit: BoxFit.cover, // Ensure the image fits correctly
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(Icons.broken_image, color: Colors.grey),
                ); // Handle errors in loading the image
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2, // Limit the title to 2 lines
                overflow: TextOverflow
                    .ellipsis, // Prevent overflow by adding ellipsis
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '$channelName · $views',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
