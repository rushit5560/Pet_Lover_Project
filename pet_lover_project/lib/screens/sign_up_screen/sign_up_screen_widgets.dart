import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/common_widgets.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';
import 'package:pet_lover_project/common/constants/field_decorations.dart';
import 'package:pet_lover_project/common/field_validation.dart';
import 'package:pet_lover_project/controllers/sign_up_screen_controller/sign_up_screen_controller.dart';
import 'package:pet_lover_project/screens/sign_in_screen/sign_in_screen.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signUpScreenController.signUpFormKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 45, right: 45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NameTextFieldModule(),
              const SizedBox(height: 30),
              EmailTextFieldModule(),
              const SizedBox(height: 25),
              PhoneTextFieldModule(),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: AgeTextFieldModule(),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: GenderTextFieldModule(),
                  )
                ],
              ),
              const SizedBox(height: 25),
              LocationTextFieldModule(),
              const SizedBox(height: 25),
              AddressTextFieldModule(),
              const SizedBox(height: 25),
              PasswordTextFieldModule(),
              const SizedBox(height: 25),
              ConfirmPasswordTextFieldModule(),
              const SizedBox(height: 25),
              SignUpButtonModule(),
              const SizedBox(height: 20),
              const AlreadyTextModule(),
            ],
          ),
        ),
      ),
    );
  }
}

class NameTextFieldModule extends StatelessWidget {
  NameTextFieldModule({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TextFieldElevationModule(),
        TextFormField(
          controller: signUpScreenController.nameTextFieldController,
          keyboardType: TextInputType.text,
          cursorColor: AppColors.colorDarkBlue1,
          decoration: signInFormFieldDecoration(hintText: 'Name'),
          validator: (value) => fieldValidator.validateFullName(value!),
        ),
      ],
    );
  }
}

class EmailTextFieldModule extends StatelessWidget {
  EmailTextFieldModule({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TextFieldElevationModule(),
        TextFormField(
          controller: signUpScreenController.emailTextFieldController,
          keyboardType: TextInputType.emailAddress,
          cursorColor: AppColors.colorDarkBlue1,
          decoration: signInFormFieldDecoration(hintText: 'Email'),
          validator: (value) => fieldValidator.validateEmail(value!),
        ),
      ],
    );
  }
}

class PhoneTextFieldModule extends StatelessWidget {
  PhoneTextFieldModule({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TextFieldElevationModule(),
        TextFormField(
          controller: signUpScreenController.phoneTextFieldController,
          keyboardType: TextInputType.phone,
          cursorColor: AppColors.colorDarkBlue1,
          decoration: signInFormFieldDecoration(hintText: 'Phone'),
          validator: (value) => fieldValidator.validateMobile(value!),
        ),
      ],
    );
  }
}


class AgeTextFieldModule extends StatelessWidget {
  AgeTextFieldModule({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TextFieldElevationModule(),
        TextFormField(
          controller: signUpScreenController.ageTextFieldController,
          keyboardType: TextInputType.phone,
          cursorColor: AppColors.colorDarkBlue1,
          decoration: signInFormFieldDecoration(hintText: 'Age'),
          validator: (value) => fieldValidator.validateAge(value!),
        ),
      ],
    );
  }
}

class GenderTextFieldModule extends StatelessWidget {
  GenderTextFieldModule({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Container(
          padding: const EdgeInsets.only(right: 10),
          height: 48,
          width: Get.width/1.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 5,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: AppColors.colorDarkBlue1.withOpacity(0.2),
                // background color for the dropdown items
                buttonTheme: ButtonTheme.of(context).copyWith(
                  alignedDropdown: true, //If false (the default), then the dropdown's menu will be wider than its button.
                )),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: Image.asset(AppImages.dropDownArrowImg, scale: 2,),
                isExpanded: true,
                focusColor: Colors.white,
                value: signUpScreenController.gender.value,
                //elevation: 5,
                style: TextStyle(color: AppColors.colorDarkBlue1),
                iconEnabledColor: Colors.black,
                items: <String>[
                  'Female',
                  'Male',
                ].
                map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: AppColors.colorDarkBlue1),
                    ),
                  );
                }).toList(),
                hint: Text("Gender", style: TextStyle(color: AppColors.colorDarkBlue1),),
                onChanged: (newValue) {
                  signUpScreenController.gender.value = newValue!;
                },
              ),
            ),
          ),
        ),
    );
  }
}

class LocationTextFieldModule extends StatelessWidget {
  LocationTextFieldModule({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TextFieldElevationModule(),
        TextFormField(
          controller: signUpScreenController.locationTextFieldController,
          keyboardType: TextInputType.text,
          cursorColor: AppColors.colorDarkBlue1,
          decoration: signInFormFieldDecoration(hintText: 'Location'),
          validator: (value) => fieldValidator.validateLocation(value!),
        ),
      ],
    );
  }
}

class AddressTextFieldModule extends StatelessWidget {
  AddressTextFieldModule({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TextFieldElevationModule(),
        TextFormField(
          controller: signUpScreenController.addressTextFieldController,
          keyboardType: TextInputType.text,
          cursorColor: AppColors.colorDarkBlue1,
          decoration: signInFormFieldDecoration(hintText: 'Address'),
          validator: (value) => fieldValidator.validateAddress(value!),
        ),
      ],
    );
  }
}

class PasswordTextFieldModule extends StatelessWidget {
  PasswordTextFieldModule({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TextFieldElevationModule(),
        TextFormField(
          controller: signUpScreenController.passwordTextFieldController,
          keyboardType: TextInputType.visiblePassword,
          cursorColor: AppColors.colorDarkBlue1,
          decoration: signInFormFieldDecoration(hintText: 'Password'),
          validator: (value) => fieldValidator.validatePassword(value!),
        ),
      ],
    );
  }
}

class ConfirmPasswordTextFieldModule extends StatelessWidget {
  ConfirmPasswordTextFieldModule({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TextFieldElevationModule(),
        TextFormField(
          controller: signUpScreenController.confirmPasswordTextFieldController,
          keyboardType: TextInputType.visiblePassword,
          cursorColor: AppColors.colorDarkBlue1,
          decoration: signInFormFieldDecoration(hintText: 'Confirm Password'),
          validator: (value) {
            if (value!.isEmpty) {
              return "Confirm password is Required";
            } else if (value != signUpScreenController.passwordTextFieldController.text){
              return "Password and Confirm password should be same";
            } else{
              return null;
            }
          },
        ),
      ],
    );
  }
}

class SignUpButtonModule extends StatelessWidget {
  SignUpButtonModule({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(signUpScreenController.signUpFormKey.currentState!.validate()){}
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.colorDarkBlue1,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(
            'SIGN UP',
            style: TextStyle(
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}

class AlreadyTextModule extends StatelessWidget {
  const AlreadyTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account? "),
        GestureDetector(
          onTap: () {
            Get.to(() => SignInScreen());
          },
          child: Text(
            "SIGNIN",
            style: TextStyle(
              color: AppColors.colorDarkBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}