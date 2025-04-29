import 'package:cinex/app/helpers/helper_functions.dart';
import 'package:cinex/app/models/cast.dart';
import 'package:flutter/material.dart';

import '../widgets/cast_column.dart';

class SeeAllCreditsView extends StatelessWidget {
  final List<Cast> list;
  final String movieName;
  final bool isCast;

  const SeeAllCreditsView({
    required this.list,
    required this.movieName,
    required this.isCast,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = HelperFunctions.screenWidth(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 48.0, left: 16.0, right: 16.0),
              child: Text(
                "$movieName cast",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: list.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16.0,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                Cast cast = list[index];
                return CastColumn(
                  radius: screenWidth * 0.12,
                  name: cast.name,
                  id: cast.id,
                  cast: isCast ? cast : null,
                  description: isCast ? cast.character : cast.job,
                  image: cast.profilePath,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
