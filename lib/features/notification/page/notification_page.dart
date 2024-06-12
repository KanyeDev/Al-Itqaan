import 'package:alitqaan/core/screen_size/mediaQuery.dart';
import 'package:alitqaan/core/text_styles/text_styles.dart';
import 'package:alitqaan/core/widget/customButton.dart';
import 'package:alitqaan/features/notification/widget/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  RxBool isReminderActive = true.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
        ()=> Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
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
            child: Column(
              children: [
                const Expanded(child: Gap(1)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      CustomButton(
                          bold: true,
                          height: 40,
                          width: getWidth(context) / 2 - 20,
                          color: isReminderActive.value == true? Theme.of(context).colorScheme.primary : const Color(0xffFCF8EF),
                          borderColor: isReminderActive.value  == true? Theme.of(context).colorScheme.primary :Colors.grey[300]!,
                          text: "Class reminder",
                          onTap: () {
                            print("Class reminder clicked");
                            isReminderActive.value  = true;
                            setState(() {});
                          }),
                      const Gap(5),
                      CustomButton(
                          bold: true,
                          height: 40,
                          width: getWidth(context) / 2 - 20,
                          color: isReminderActive.value  == true?  const Color(0xffFCF8EF) : Theme.of(context).colorScheme.primary ,
                          borderColor: isReminderActive.value  == true? Colors.grey[300]! : Theme.of(context).colorScheme.primary,
                          text: "Monthly report",
                          onTap: () {
                              print("Monthly report clicked");
                              isReminderActive.value  = false;
                              setState(() {});
                          }),
                    ],
                  ),
                ),
                const Gap(17),
              ],
            ),
          ),
        ),
        const Gap(30),

        Obx(
          ()=> isReminderActive.value  == true?  const NotificationWidget() : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Bold().boldHeader(
                  5, 'Monthly Report', Theme.of(context).colorScheme.secondary),
            ),
            const Gap(15),
            ...buildMonthlyReportList(context, 8)
          ],),
        )


      ],
    );
  }
}

class MonthlyReportTile extends StatelessWidget {
  const MonthlyReportTile({
    super.key,
    required this.image,
    required this.classType,
    required this.dateRange,
    required this.studentLevel,
    required this.onTap,
  });

  final String image, classType, dateRange, studentLevel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: getWidth(context),
            height: getHeight(context) / 6,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                spreadRadius: 0, // Set spreadRadius to 0
                offset: Offset(0, 4), // Adjust the offset as needed
              ),
            ], borderRadius: BorderRadius.circular(16), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xffE6F1FD)),
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
                          Bold().boldParagraph("s", classType,
                              Theme.of(context).colorScheme.secondary),
                          const Gap(5),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.calendar_month_outlined,
                                color: Theme.of(context).colorScheme.primary,
                                size: 17,
                              ),
                              const Gap(5),
                              Regular().regularParagraph(
                                  "xs",
                                  dateRange,
                                  Colors.grey[700]!),
                            ],
                          ),
                          const Gap(10),
                          Regular()
                              .regularParagraph("s", studentLevel, Colors.grey[700]!),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      CustomButton(
                          borderRadius: 8,
                          borderColor: Colors.grey[300]!,
                          widget: Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: Icon(
                              Icons.file_download_outlined,
                              size: 18,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          textColor: Theme.of(context).colorScheme.primary,
                          textSize: 's',
                          width: 119,
                          height: 35,
                          color: Colors.white,
                          text: 'Download',
                          onTap: onTap),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> buildMonthlyReportList(BuildContext context, int itemCount) {
  return List.generate(itemCount, (index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MonthlyReportTile(
            image: "asset/images/document.png",
            classType: "Tahfeez class",
            dateRange: '01 September - 30 September, 2024',
            studentLevel: 'Level 4',
            onTap: (){}),
        const Gap(7),
      ],
    );
  });
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Bold()
              .boldHeader(5, 'Recent', Theme.of(context).colorScheme.secondary),
          const Gap(15),
          ...buildNotificationList(context, 2),
          const Gap(25),
          Bold().boldHeader(
              5, 'This week', Theme.of(context).colorScheme.secondary),
          const Gap(15),
          ...buildNotificationList(context, 7),
          const Gap(25),
          Bold().boldHeader(
              5, 'This month', Theme.of(context).colorScheme.secondary),
          ...buildNotificationList(context, 5),
          const Gap(10),
        ],
      ),
    );
  }
}

List<Widget> buildNotificationList(BuildContext context, int itemCount) {
  return List.generate(itemCount, (index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NotificationTile(
            notificationType: "Class is live",
            deleteTile: (data) {},
            classType: "Tajweed class",
            timeRange: "04 April, 8:00 - 9:00 AM",
            image: "asset/images/quranLogo.png"),
        const Gap(7),
      ],
    );
  });
}
