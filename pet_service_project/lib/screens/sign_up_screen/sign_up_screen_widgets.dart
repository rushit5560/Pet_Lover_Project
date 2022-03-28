import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_service_project/common/extension_methods/extension_methods.dart';
import 'package:pet_service_project/screens/home_screen/home_screen.dart';

import '../../common/common_widgets.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_images.dart';
import '../../common/field_decoration.dart';
import '../../common/field_validation.dart';
import '../../controller/sign_up_screen_controller/sign_up_screen_controller.dart';
import '../sign_in_screen/sign_in_screen.dart';


class SignUpFormModule extends StatelessWidget {
  SignUpFormModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AddPhotoModule(),
          const SizedBox(height: 25),
          BusinessNameFieldModule(),
          const SizedBox(height: 25),
          ServiceCategoryModule(),
          const SizedBox(height: 25),
          PhoneFieldModule(),
          const SizedBox(height: 25),
          AddressFieldModule(),
          const SizedBox(height: 25),
          LocationTextFieldModule(),
          const SizedBox(height: 25),
          Row(
            children: [
              Expanded(child: CityFieldModule()),
              const SizedBox(width: 20),
              Expanded(child: StateFieldModule()),
            ],
          ),
          const SizedBox(height: 25),
          CountryFieldModule(),
          const SizedBox(height: 25),
          PasswordFieldModule(),
          const SizedBox(height: 25),
          ConfirmPasswordFieldModule(),
          const SizedBox(height: 40),
          SignUpButtonModule(),
          const SizedBox(height: 25),
          const AlreadyTextModule(),
          const SizedBox(height: 10),
        ],
      ).commonSymmetricPadding(horizontal: 45, vertical: 10),
    );
  }

}

class AddPhotoModule extends StatelessWidget {
  const AddPhotoModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // openGallery();
      },
      child: Container(
        height: Get.height/6.7,
        width: Get.width/3.2,
        decoration: BoxDecoration(
          color: Colors.white,
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: /*addDetailsScreenController.file != null
              ? Image.file(
                  addDetailsScreenController.file!,
                  fit: BoxFit.fill,
                )
              : */
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.addImageImg,
                scale: 2.5,
              ),
              const SizedBox(height: 10),
              Text(
                "Add Photo",
                style: TextStyle(color: AppColors.colorDarkBlue1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*void openGallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      addDetailsScreenController.file = File(image.path);
      print('Camera File Path : ${addDetailsScreenController.file}');
      print('Camera Image Path : ${image.path}');
      //Fluttertoast.showToast(msg: '${image.path}', toastLength: Toast.LENGTH_LONG);
      //renameImage();

    } else {}
  }*/
}

class BusinessNameFieldModule extends StatelessWidget {
  BusinessNameFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          const TextFieldElevationModule(),
          TextFormField(
            controller: screenController.businessNameFieldController,
            keyboardType: TextInputType.text,
            cursorColor: AppColors.colorDarkBlue1,
            decoration: signUpFormFieldDecoration(hintText: 'Name'),
            validator: (value) => fieldValidator.validateFullName(value!),
          ),
        ],
      ),
    );
  }
}

class PhoneFieldModule extends StatelessWidget {
  PhoneFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          const TextFieldElevationModule(),
          TextFormField(
            controller: screenController.phoneFieldController,
            keyboardType: TextInputType.phone,
            cursorColor: AppColors.colorDarkBlue1,
            decoration: signUpFormFieldDecoration(hintText: 'Phone'),
            validator: (value) => fieldValidator.validateMobile(value!),
          ),
        ],
      ),
    );
  }
}

class AddressFieldModule extends StatelessWidget {
  AddressFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          const TextFieldElevationModule(),
          TextFormField(
            controller: screenController.addressFieldController,
            keyboardType: TextInputType.text,
            cursorColor: AppColors.colorDarkBlue1,
            decoration: signUpFormFieldDecoration(hintText: 'Address'),
            validator: (value) => fieldValidator.validateAddress(value!),
          ),
        ],
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
       return Container(
      height: 50,
      padding: const EdgeInsets.only(right: 10),
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
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: Text(
                  "Location",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.colorDarkBlue1)
              ),
            ),
            Image.asset(AppImages.locationImg, scale: 1.8)
          ],
        ),
      ),
    );
  }
}

