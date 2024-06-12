
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/text_styles/text_styles.dart';
import '../widget/build_announcement.dart';
import '../widget/build_ongoing_class.dart';
import '../widget/build_top_part.dart';
import '../widget/build_upcoming_class.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///TOP PART
        const BuildTopPart(),
        const Gap(34),

         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16.0),
           child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///ANNOUNCEMENT
                Bold().boldHeader(5, "Announcement", Theme.of(context).colorScheme.secondary),
                const Gap(15),

                const BuildAnnouncement(),

                ///ONGOING CLASS
                const BuildOngoingClass(),

                ///UPCOMMING CLASS
                buildUpcomingClass(context),
              ],
            ),
         ),

      ],
    );
  }


}



