import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/common_widgets.dart';
import '../../common/constants/app_colors.dart';
import '../../common/field_decoration.dart';
import '../../common/field_validation.dart';
import '../../controller/sign_in_screen_controller/sign_in_screen_controller.dart';
import '../home_screen/home_screen.dart';
import '../sign_up_screen/sign_up_screen.dart';


class SignInForm extends StatelessWidget {
  SignInForm({Key? key}) : super(key: key);
  final screenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: screenController.signInFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmailTextFieldModule(),
          const SizedBox(height: 30),
          PasswordTextFieldModule(),
          const SizedBox(height: 25),
          const ForgotPassModule(),
          const SizedBox(height: 25),
          SignInButtonModule(),
          const SizedBox(height: 50),
          const SignUpTextModule(),
        ],
      ),
    );
  }
}

class EmailTextFieldModule extends StatelessWidget {
  EmailTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignInScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Stack(
        children: [
          const TextFieldElevationModule(),
          TextFormField(
            controller: screenController.emailTextFieldController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: AppColors.colorDarkBlue1,
            decoration: signUpFormFieldDecoration(hintText: 'Email'),
            validator: (value) => fieldValidator.validateEmail(value!),
          ),
        ],
      ),
    );
  }
}

class PasswordTextFieldModule extends StatelessWidget {
  PasswordTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignInScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Stack(
        children: [
          const TextFieldElevationModule(),
          TextFormField(
            controller: screenController.passwordTextFieldController,
            keyboardType: TextInputType.text,
            cursorColor: AppColors.colorDarkBlue1,
            decoration: signUpFormFieldDecoration(hintText: 'Password', index: 1),
            validator: (value) => fieldValidator.validatePassword(value!),
          ),
        ],
      ),
    );
  }
}

class ForgotPassModule extends StatelessWidget {
  const ForgotPassModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(() => ForgotPasswordScreen(), transition: Transition.zoom);
      },
      child: Container(
        alignment: Alignment.centerRight,
        child: const Text(
          'FORGOT PASSWORD?',
          style: TextStyle(
            // color: AppColors.colorLightBlue1
          ),
        ),
      ),
    );
  }
}

class SignUpTextModule extends StatelessWidget {
  const SignUpTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        GestureDetector(
          onTap: () {
            Get.to(() => SignUpScreen(), transition: Transition.zoom);
          },
          child: Text(
            "SIGNUP",
            style: TextStyle(
              color: AppColors.colorDarkBlue,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class SignInButtonModule extends StatelessWidget {
  SignInButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        if(screenController.signInFormKey.currentState!.validate()){
          Get.offAll(()=> HomeScreen(), transition: Transition.zoom);
        }

      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.colorDarkBlue1,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(
            'SIGN IN',
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
