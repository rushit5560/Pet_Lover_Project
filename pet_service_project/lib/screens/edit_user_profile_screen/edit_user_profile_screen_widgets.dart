import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common_widgets.dart';
import '../../../common/constants/app_colors.dart';
import '../../common/constants/app_images.dart';
import '../../common/field_decoration.dart';
import '../../common/field_validation.dart';
import '../../controller/edit_user_profile_screen_controller/edit_user_profile_screen_controller.dart';

FieldValidator fieldValidator = FieldValidator();
EditUserProfileScreenController screenController = Get.find<EditUserProfileScreenController>();

class ProfileImageModule extends StatelessWidget {
  const ProfileImageModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 125,
          width: 125,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            image: const DecorationImage(
              image: AssetImage(AppImages.chatProfile3Img),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: -15,
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(AppImages.editOptionImg, scale: 2.2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NameFieldModule extends StatelessWidget {
  const NameFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 25,
          child: FormFieldTitleModule(title: 'Name :-'),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 75,
          child: Stack(
            children: [
              const TextFieldElevationModule(),
              TextFormField(
                controller: screenController.userNameFieldController,
                keyboardType: TextInputType.text,
                cursorColor: AppColors.colorDarkBlue1,
                decoration: userProfileFieldDecoration(hintText: 'User Name'),
                validator: (value) => fieldValidator.validateFullName(value!),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EmailFieldModule extends StatelessWidget {
  const EmailFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 25,
          child: FormFieldTitleModule(title: 'Email :-'),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 75,
          child: Stack(
            children: [
              const TextFieldElevationModule(),
              TextFormField(
                controller: screenController.emailFieldController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: AppColors.colorDarkBlue1,
                decoration: userProfileFieldDecoration(hintText: 'Email'),
                validator: (value) => fieldValidator.validateEmail(value!),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PhoneFieldModule extends StatelessWidget {
  const PhoneFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 25,
          child: FormFieldTitleModule(title: 'Phone :-'),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 75,
          child: Stack(
            children: [
              const TextFieldElevationModule(),
              TextFormField(
                controller: screenController.phoneFieldController,
                keyboardType: TextInputType.phone,
                cursorColor: AppColors.colorDarkBlue1,
                decoration: userProfileFieldDecoration(hintText: 'Phone'),
                validator: (value) => fieldValidator.validateMobile(value!),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AgeFieldModule extends StatelessWidget {
  const AgeFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 25,
          child: FormFieldTitleModule(title: 'Age :-'),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 75,
          child: Stack(
            children: [
              const TextFieldElevationModule(),
              TextFormField(
                controller: screenController.ageFieldController,
                keyboardType: TextInputType.number,
                cursorColor: AppColors.colorDarkBlue1,
                decoration: userProfileFieldDecoration(hintText: 'Age'),
                validator: (value) => fieldValidator.validateAge(value!),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GenderFieldModule extends StatelessWidget {
  const GenderFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 25,
          child: FormFieldTitleModule(title: 'Gender :-'),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 75,
          child: Stack(
            children: [
              const TextFieldElevationModule(),
              TextFormField(
                controller: screenController.genderFieldController,
                keyboardType: TextInputType.number,
                cursorColor: AppColors.colorDarkBlue1,
                decoration: userProfileFieldDecoration(hintText: 'Gender'),
                validator: (value) => fieldValidator.validateFullName(value!),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AddressFieldModule extends StatelessWidget {
  const AddressFieldModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          flex: 25,
          child: FormFieldTitleModule(title: 'Address :-'),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 75,
          child: Stack(
            children: [
              const TextFieldElevationModule(height: 90),
              TextFormField(
                controller: screenController.addressFieldController,
                keyboardType: TextInputType.text,
                cursorColor: AppColors.colorDarkBlue1,
                maxLines: 3,
                decoration: userProfileFieldDecoration(hintText: 'Address'),
                validator: (value) => fieldValidator.validateAddress(value!),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EditProfileSaveButtonModule extends StatelessWidget {
  const EditProfileSaveButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.colorDarkBlue1,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 10),
          child: Text(
            'SAVE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}




class FormFieldTitleModule extends StatelessWidget {
  final String title;
  const FormFieldTitleModule({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}


