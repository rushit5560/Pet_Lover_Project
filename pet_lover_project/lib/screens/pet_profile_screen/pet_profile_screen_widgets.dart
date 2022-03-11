import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/common_widgets.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';
import 'package:pet_lover_project/common/constants/field_decorations.dart';
import 'package:pet_lover_project/common/field_validation.dart';
import 'package:pet_lover_project/controllers/pet_profile_screen_controller/pet_profile_screen_controller.dart';
import 'package:pet_lover_project/screens/sign_up_screen/sign_up_screen_widgets.dart';

class ProfileForm extends StatelessWidget {
  ProfileForm({Key? key}) : super(key: key);
  final petProfileScreenController = Get.find<PetProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: petProfileScreenController.profileFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AddPhoto(),
          SizedBox(height: 20,),
          NameTextFieldModule(),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: DobPicker()
              ),
              SizedBox(width: 20,),
              Expanded(
                  child: GenderTextFieldModule()
              )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                  child: BreedTextFieldModule()
              ),
              SizedBox(width: 20,),
              Expanded(
                  child: WeightTextFieldModule()
              )
            ],
          ),
          SizedBox(height: 20,),
          ColorTextFieldModule(),
          SizedBox(height: 20,),
          VaccinatedRadio(),
          SizedBox(height: 20,),
          TemperamentRadio(),
          SizedBox(height: 20,),
          MicroChippedRadio(),
          SizedBox(height: 20,),
          NeuteredRadio(),
          SizedBox(height: 20,),
          SaveButtonModule()
        ],
      ),
    );
  }

}

class AddPhoto extends StatelessWidget {
  const AddPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
              height: Get.height/8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    spreadRadius: 5,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.addImageImg, scale: 2,),
                  SizedBox(height: 10,),
                  Text("Add Photo", style: TextStyle(color: AppColors.colorDarkBlue1),)
                ],
              ),
            )
        ),
        SizedBox(width: 20,),
        Expanded(
            child: Container(
              height: Get.height/8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    spreadRadius: 5,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.addVideoImg, scale: 2,),
                  SizedBox(height: 10,),
                  Text("Add Video", style: TextStyle(color: AppColors.colorDarkBlue1))
                ],
              ),
            )
        ),



      ],
    );
  }
}

class NameTextFieldModule extends StatelessWidget {
  NameTextFieldModule({Key? key}) : super(key: key);
  final petProfileScreenController = Get.find<PetProfileScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TextFieldElevationModule(),
        TextFormField(
          controller: petProfileScreenController.nameTextFieldController,
          keyboardType: TextInputType.text,
          cursorColor: AppColors.colorDarkBlue1,
          decoration: signInFormFieldDecoration(hintText: 'Pet Name'),
          validator: (value) => fieldValidator.validateFullName(value!),
        ),
      ],
    );
  }
}

class DobPicker extends StatelessWidget {
  DobPicker({Key? key}) : super(key: key);
  final petProfileScreenController = Get.find<PetProfileScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TextFieldElevationModule(),
        TextFormField(
          controller: petProfileScreenController.nameTextFieldController,
          keyboardType: TextInputType.text,
          cursorColor: AppColors.colorDarkBlue1,
          decoration: signInFormFieldDecoration(hintText: 'DOB'),
          validator: (value) => fieldValidator.validateFullName(value!),
        ),
      ],
    );
  }
}

class GenderTextFieldModule extends StatelessWidget {
  GenderTextFieldModule({Key? key}) : super(key: key);
  final petProfileScreenController = Get.find<PetProfileScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TextFieldElevationModule(),
        TextFormField(
          controller: petProfileScreenController.nameTextFieldController,
          keyboardType: TextInputType.text,
          cursorColor: AppColors.colorDarkBlue1,
          decoration: signInFormFieldDecoration(hintText: 'Gender'),
          validator: (value) => fieldValidator.validateFullName(value!),
        ),
      ],
    );
  }
}

class BreedTextFieldModule extends StatelessWidget {
  BreedTextFieldModule({Key? key}) : super(key: key);
  final petProfileScreenController = Get.find<PetProfileScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TextFieldElevationModule(),
        TextFormField(
          controller: petProfileScreenController.nameTextFieldController,
          keyboardType: TextInputType.text,
          cursorColor: AppColors.colorDarkBlue1,
          decoration: signInFormFieldDecoration(hintText: 'Breed'),
          validator: (value) => fieldValidator.validateFullName(value!),
        ),
      ],
    );
  }
}

