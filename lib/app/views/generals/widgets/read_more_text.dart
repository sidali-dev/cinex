import 'package:cinex/app/theme/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadMoreText extends StatelessWidget {
  final String text;
  final RxBool isExpanded;
  final TextAlign textAlign;

  const ReadMoreText({
    super.key,
    required this.text,
    required this.isExpanded,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    final int textLength = text.length > 200 ? 200 : text.length;
    return Obx(
      () => AnimatedCrossFade(
        duration: const Duration(milliseconds: 300),
        firstChild: RichText(
          textAlign: textAlign,
          text: TextSpan(
            text: "${text.substring(0, textLength)}...",
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textPrimary(context),
            ),
            children: [
              TextSpan(
                text: ' Show more',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    isExpanded.value = !isExpanded.value;
                  },
              ),
            ],
          ),
        ),
        secondChild: RichText(
          textAlign: textAlign,
          text: TextSpan(
            text: text,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textPrimary(context),
            ),
            children: [
              TextSpan(
                text: ' Show less',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    isExpanded.value = !isExpanded.value;
                  },
              ),
            ],
          ),
        ),
        crossFadeState: isExpanded.value
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        alignment: Alignment.center,
      ),
    );
  }
}
