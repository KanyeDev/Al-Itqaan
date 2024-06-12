import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/text_styles/text_styles.dart';

class BuildTopPart extends StatelessWidget {
  const BuildTopPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 145,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 0, // Set spreadRadius to 0
            offset: Offset(0, 4), // Adjust the offset as needed
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 26,
                  child: Icon(Icons.person),
                ),
                const Gap(10),
                Regular().regularParagraph(
                    "l", "Assalaamu Alaikum,", Colors.grey[700]!),
                Regular().regularParagraph("l", " Abdulkabir",
                    Theme.of(context).colorScheme.secondary),
              ],
            ),
            const Gap(5),
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                        height: 12,
                        width: 12,
                        child: CircleAvatar(
                            backgroundColor: Colors.lightBlue[100])),
                    const SizedBox(
                        height: 8,
                        width: 8,
                        child: CircleAvatar(backgroundColor: Colors.blue)),
                  ],
                ),
                const Gap(5),
                Regular().regularParagraph("s", "Level 4, Tahfeez student",
                    Theme.of(context).colorScheme.secondary),
              ],
            ),
            const Gap(5),
            Regular().regularParagraph(
                "s", "25 Ramadhan 1445 AH . 04 April 2024", Colors.grey[700]!),
          ],
        ),
      ),
    );
  }
}
