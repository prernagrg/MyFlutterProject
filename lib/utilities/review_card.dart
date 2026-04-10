import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String time;
  final String rating;
  final String comment;
  final String profileImage;
  final List<String>? images;

  const ReviewCard({
    super.key,
    required this.name,
    required this.time,
    required this.rating,
    required this.comment,
    required this.profileImage,
    this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TOP ROW: Profile + Name + Rating
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(profileImage),
                backgroundColor: Colors.grey[300],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 230,
                      child: Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Color(0xFF3B6FFD),
                      shape: BoxShape.circle,
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.star, color: Colors.white, size: 14),
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    rating,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF3B6FFD),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),

          // COMMENT
          Text(
            comment,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.black87),
          ),

          const SizedBox(height: 10),

          // IMAGE GRID
          if (images != null && images!.isNotEmpty)
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  // LEFT BIG IMAGE
                  Expanded(
                    flex: 7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: _buildImage(images![0]),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // RIGHT TWO IMAGES
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: _buildImage(
                              images!.length > 1 ? images![1] : images![0],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: _buildImage(
                              images!.length > 2 ? images![2] : images![0],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 12),

          Row(
            children: [
              Icon(
                Icons.thumb_up_alt_outlined,
                size: 18,
                color: Colors.black54,
              ),
              const SizedBox(width: 6),
              const Text("Helpful", style: TextStyle(color: Colors.black54)),
              const SizedBox(width: 20),
              Icon(Icons.chat_bubble_outline, size: 18, color: Colors.black54),
              const SizedBox(width: 6),
              const Text("Comment", style: TextStyle(color: Colors.black54)),
            ],
          ),
        ],
      ),
    );
  }

  /// Helper method to choose image type
  Widget _buildImage(String path) {
    if (path.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        path,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    } else {
      return Image.asset(
        path,
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      );
    }
  }
}
