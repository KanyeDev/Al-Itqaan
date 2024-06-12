import 'package:alitqaan/core/utility/pageRoutes.dart';
import 'package:alitqaan/features/home/page/join_class.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../../../core/screen_size/mediaQuery.dart';
import '../../../core/text_styles/text_styles.dart';

class BuildOngoingClass extends StatelessWidget {
  const BuildOngoingClass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Bold().boldHeader(
            5, "Ongoing class", Theme.of(context).colorScheme.secondary),
        const Gap(22),
        Container(
          width: getWidth(context),
          height: getHeight(context) / 4.1,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Image.asset(
                        "asset/images/quranLogo.png",
                      ),
                    )),
                const Gap(16),
                Bold().boldParagraph("L", "Tajweed Class 05", Colors.black),
                const Gap(10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.clock,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 16,
                    ),
                    const Gap(5),
                    Regular().regularParagraph(
                        "s", "8:00 - 9:00 AM 1 hour", Colors.grey[700]!)
                  ],
                ),
                const Gap(15),
                Row(
                  children: [
                    Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(4.5),
                          child: Image.asset(
                            "asset/images/ustaadhPics.png",
                          ),
                        )),
                    const Gap(7),
                    Regular()
                        .regularParagraph("s", "Ustaadh Ahmad", Colors.black),
                    const Expanded(child: Gap(1)),

                    GestureDetector(
                      onTap: ()=> Navigator.push(context, CustomPageRouteLR(child: const JoinClass(), direction: AxisDirection.left)),
                      child: Container(
                        width: 95,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.primary),
                        child: Center(
                          child: Regular()
                              .regularParagraph("s", "Join Class", Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        const Gap(30),
      ],
    );
  }
}
