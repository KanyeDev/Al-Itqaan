import 'package:alitqaan/core/services/firebase_auth_services.dart';
import 'package:alitqaan/core/utility/toast.dart';
import 'package:alitqaan/core/widget/rounded_button.dart';
import 'package:alitqaan/features/auth/login/page/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/text_styles/text_styles.dart';
import '../../../../core/utility/pageRoutes.dart';
import '../../../../core/widget/my_textform_field.dart';
import '../../../home/page/home.dart';
import '../../signup/page/signup_page.dart';
import '../../signup/page/verify_email.dart';

//TODO: GOOOOOGLE SIGNIN AND LOGIN

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuthServices _authServices = FirebaseAuthServices();

  RxBool isLoading = false.obs;
  RxBool isLoadingLogin = false.obs;
  RxBool isPasswordVisible = false.obs;

  void login()async{
    try{
      await _authServices.signInWithEmailAndPassword(_controller.text, _passwordController.text).then((value) {
        FirebaseAuthServices().isEmailVerified() ? Navigator.pushAndRemoveUntil(
            context,
            CustomPageRouteLR(
                child: const Home(),
                direction: AxisDirection.left), (route) => false) : Navigator
            .push(
            context,
            CustomPageRouteLR(
                  child: const EmailVerification(),
                direction: AxisDirection.left));
      });
      isLoadingLogin.value = false;
    }catch(e){
      isLoadingLogin.value = false;
      Utility().toastMessage(e.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),
                Bold().boldHeader(4, 'Login', Theme
                    .of(context)
                    .colorScheme
                    .surface),
                const Gap(7),

                Regular().regularParagraph('s', "Sign in to gain access to your account", Colors.grey),
                const Gap(20),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Regular().regularParagraph('L', "Email address",Theme
                            .of(context)
                            .colorScheme
                            .surface),

                        const Gap(15),
                        SizedBox(
                            height: 44,
                            child: MyTextFormField(
                              controller: _controller,
                              hintText: 'Enter Email',
                              keyboardType: TextInputType.text,
                              isObscured: false,
                            )),
                        const Gap(20),

                        Regular().regularParagraph('L', "Password",Theme
                            .of(context)
                            .colorScheme
                            .surface),

                        const Gap(20),
                        SizedBox(
                            height: 44,
                            child: Obx(()=> MyTextFormField(
                                controller: _passwordController,
                                hintText: 'Enter Password',
                                icon: isPasswordVisible.value? GestureDetector(
                                  onTap: ()=> isPasswordVisible.value = false,
                                  child: const Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                ): GestureDetector(
                                  onTap: ()=> isPasswordVisible.value = true,
                                  child: const Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                isObscured: !isPasswordVisible.value,
                              ),
                            )),
                      ],
                    )),
                const Gap(13),

                //forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),

                    GestureDetector(
                      onTap: () => Navigator.push(context, CustomPageRouteLR(child: const ForgotPasswordScreen(), direction: AxisDirection.down)),
                      child:  Regular().regularParagraph('s', "Forgot password",Theme.of(context).colorScheme.primary),

                    ),
                  ],
                ),
                const Gap(25),

                //Login Button
                Obx(()=>
                    RoundedButton(
                      borderColor: Theme.of(context).colorScheme.primary,
                      fillColor: Theme.of(context).colorScheme.primary,
                      onTap: (){
                        isLoadingLogin.value = true;
                        if (_formKey.currentState!.validate()) {
                         login();
                        }
                        else{
                          isLoadingLogin.value = false;
                        }
                      },
                      isLoading: isLoadingLogin.value,
                      child: Regular().regularParagraph('L', "Login",Theme.of(context).colorScheme.secondary),),

                ),
                const Gap(15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.poppins(fontSize: 16,
                          color: Colors.grey),
                    ),
                    const Gap(10),
                    GestureDetector(
                      onTap: () =>   Navigator.push(
                          context,
                          CustomPageRouteLR(
                              child: const SignupPage(),
                              direction: AxisDirection.right)),
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(fontSize: 16,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ],
                ),
                const Gap(15),
                Center(
                  child: Text(
                    "OR",
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.surface),
                  ),
                ),
                const Gap(20),

                //Google sign in
                Obx(() => RoundedButton(
                      borderColor:Colors.grey,
                      fillColor: Theme.of(context).colorScheme.background,
                      onTap: (){
                        isLoading.value = true;
                      },
                      isLoading: isLoading.value,
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 24, child: Image.asset("asset/images/google_logo.png")),
                          const Gap(15),
                  Regular().regularParagraph('L', "Sign in with Google",Theme.of(context).colorScheme.secondary),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


