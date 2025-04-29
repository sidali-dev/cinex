import 'package:cinex/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../constants/png.dart';
import '../../../constants/tmdb_constants.dart';
import '../../../models/cast.dart';

class CastColumn extends StatelessWidget {
  const CastColumn({
    super.key,
    required this.radius,
    required this.name,
    required this.id,
    this.description,
    this.cast,
    this.image,
  });

  final double radius;
  final String? image;
  final String name;
  final int id;
  final Cast? cast;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(100),
          child: GestureDetector(
            onTap: () {
              if (cast != null) {
                Get.toNamed(Routes.ACTOR_PROFILE, arguments: {
                  "cast": cast,
                });
              }
            },
            child: CircleAvatar(
              radius: radius,
              foregroundImage: NetworkImage(
                "${TmdbConstants.imageRoot}$image",
              ),
              onForegroundImageError: (exception, stackTrace) {},
              backgroundImage: const AssetImage(Png.person),
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            description != null ? description! : "Unknown",
            style: TextStyle(fontSize: 14.0),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
