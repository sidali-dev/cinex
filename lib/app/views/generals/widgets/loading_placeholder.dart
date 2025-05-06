import 'package:cinex/app/constants/png.dart';
import 'package:flutter/material.dart';

class LoadingPlaceHolder extends StatelessWidget {
  const LoadingPlaceHolder({
    required this.title,
    super.key,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Png.loadingPlaceholder,
          height: 300,
        ),
        const SizedBox(height: 16.0),
        Text(
          title,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
