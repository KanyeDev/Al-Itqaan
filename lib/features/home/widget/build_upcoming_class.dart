import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../../../core/screen_size/mediaQuery.dart';
import '../../../core/text_styles/text_styles.dart';

Column buildUpcomingClass(BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Bold().boldHeader(
              5, "Upcoming class", Theme.of(context).colorScheme.secondary),
          Bold().boldParagraph(
              "L", "See all", Theme.of(context).colorScheme.secondary)
        ],
      ),
      const Gap(20),
      ...buildUpcomingClassList(context)
    ],
  );
}

List<Widget> buildUpcomingClassList(BuildContext context) {
  return List.generate(3, (index) {
    return Column(
      children: [
        Container(
          width: getWidth(context),
          height: getHeight(context) / 6.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: index % 2 == 0
                  ? Theme.of(context).colorScheme.onSecondary
                  : Theme.of(context  ).colorScheme.onSurface),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [
                  Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Image.asset(
                          "asset/images/quranLogo.png",
                        ),
                      )),

                  const Gap(10),

                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Bold().boldParagraph("s", "Tajweed Class 05", Colors.black),
                      const Gap(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.clock,
                            color: Theme.of(context).colorScheme.primary,
                            size: 16,
                          ),
                          const Gap(5),
                          Regular().regularParagraph(
                              "Xs", "04 April, 8:00 - 9:00 AM 1 hour", Colors.grey[700]!)
                        ],
                      ),
                      const Gap(15),
                      Regular()
                          .regularParagraph("s", "Ustaadh Ahmad", Colors.black),
                    ],
                  ),

                ],),
              ],
            ),
          ),
        ),
        const Gap(7),
      ],
    );
  });
}
