import 'package:alitqaan/core/screen_size/mediaQuery.dart';
import 'package:alitqaan/core/utility/pageRoutes.dart';
import 'package:alitqaan/features/auth/login/page/login_page.dart';
import 'package:alitqaan/features/auth/signup/page/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../core/text_styles/text_styles.dart';
import '../../../core/widget/rounded_button.dart';
import '../widget/circle_button.dart';
import '../widget/pages.dart';
import '../widget/switch_bubbles.dart';

class OnboardingPage2 extends StatefulWidget {
  const OnboardingPage2({super.key});

  @override
  State<OnboardingPage2> createState() => _OnboardingPage2State();
}

class _OnboardingPage2State extends State<OnboardingPage2> {
  RxInt currentIndex = 0.obs;
  RxDouble progressValue = 0.5.obs;

  PageController controller = PageController();

  int getPage(double page) {
    switch (page.toInt()) {
      case 0:
        return 0;
      case 1:
        return 1;
      case 2:
        return 2;
    }

    return 0;
  }


  @override
  void initState() {
    super.initState();
    currentIndex = 0.obs;
    progressValue = 0.5.obs;
  }

  @override
  void dispose() {
    progressValue.close();
    currentIndex.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.white, forceMaterialTransparency: true, automaticallyImplyLeading: false,),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          const Gap(60),

          //Top Half
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                currentIndex.value = value;
                if (currentIndex.value == 0) {
                  progressValue.value = 0.5;
                } else {
                  progressValue.value = 1;
                }
              },
              controller: controller,
              children: [
                Pages(
                  image: "asset/images/onboarding1.png",
                  mainText: "Welcome to Al-itqaan Qur'an Institute",
                  subText:
                      "Dive into seamless Qur'an learning and connect with divine teachings, anytime, anywhere.",
                  Lottie: Positioned(
                    bottom: 0,
                    child: SizedBox(
                      height: getHeight(context) / 4,
                      child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
                          child: LottieBuilder.asset(
                              fit: BoxFit.fitWidth,
                              "asset/lottie/man_reading.json")),
                    ),
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                  textColor: Theme.of(context).colorScheme.secondary,
                ),
                Pages(
                  image: "asset/images/onboarding2.png",
                  mainText: "Master Tajweed & Memorization",
                  subText:
                      "Personalized Tajweed and memorization classes to deepen your connection with every verse.",
                  Lottie: LottieBuilder.asset(
                      repeat: false,
                      fit: BoxFit.fitWidth,
                      "asset/lottie/quran_animation.json"),
                  color: Theme.of(context).colorScheme.primary,
                  textColor: Theme.of(context).colorScheme.primary,
                ),
                Pages(
                  image: "asset/images/onboarding3.png",
                  mainText: "Track Your Spiritual Growth",
                  subText:
                      "Track your journey with progress reports and reminders. Witness your dedication flourish.",
                  Lottie: LottieBuilder.asset(
                      repeat: false,
                      fit: BoxFit.fitWidth,
                      "asset/lottie/moving-cofetti.json"),
                  color: Color(0xffCCCCCC),
                  textColor: Theme.of(context).colorScheme.surface,
                ),
              ],
            ),
          ),

          //Bubbles Switch
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  child: PageBubbleSwitch(
                index: 0,
                currentIndex: currentIndex,
              )),
              const Gap(10),
              SizedBox(
                  child: PageBubbleSwitch(
                index: 1,
                currentIndex: currentIndex,
              )),
              const Gap(10),
              SizedBox(
                child: PageBubbleSwitch(
                  index: 2,
                  currentIndex: currentIndex,
                ),
              ),
            ],
          ),
          const Gap(60),

          //Bottom Half
          Obx(
            () => currentIndex.value == 2
                ? Column(
                    children: [
                      RoundedButton(
                        borderColor: Theme.of(context).colorScheme.primary,
                        fillColor: Theme.of(context).colorScheme.background,
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              CustomPageRouteLR(
                                  child: const LoginPage(),
                                  direction: AxisDirection.left), (route) => false);
                        }, isLoading: false,
                        child:  Regular().regularParagraph("l", "Login", Theme.of(context).colorScheme.secondary),
                      ),
                      const Gap(30),
                      RoundedButton(
                        borderColor: Theme.of(context).colorScheme.primary,
                        fillColor: Theme.of(context).colorScheme.primary,
                        isLoading: false,
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              CustomPageRouteLR(
                                  child: const SignupPage(),
                                  direction: AxisDirection.right), (route) => false);
                        }, child:  Regular().regularParagraph("l", "Sign up", Theme.of(context).colorScheme.secondary),
                      )
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.jumpToPage(2);
                          },
                          child: SizedBox(
                              width: 60,
                              height: 60,
                              child: Regular().regularParagraph('L', "Skip", Theme.of(context).colorScheme.surface)),
                        ),
                        CircleButton(
                          value: progressValue,
                          onTap: () {
                            if (currentIndex.value == 0) {
                              progressValue.value = 0.5;
                            } else {
                              progressValue.value = 1;
                            }
                            currentIndex.value = getPage(controller.page!);
                            controller.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeIn);
                          },
                        ),
                      ],
                    ),
                  ),
          ),
          const Gap(40),
        ],
      ),
    );
  }
}
