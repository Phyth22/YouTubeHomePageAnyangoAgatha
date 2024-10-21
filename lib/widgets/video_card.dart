import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const VideoCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.grey[800],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Increase the height of the video thumbnail
          Container(
            height: 200, // Adjusted height for the video thumbnail
            width: double.infinity, // Make the width take the full space
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8), // Increased space between the image and text
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey[400], fontSize: 12),
          ),
        ],
      ),
    );
  }
}
