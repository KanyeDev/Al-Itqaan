import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/text_styles/text_styles.dart';

class BuildProfileItems extends StatelessWidget {
  const BuildProfileItems({
    super.key, required this.onTap, required this.mainText, required this.subText, required this.iconData,
  });

  final VoidCallback onTap;
  final String mainText, subText;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(iconData, color: Theme.of(context).colorScheme.secondary,),
          const Gap(15),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Regular().regularParagraph('l', mainText, Theme.of(context).colorScheme.secondary),
              Regular().regularParagraph('xs', subText, Colors.grey[700]!),
            ],
          ),
        ],
      ),
    );
  }
}