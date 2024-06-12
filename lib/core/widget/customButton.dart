import 'package:flutter/material.dart';

import '../screen_size/mediaQuery.dart';
import '../text_styles/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.color,
      this.width = 0,
      this.height = 44,
      required this.text,
      required this.onTap,
      this.borderColor = const Color(0xffDDB45A),
      this.textSize = 'l',
      this.isLoading = false,
      this.bold = false,
      this.textColor = const Color(0xff172B59),
        this.widget = const SizedBox(),
        this.borderRadius =16,
      });

  final Color color, borderColor, textColor;
  final double width, height;
  final String text, textSize;
  final VoidCallback onTap;
  final bool isLoading;
  final bool bold;
  final Widget widget;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            width: width == 0 ? getWidth(context) - 32 : width,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(color: borderColor),
                color: color),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget,
                Center(
                    child: isLoading == false
                        ? (bold == false
                            ? Regular().regularParagraph(textSize, text,
                        textColor)
                            : Bold().boldParagraph(textSize, text,
                        textColor))
                        : CircularProgressIndicator()),
              ],
            )));
  }
}
