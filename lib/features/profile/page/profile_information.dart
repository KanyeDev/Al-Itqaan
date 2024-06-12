import 'package:alitqaan/core/services/firebase_auth_services.dart';
import 'package:alitqaan/core/text_styles/text_styles.dart';
import 'package:alitqaan/core/widget/customButton.dart';
import 'package:alitqaan/core/widget/my_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class ProfileInformation extends StatefulWidget {
  const ProfileInformation({super.key});

  @override
  State<ProfileInformation> createState() => _ProfileInformationState();
}

class _ProfileInformationState extends State<ProfileInformation> {
  final FirebaseAuthServices authServices = FirebaseAuthServices();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController maritalStatusController = TextEditingController();
  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.text = authServices.getCurrentUser()!.email!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,foregroundColor: Colors.black,
        title: Bold().boldHeader(
            5, "Profile information", Theme.of(context).colorScheme.secondary),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              Regular().regularParagraph('l', "Personal information", Colors.grey[700]!),
              const Gap(20),
              Regular().regularParagraph('l', "Name", Theme.of(context).colorScheme.secondary),
              const Gap(5),
              SizedBox(height: 44, child: MyTextFormField(controller: nameController, hintText: "Enter Name" , icon: const Icon(FontAwesomeIcons.circleUser),)),
              const Gap(15),
              Regular().regularParagraph('l', "Date of birth", Theme.of(context).colorScheme.secondary),
              const Gap(5),
              SizedBox(height: 44, child: MyTextFormField(controller: dobController, hintText: "Enter Dob" , icon: const Icon(Icons.calendar_month_outlined))),
              const Gap(30),
              Regular().regularParagraph('l', "Account information", Colors.grey[700]!),

              const Gap(15),
              Regular().regularParagraph('l', "Email", Theme.of(context).colorScheme.secondary),
              const Gap(5),
              SizedBox(height: 44, child: MyTextFormField(icon: const Icon(Icons.email_outlined), isEnabled: false, controller: emailController, hintText: "Enter Name" )),
              const Gap(15),
              Regular().regularParagraph('l', "Phone number", Theme.of(context).colorScheme.secondary),
              const Gap(5),
              SizedBox(height: 44, child: MyTextFormField(controller: phoneNumberController, hintText: "Enter Name" )),
              const Gap(30),
              Regular().regularParagraph('l', "Marital status", Theme.of(context).colorScheme.secondary),
              const Gap(5),
              ///change this to dropDownBox
              SizedBox(height: 44, child: MyTextFormField(controller: maritalStatusController, hintText: "Enter Name" )),
              const Gap(30),

              Regular().regularParagraph('l', "Change password",  Colors.grey[700]!),
              const Gap(15),
              Regular().regularParagraph('l', "Old password", Theme.of(context).colorScheme.secondary),
              const Gap(5),
              SizedBox(height: 44, child: MyTextFormField(textToHintInput: 'Enter your old password', controller: oldPassController, hintText: "Enter Name" , icon: const Icon(FontAwesomeIcons.eyeSlash, size: 18))),
              const Gap(15),
              Regular().regularParagraph('l', "New password", Theme.of(context).colorScheme.secondary),
              const Gap(5),
              SizedBox(height: 44, child: MyTextFormField(textToHintInput: 'Enter your new password',controller: newPassController, hintText: "Enter Name" , icon: const Icon(FontAwesomeIcons.eyeSlash, size: 18))),
              const Gap(15),
              Regular().regularParagraph('l', "Confirm password", Theme.of(context).colorScheme.secondary),
              const Gap(5),
              SizedBox(height: 44, child: MyTextFormField(textToHintInput: 'Confirm your new password',controller: confirmPassController, hintText: "Enter Name" , icon: const Icon(FontAwesomeIcons.eyeSlash, size: 18,))),

              const Gap(80),

              CustomButton(color: Theme.of(context).colorScheme.primary, text: "Save changes", onTap: (){}),
              const Gap(30),

            ],),
        ),
      ),
    );
  }
}
