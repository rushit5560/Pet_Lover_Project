import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pet_service_project/screens/sign_in_screen/sign_in_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../common/common_widgets.dart';
import '../../common/constants/app_colors.dart';
import '../../common/field_decoration.dart';
import '../../common/field_validation.dart';
import '../../controller/forgot_password_screen_controller/forgot_password_screen_controller.dart';

class ForgotPasswordForm extends StatelessWidget {

  ForgotPasswordForm({Key? key}) : super(key: key);
  final forgotPasswordScreenController = Get.find<ForgotPasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: forgotPasswordScreenController.forgotFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmailTextFieldModule(),
          const SizedBox(height: 30),
          OtpButtonModule(),
          const SizedBox(height: 30),
          OtpTextFieldModule(),
          const SizedBox(height: 20),
          ForgotPassCopyButton(),
        ],
      ),
    );
  }
}

class EmailTextFieldModule extends StatelessWidget {
  EmailTextFieldModule({Key? key}) : super(key: key);
  final forgotPasswordScreenController = Get.find<ForgotPasswordScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TextFieldElevationModule(),
        TextFormField(
          controller: forgotPasswordScreenController.emailTextFieldController,
          keyboardType: TextInputType.emailAddress,
          cursorColor: AppColors.colorDarkBlue1,
          decoration: forgotFormFieldDecoration(hintText: 'Email'),
          validator: (value) => fieldValidator.validateEmail(value!),
        ),
      ],
    );
  }
}

class OtpButtonModule extends StatelessWidget {
  OtpButtonModule({Key? key}) : super(key: key);
  final forgotPasswordScreenController = Get.find<ForgotPasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(forgotPasswordScreenController.forgotFormKey.currentState!.validate()){}
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.colorDarkBlue1,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(
            'SEND OTP',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}

class OtpTextFieldModule extends StatelessWidget {
   OtpTextFieldModule({Key? key}) : super(key: key);
   final forgotPasswordScreenController = Get.find<ForgotPasswordScreenController>();

   @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      pastedTextStyle: TextStyle(
        color: AppColors.colorDarkBlue,
        fontWeight: FontWeight.bold,
        backgroundColor: Colors.white
      ),
      length: 4,
      obscureText: true,
      obscuringCharacter: '*',
     /* obscuringWidget: FlutterLogo(
        size: 24,
      ),*/
      blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      validator: (v) {
        if (v!.length < 3) {
          return "I'm from validator";
        } else {
          return null;
        }
      },
      backgroundColor: Colors.white,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
        inactiveColor: Colors.white, activeColor: Colors.white
      ),
      cursorColor: Colors.black,
      animationDuration: const Duration(milliseconds: 300),
      //enableActiveFill: true,

      errorAnimationController: forgotPasswordScreenController.errorController,
      controller: forgotPasswordScreenController.otpTextFieldController,
      keyboardType: TextInputType.number,
      boxShadows:  [
        BoxShadow(
          offset: const Offset(0, 1),
          color: Colors.grey.shade400,
          blurRadius: 5,
          spreadRadius: 5,
          blurStyle: BlurStyle.outer
        )
      ],
      onCompleted: (v) {
        log("Completed");
      },
      // onTap: () {
      //   print("Pressed");
      // },
      onChanged: (value) {
        log(value);
        //setState(() {
        forgotPasswordScreenController.currentText.value = value;
       // });
      },
      beforeTextPaste: (text) {
        log("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }
}

class ForgotPassCopyButton extends StatelessWidget {
   ForgotPassCopyButton({Key? key}) : super(key: key);
   final forgotPasswordScreenController = Get.find<ForgotPasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Clipboard.setData( ClipboardData(text: forgotPasswordScreenController.otpTextFieldController.text));
        // Get.offAll(()=> SignInScreen(), transition: Transition.zoom);
        Get.back();
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.colorLightBlue,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(
            'Continue',
            style: TextStyle(
                color: AppColors.colorDarkBlue, fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}

