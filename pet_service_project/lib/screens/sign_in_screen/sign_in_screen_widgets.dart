import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_service_project/screens/index_screen/index_screen.dart';
import '../../common/common_widgets.dart';
import '../../common/constants/app_colors.dart';
import '../../common/field_decoration.dart';
import '../../common/field_validation.dart';
import '../../controller/sign_in_screen_controller/sign_in_screen_controller.dart';
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
          const SizedBox(height: 20),
          PasswordTextFieldModule(),
          const SizedBox(height: 20),
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
      height: 50,
      child: Stack(
        children: [
          const TextFieldElevationModule(),
          TextFormField(
            controller: screenController.emailTextFieldController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: AppColors.colorDarkBlue1,
            decoration: signInFormFieldDecoration(hintText: 'Email'),
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
      height: 50,
      child: Stack(
        children: [
          const TextFieldElevationModule(),
          TextFormField(
            controller: screenController.passwordTextFieldController,
            keyboardType: TextInputType.text,
            cursorColor: AppColors.colorDarkBlue1,
            decoration: signInFormFieldDecoration(hintText: 'Password', index: 1),
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
            Get.off(() => SignUpScreen(), transition: Transition.zoom);
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
          Get.offAll(()=> IndexScreen(), transition: Transition.zoom);
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
