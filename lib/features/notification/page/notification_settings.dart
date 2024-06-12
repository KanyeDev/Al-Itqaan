import 'package:alitqaan/core/text_styles/text_styles.dart';
import 'package:alitqaan/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/widget/customButton.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool isEnableAllNotifications = false;
  bool isEnableClassReminder = false;
  bool isEnableMontlyReport = false;
  bool isEnableAppUpdates = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Bold().boldHeader(
            5, "Notification", Theme.of(context).colorScheme.secondary),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            Regular().regularParagraph(
                's', "Notification settings", Colors.grey[700]!),
            const Gap(20),
            buildNotificationSettingsTile(context, "Enable push notifications",
                "Allow all notifications", isEnableAllNotifications, (value) {
              setState(() {
                isEnableAllNotifications = value;
              });
            }),
            const Gap(35),
            Regular().regularParagraph(
                's', "Individual notification settings", Colors.grey[700]!),
            const Gap(20),
            buildNotificationSettingsTile(
                context,
                "Class reminder",
                "Get push notifications for upcoming and live classes",
                isEnableClassReminder, (value) {
              setState(() {
                isEnableClassReminder = value;
              });
            }),
            const Gap(20),
            buildNotificationSettingsTile(
                context,
                "Monthly report",
                "Get push notifications for your tahfeez monthly report",
                isEnableMontlyReport, (value) {
              setState(() {
                isEnableMontlyReport = value;
              });
            }),
            const Gap(20),
            buildNotificationSettingsTile(
                context,
                "App update",
                "Recieve timely notification about app updates, new features",
                isEnableAppUpdates, (value) {
              setState(() {
                isEnableAppUpdates = value;
              });
            }),
            const Expanded(child: Gap(1)),
            CustomButton(
                color: Theme.of(context).colorScheme.primary,
                text: "Save changes",
                onTap: () {}),
            const Gap(40),
          ],
        ),
      ),
    );
  }

  Row buildNotificationSettingsTile(BuildContext context, String mainText,
      String subText, bool isActive, void Function(bool)? onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Regular().regularParagraph(
                'l', mainText, Theme.of(context).colorScheme.secondary),
            SizedBox(
                width: 200,
                child: Regular()
                    .regularParagraph('xs', subText, Colors.grey[700]!)),
          ],
        ),
        CupertinoSwitch(
          value: isActive,
          onChanged: onChanged,
          activeColor: Colors.black87,
        ),
      ],
    );
  }
}
