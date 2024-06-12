import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';

import '../../../core/screen_size/mediaQuery.dart';
import '../../../core/text_styles/text_styles.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile(
      {super.key,
        required this.notificationType,
        required this.deleteTile, required this.classType, required this.timeRange, required this.image});

  final String notificationType, classType, timeRange;
  final void Function(BuildContext)? deleteTile;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          //delete
          SlidableAction(
            borderRadius: BorderRadius.circular(10),
            onPressed: deleteTile,
            backgroundColor: Colors.red,
            icon: Icons.delete,
          )
        ],
      ),
      child: Container(
        width: getWidth(context),
        height: getHeight(context) / 12,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            spreadRadius: 0, // Set spreadRadius to 0
            offset: Offset(0, 4), // Adjust the offset as needed
          ),
        ], borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).colorScheme.onSurface),
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Image.asset(
                          image,
                        ),
                      )),
                  const Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Bold()
                          .boldParagraph("s", notificationType, Theme.of(context).colorScheme.secondary),
                      const Gap(5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Regular().regularParagraph(
                              "s", classType, Colors.grey[700]!),
                          const Gap(60),
                          Regular().regularParagraph("xs",
                              timeRange, Colors.grey[700]!),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