class CityFieldModule extends StatelessWidget {
  CityFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          const TextFieldElevationModule(),
          TextFormField(
            controller: screenController.cityFieldController,
            keyboardType: TextInputType.text,
            cursorColor: AppColors.colorDarkBlue1,
            decoration: signUpFormFieldDecoration(hintText: 'City'),
            validator: (value) => fieldValidator.validateFullName(value!),
          ),
        ],
      ),
    );
  }
}

class StateFieldModule extends StatelessWidget {
  StateFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          const TextFieldElevationModule(),
          TextFormField(
            controller: screenController.stateFieldController,
            keyboardType: TextInputType.text,
            cursorColor: AppColors.colorDarkBlue1,
            decoration: signUpFormFieldDecoration(hintText: 'State'),
            validator: (value) => fieldValidator.validateFullName(value!),
          ),
        ],
      ),
    );
  }
}

class CountryFieldModule extends StatelessWidget {
  CountryFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          const TextFieldElevationModule(),
          TextFormField(
            controller: screenController.countryFieldController,
            keyboardType: TextInputType.text,
            cursorColor: AppColors.colorDarkBlue1,
            decoration: signUpFormFieldDecoration(hintText: 'Country'),
            validator: (value) => fieldValidator.validateFullName(value!),
          ),
        ],
      ),
    );
  }
}

class PasswordFieldModule extends StatelessWidget {
  PasswordFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          const TextFieldElevationModule(),
          TextFormField(
            controller: screenController.passwordFieldController,
            keyboardType: TextInputType.text,
            cursorColor: AppColors.colorDarkBlue1,
            decoration: signUpFormFieldDecoration(hintText: 'Password'),
            validator: (value) => fieldValidator.validatePassword(value!),
          ),
        ],
      ),
    );
  }
}

class ConfirmPasswordFieldModule extends StatelessWidget {
  ConfirmPasswordFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          const TextFieldElevationModule(),
          TextFormField(
            controller: screenController.cPasswordFieldController,
            keyboardType: TextInputType.text,
            cursorColor: AppColors.colorDarkBlue1,
            decoration: signUpFormFieldDecoration(hintText: 'Confirm Password'),
            validator: (value) => fieldValidator.validateConfirmPassword(value!, screenController.passwordFieldController.text),
          ),
        ],
      ),
    );
  }
}

class SignUpButtonModule extends StatelessWidget {
  SignUpButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(screenController.signUpFormKey.currentState!.validate()){
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
        const Text(
            "Already have an account? ",
          style: TextStyle(fontSize: 13),
        ),
        GestureDetector(
          onTap: () {
            Get.off(() => SignInScreen(), transition: Transition.zoom);
          },
          child: Text(
            "SIGNIN",
            style: TextStyle(
              color: AppColors.colorDarkBlue,
              fontWeight: FontWeight.bold,
                fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}

class ServiceCategoryModule extends StatelessWidget {
  ServiceCategoryModule({Key? key}) : super(key: key);
  final screenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Container(
        padding: const EdgeInsets.only(right: 10),
        height: 50,
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
              canvasColor: Colors.white,
              // background color for the dropdown items
              buttonTheme: ButtonTheme.of(context).copyWith(
                alignedDropdown: true, //If false (the default), then the dropdown's menu will be wider than its button.
              )),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              icon: Image.asset(AppImages.dropDownArrowImg, scale: 2,),
              isExpanded: true,
              focusColor: Colors.white,
              value: screenController.selectServiceCategory.value,
              //elevation: 5,
              style: TextStyle(color: AppColors.colorDarkBlue1),
              iconEnabledColor: Colors.black,
              items: <String>[
                'Service Category',
                'Doctor1',
                'Doctor2',
                'Doctor3',
                'Doctor4',
                'Doctor5'
              ].
              map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: AppColors.colorDarkBlue1, fontSize: 15),
                  ),
                );
              }).toList(),
              hint: Text("Service Category", style: TextStyle(color: AppColors.colorDarkBlue1),),
              onChanged: (newValue) {
                  screenController.selectServiceCategory.value = newValue!;
              },
            ),
          ),
        ),
      ),
    );
  }
}
