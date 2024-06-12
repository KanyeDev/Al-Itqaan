
import 'package:alitqaan/core/screen_size/mediaQuery.dart';
import 'package:alitqaan/core/utility/pageRoutes.dart';
import 'package:alitqaan/features/home/page/home.dart';
import 'package:alitqaan/features/onboarding/pages/onboarding_page2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/services/firebase_auth_services.dart';


class OnboardingPage1 extends StatefulWidget {
  const OnboardingPage1({super.key});

  @override
  State<OnboardingPage1> createState() => _OnboardingPage1State();
}

class _OnboardingPage1State extends State<OnboardingPage1> {

  @override
  void initState() {
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: FutureBuilder<User?>(
          future: FirebaseAuthServices().autoLogin(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show loading indicator while checking auto-login
              return   Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(getHeight(context)/5),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Center(child: SizedBox(height: getHeight(context)/6, width: getWidth(context)/3,child: Image.asset("asset/images/aiq_vertical_white.png"))),
                  ),
                  const Gap(50),
                  CircularProgressIndicator(color: Theme.of(context).colorScheme.surface,),
                  const  Gap(20),
                  const Text("Please Wait!"),
                  const Expanded(child: Gap(1)),
                ],
              );
            } else {
              if (snapshot.hasData) {
                // User is already logged in, navigate to home page
                //Utility().toastMessage("Login Successful");

                return const Home();
              } else {
                // User is not logged in, navigate to login page
                Future.delayed(const Duration(milliseconds: 800),(){
                  Navigator.push(context, FadeRoute(page: const OnboardingPage2()));
                });
                return Center(
                    child: SizedBox(height: getHeight(context)/6, width: getWidth(context)/3, child: Image.asset("asset/images/aiq_vertical_white.png"))
                );
              }
            }
          }));

  }
}

