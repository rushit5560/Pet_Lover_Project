import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/common_widgets.dart';
import '../../common/constants/app_colors.dart';
import '../../common/field_decoration.dart';
import '../../common/field_validation.dart';
import '../../controller/change_password_screen_controller/change_password_screen_controller.dart';

class ChangePasswordForm extends StatelessWidget {
  ChangePasswordForm({Key? key}) : super(key: key);
  final screenController = Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: screenController.changeFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OldPasswordTextFieldModule(),
          const SizedBox(height: 30),
          NewPasswordTextFieldModule(),
          const SizedBox(height: 30),
          ConfirmNewPasswordTextFieldModule(),
          const SizedBox(height: 40),
          ChangePasswordButtonModule(),
          const SizedBox(height: 10),

        ],
      ),
    );
  }
}

class OldPasswordTextFieldModule extends StatelessWidget {
  OldPasswordTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<ChangePasswordScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TextFieldElevationModule(),
        Obx(
          ()=> TextFormField(
            controller: screenController.oldPasswordFieldController,
            keyboardType: TextInputType.text,
            cursorColor: AppColors.colorDarkBlue1,
            obscureText: screenController.isOldPassVisible.value,
            decoration: changePasswordFormFieldDecoration(hintText: 'Old Password', changePasswordScreenController: screenController, index: 1),
            validator: (value) => fieldValidator.validatePassword(value!),
          ),
        ),
      ],
    );
  }
}

class NewPasswordTextFieldModule extends StatelessWidget {
  NewPasswordTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<ChangePasswordScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TextFieldElevationModule(),
        Obx(
          ()=> TextFormField(
            controller: screenController.newPasswordFieldController,
            keyboardType: TextInputType.text,
            cursorColor: AppColors.colorDarkBlue1,
            obscureText: screenController.isNewPasswordVisible.value,
            decoration: changePasswordFormFieldDecoration(hintText: 'New Password', changePasswordScreenController: screenController, index: 2),
            validator: (value) => fieldValidator.validatePassword(value!),
          ),
        ),
      ],
    );
  }
}

class ConfirmNewPasswordTextFieldModule extends StatelessWidget {
  ConfirmNewPasswordTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<ChangePasswordScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TextFieldElevationModule(),
        Obx(
          ()=> TextFormField(
            controller: screenController.cNewPasswordFieldController,
            keyboardType: TextInputType.text,
            cursorColor: AppColors.colorDarkBlue1,
            obscureText: screenController.isCNewPasswordVisible.value,
            decoration: changePasswordFormFieldDecoration(hintText: 'Confirm New Password', changePasswordScreenController: screenController, index: 3),
            validator: (value) => fieldValidator.validateConfirmPassword(value!, screenController.cNewPasswordFieldController.text),
          ),
        ),
      ],
    );
  }
}

class ChangePasswordButtonModule extends StatelessWidget {
  ChangePasswordButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<ChangePasswordScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(screenController.changeFormKey.currentState!.validate()){}
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.colorDarkBlue1,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(
            'Confirm',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
