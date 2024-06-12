
import 'package:alitqaan/core/services/firebase_auth_services.dart';
import 'package:alitqaan/core/text_styles/text_styles.dart';
import 'package:alitqaan/core/utility/pageRoutes.dart';
import 'package:alitqaan/features/notification/page/notification_settings.dart';
import 'package:alitqaan/features/payment/pages/payment.dart';
import 'package:alitqaan/features/profile/page/faqs_and_help.dart';
import 'package:alitqaan/features/profile/page/privacy_policy.dart';
import 'package:alitqaan/features/profile/page/profile_information.dart';
import 'package:alitqaan/features/profile/page/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../../class/page/class_enrolment.dart';
import '../widget/build_profile_items.dart';

class ProfilePage extends StatelessWidget {
   ProfilePage({super.key});
  final FirebaseAuthServices _authServices = FirebaseAuthServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Bold().boldHeader(5, "Adekanye Abdulkabir", Theme.of(context).colorScheme.secondary),
            Regular().regularParagraph('xs',_authServices.getCurrentUser()!.email.toString() , Colors.grey[700]!),

            const Gap(30),

            Regular().regularParagraph('s', "Account", Colors.grey[700]!),
            const Gap(20),

            BuildProfileItems(onTap: () {Navigator.push(context, CustomPageRouteLR(child: const ProfileInformation(), direction: AxisDirection.left));}, mainText: "Profile information", subText: "Number, email id", iconData: FontAwesomeIcons.circleUser,),
            const Gap(20),
            BuildProfileItems(onTap: () {{Navigator.push(context, CustomPageRouteLR(child: const NotificationSettings(), direction: AxisDirection.left));}}, mainText: "Notification", subText: "Push notifications", iconData: FontAwesomeIcons.bell,),
            const Gap(20),
            BuildProfileItems(onTap: () {{Navigator.push(context, CustomPageRouteLR(child: const Payment(), direction: AxisDirection.left));}}, mainText: "Payment", subText: "Payment method, payment history", iconData: Icons.payment_outlined,),
            const Gap(20),
            BuildProfileItems(onTap: () {{Navigator.push(context, CustomPageRouteLR(child: const ClassEnrolment(), direction: AxisDirection.left));}}, mainText: "Class enrolment", subText: "Enroll to class, enrolment history", iconData: FontAwesomeIcons.addressBook,),
            const Gap(50),

            Regular().regularParagraph('s', "Help and support", Colors.grey[700]!),
            const Gap(20),
            BuildProfileItems(onTap: () {{Navigator.push(context, CustomPageRouteLR(child: const PrivacyPolicy(), direction: AxisDirection.left));}}, mainText: "Privacy policy", subText: "Security notification", iconData: Icons.lock_outline,),
            const Gap(20),
            BuildProfileItems(onTap: () {{Navigator.push(context, CustomPageRouteLR(child: const TermsAndConditions(), direction: AxisDirection.left));}}, mainText: "Terms and conditions", subText: "Payment policy", iconData: Icons.book_outlined,),
            const Gap(20),
            BuildProfileItems(onTap: () {{Navigator.push(context, CustomPageRouteLR(child: const FAQsAndHelp(), direction: AxisDirection.left));}}, mainText: "FAQs and help", subText: "Get in touch with us", iconData: FontAwesomeIcons.circleQuestion,),

          ],
        ),
      ),
    );
  }
}