class WeightTextFieldModule extends StatelessWidget {
  WeightTextFieldModule({Key? key}) : super(key: key);
  final petProfileScreenController = Get.find<PetProfileScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TextFieldElevationModule(),
        TextFormField(
          controller: petProfileScreenController.nameTextFieldController,
          keyboardType: TextInputType.text,
          cursorColor: AppColors.colorDarkBlue1,
          decoration: signInFormFieldDecoration(hintText: 'Weight'),
          validator: (value) => fieldValidator.validateFullName(value!),
        ),
      ],
    );
  }
}

class ColorTextFieldModule extends StatelessWidget {
  ColorTextFieldModule({Key? key}) : super(key: key);
  final petProfileScreenController = Get.find<PetProfileScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TextFieldElevationModule(),
        TextFormField(
          controller: petProfileScreenController.colorTextFieldController,
          keyboardType: TextInputType.text,
          cursorColor: AppColors.colorDarkBlue1,
          decoration: signInFormFieldDecoration(hintText: 'Color'),
          validator: (value) => fieldValidator.validateColor(value!),
        ),
      ],
    );
  }
}

class SaveButtonModule extends StatelessWidget {
  SaveButtonModule({Key? key}) : super(key: key);
  final petProfileScreenController = Get.find<PetProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(petProfileScreenController.profileFormKey.currentState!.validate()){

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
            'SAVE',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}

class VaccinatedRadio extends StatelessWidget {
  VaccinatedRadio({Key? key}) : super(key: key);

  final petProfileScreenController = Get.find<PetProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                spreadRadius: 5,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: ListTile(
            trailing: Radio<String>(
              value: 'Vaccinated',
              activeColor: AppColors.colorDarkBlue1,
              groupValue: petProfileScreenController.vaccinate.value,
              onChanged: (value) {
                //setState(() {
                petProfileScreenController.vaccinate.value = value!;
                // });
              },
            ),
            title: Text('Vaccinated', style: TextStyle(color: AppColors.colorDarkBlue1),),
          ),
        ),
    );
  }
}

class TemperamentRadio extends StatelessWidget {
  TemperamentRadio({Key? key}) : super(key: key);

  final petProfileScreenController = Get.find<PetProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                spreadRadius: 5,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: ListTile(
            trailing: Radio<String>(
              value: 'Temperament',
              activeColor: AppColors.colorDarkBlue1,
              groupValue: petProfileScreenController.vaccinate.value,
              onChanged: (value) {
                //setState(() {
                petProfileScreenController.vaccinate.value = value!;
                // });
              },
            ),
            title: Text('Temperament',style: TextStyle(color: AppColors.colorDarkBlue1),),
          ),
        ),
    );
  }
}

class MicroChippedRadio extends StatelessWidget {
  MicroChippedRadio({Key? key}) : super(key: key);

  final petProfileScreenController = Get.find<PetProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                spreadRadius: 5,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: ListTile(
            trailing: Radio<String>(
              value: 'Microchipped',
              activeColor: AppColors.colorDarkBlue1,
              groupValue: petProfileScreenController.vaccinate.value,
              onChanged: (value) {
                //setState(() {
                petProfileScreenController.vaccinate.value = value!;
                // });
              },
            ),
            title:  Text('Microchipped', style: TextStyle(color: AppColors.colorDarkBlue1),),
          ),
        ),
    );
  }
}

class NeuteredRadio extends StatelessWidget {
  NeuteredRadio({Key? key}) : super(key: key);

  final petProfileScreenController = Get.find<PetProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                spreadRadius: 5,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: ListTile(
            trailing: Radio<String>(
              value: 'Neutered',
              activeColor: AppColors.colorDarkBlue1,
              groupValue: petProfileScreenController.vaccinate.value,
              onChanged: (value) {
                //setState(() {
                petProfileScreenController.vaccinate.value = value!;
                // });
              },
            ),
            title:  Text('Neutered', style: TextStyle(color: AppColors.colorDarkBlue1),),
          ),
        ),
    );
  }
}