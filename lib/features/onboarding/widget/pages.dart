import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/screen_size/mediaQuery.dart';
import '../../../core/text_styles/text_styles.dart';

class Pages extends StatelessWidget {
  const Pages({
    super.key,
    required this.image,
    required this.mainText,
    required this.subText,
    required this.Lottie,
    required this.color,
    required this.textColor,
  });

  final String image;
  final String mainText;
  final String subText;
  final Widget Lottie;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: getHeight(context) / 2.3,
            width: getWidth(context) - 30,
            child: Container(
              decoration: BoxDecoration(color: color),
              child: Stack(
                children: [
                  Image.asset(image),
                  Lottie,
                ],
              ),
            )),
        const Gap(20),
        SizedBox(
            width: getWidth(context) - 30,
            height: 63,
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Bold().boldHeader(4, mainText, textColor),
            )),
        const Gap(20),
        SizedBox(
            width: getWidth(context) - 30,
            height: 70,
            child: Regular().regularParagraph('L', subText, Theme.of(context).colorScheme.surface)),
      ],
    );
  }
}