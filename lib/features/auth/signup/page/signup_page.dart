import 'package:alitqaan/core/utility/toast.dart';
import 'package:alitqaan/features/auth/login/page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/services/firebase_auth_services.dart';
import '../../../../core/text_styles/text_styles.dart';
import '../../../../core/utility/pageRoutes.dart';
import '../../../../core/widget/my_textform_field.dart';
import '../../../../core/widget/rounded_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final FirebaseAuthServices _authServices = FirebaseAuthServices();

  RxBool isLoading = false.obs;
  RxBool isLoadingSignup = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;
  RxBool isPasswordVisible = false.obs;

  void signup() async{
    isLoadingSignup.value = true;
    if(_passwordController.text == _confirmPasswordController.text){

      try{
        await _authServices.signUpWithMailPass(
            _nameController.text, _emailController.text, _passwordController.text,
            _phoneNumberController.text).then((value) {
          Navigator.push( context, CustomPageRouteLR(child: const LoginPage(), direction: AxisDirection.left));

        });

      }catch(e){
        Utility().toastMessage(e.toString());
        isLoadingSignup.value = false;
      }
    }
    else{
      Utility().toastMessage("Password doesn't match");
      isLoadingSignup.value = false;
    }
    isLoadingSignup.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(20),
                Bold().boldHeader(4, 'Sign up', Theme
                    .of(context)
                    .colorScheme
                    .surface),
                const Gap(7),
                Regular().regularParagraph('s', "Sign up to embark on your spiritual journey", Colors.grey),
                const Gap(20),


                //form field
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Regular().regularParagraph('L', "Full name",Theme
                            .of(context)
                            .colorScheme
                            .surface),
                        const Gap(15),
                        SizedBox(
                            height: 44,
                            child: MyTextFormField(
                              controller: _nameController,
                              hintText: 'Enter Name',
                              keyboardType: TextInputType.text,
                              isObscured: false,
                            )),
                        const Gap(20),
                        Regular().regularParagraph('L', "Email address",Theme
                            .of(context)
                            .colorScheme
                            .surface),
                        const Gap(15),
                        SizedBox(
                            height: 44,
                            child: MyTextFormField(
                              controller: _emailController,
                              hintText: 'Enter Email',
                              keyboardType: TextInputType.text,
                              isObscured: false,
                            )),
                        const Gap(20),

                        Regular().regularParagraph('L', "Phone number",Theme
                            .of(context)
                            .colorScheme
                            .surface),
                        const Gap(15),
                        SizedBox(
                            height: 44,
                            child: MyTextFormField(
                              textToHintInput: "E.g (+2348012345678) ",
                              controller: _phoneNumberController,
                              hintText: 'Enter Phone number',
                              keyboardType: const TextInputType.numberWithOptions(decimal: false),
                              isObscured: false,
                            )),
                        const Gap(20),

                        Regular().regularParagraph('L', "Password",Theme
                            .of(context)
                            .colorScheme
                            .surface),
                        const Gap(15),
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
                        const Gap(20),

                        Regular().regularParagraph('L', "Confirm password",Theme
                            .of(context)
                            .colorScheme
                            .surface),
                        const Gap(15),
                        SizedBox(
                            height: 44,
                            child: Obx(
                                  ()=> MyTextFormField(
                                controller: _confirmPasswordController,
                                hintText: 'Confirm Password',
                                icon: isConfirmPasswordVisible.value? GestureDetector(
                                  onTap: ()=> isConfirmPasswordVisible.value = false,
                                  child: const Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                ): GestureDetector(
                                  onTap: ()=> isConfirmPasswordVisible.value = true,
                                  child: const Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),
                                keyboardType: TextInputType.text,
                                isObscured: !isConfirmPasswordVisible.value,
                              ),
                            )),
                      ],
                    )),
                const Gap(25),


                //Login Button
                Obx(() =>
                    RoundedButton(
                        borderColor: Theme
                            .of(context)
                            .colorScheme
                            .primary,
                        fillColor: Theme
                            .of(context)
                            .colorScheme
                            .primary,
                        onTap: () {
                          isLoadingSignup.value = true;
                          if (_formKey.currentState!.validate()) {

                            signup();
                          }
                          else {
                            isLoadingSignup.value = false;
                          }
                        },
                        isLoading: isLoadingSignup.value,
                        child: Text(
                          "Sign up",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(fontSize: 17, color: Theme
                                  .of(context)
                                  .colorScheme
                                  .secondary)),
                        )),
                ),
                const Gap(15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.poppins(fontSize: 16,
                          color: Colors.grey),
                    ),
                    const Gap(10),
                    GestureDetector(
                      onTap: () =>
                          Navigator.push(
                              context,
                              CustomPageRouteLR(
                                  child: const LoginPage(),
                                  direction: AxisDirection.left)),
                      child: Text(
                        "Sign in",
                        style: GoogleFonts.poppins(fontSize: 16,
                            color: Theme
                                .of(context)
                                .colorScheme
                                .primary),
                      ),
                    ),
                  ],
                ),
                const Gap(15),
                Center(
                  child: Text(
                    "OR",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.bold,
                        color: Theme
                            .of(context)
                            .colorScheme
                            .surface),
                  ),
                ),
                const Gap(20),

                //Google sign in
                Obx(() =>
                    RoundedButton(
                        borderColor: Colors.grey,
                        fillColor: Theme
                            .of(context)
                            .colorScheme
                            .background,
                        onTap: () {
                          isLoading.value = true;
                        },
                        isLoading: isLoading.value,
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 24, child: Image.asset("asset/images/google_logo.png")),
                            const Gap(15),
                            Text(
                              "Sign in with Google",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 17, color: Theme
                                      .of(context)
                                      .colorScheme
                                      .secondary)),
                            ),
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
