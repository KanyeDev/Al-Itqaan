import 'package:alitqaan/core/services/firebase_auth_services.dart';
import 'package:alitqaan/features/auth/login/page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utility/pageRoutes.dart';
import '../../../../core/utility/toast.dart';
import '../../../../core/widget/rounded_button.dart';
import '../../../home/page/home.dart';

class EmailVerification extends StatefulWidget {
   const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendVerificationEmail()async {

    if(_auth.currentUser != null){
      await FirebaseAuthServices().sendEmailVerification().then((value){

        isLoading.value = false;

        Utility().toastMessage("Verification Code Sent");
        emailController.clear();
      }).onError((error, stackTrace) {
        Utility().toastMessage(error.toString());

        isLoading.value = false;

      });
    }
    else{
      Utility().toastMessage("User is not signed in yet");
    }
  }




   final emailController = TextEditingController();

   final auth = FirebaseAuth.instance;

   RxBool isLoading = false.obs;
   RxBool refresh = false.obs;

   RxBool isEmailVerified = FirebaseAuthServices().isEmailVerified().obs;



   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Theme.of(context).colorScheme.primary,
         title: const Text('Verify Your Account'),
       ),
       body: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 20.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             const SizedBox(height: 40,),

             Obx(()=> RoundedButton(
                 borderColor: Theme
                     .of(context)
                     .colorScheme
                     .primary,
                 fillColor: Theme
                     .of(context)
                     .colorScheme
                     .primary,
                 onTap: (){
                   isLoading.value = true;

                   if(refresh.value == true){
                     Navigator.pushAndRemoveUntil(
                         context,
                         CustomPageRouteLR(
                             child: const LoginPage(),
                             direction: AxisDirection.left), (route) => false);
                   }else{
                     sendVerificationEmail().then((value) {
                       refresh.value = true;
                     });
                     setState(() {

                     });
                   }

                 },
                 isLoading: isLoading.value,
                 child: refresh.value == true?Text(
                   "Click after verification to login",
                   style: GoogleFonts.poppins(
                       textStyle: TextStyle(fontSize: 17, color: Theme
                           .of(context)
                           .colorScheme
                           .secondary)),
                 ) : Text(
                   "Click to verify Email",
                   style: GoogleFonts.poppins(
                       textStyle: TextStyle(fontSize: 17, color: Theme
                           .of(context)
                           .colorScheme
                           .secondary)),
                 ),),
             ),

           ],
         ),
       ),
     );
   }
}
