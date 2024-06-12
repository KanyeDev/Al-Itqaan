import 'dart:convert';

import 'package:alitqaan/core/text_styles/text_styles.dart';
import 'package:alitqaan/core/utility/converters.dart';
import 'package:alitqaan/features/home/widget/build_upcoming_class.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widget/calender_widget.dart';

class TimeTablePage extends StatelessWidget {
  const TimeTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Bold().boldHeader(5, "Class time table", Theme
                .of(context)
                .colorScheme
                .secondary),

            const CustomCalendar(classDays: [1, 3, 5]),

            const Gap(20),
            Regular().regularParagraph('s', 'You have 3 classes on ${Converters().monthNumberToWords(DateTime
                .now()
                .month)} ${DateTime
                .now()
                .day},  ${DateTime
                .now()
                .year}', Colors.grey[700]!),

            const Gap(15),

            ...buildUpcomingClassList(context),

          ],),
      ),
    );
  }
}
