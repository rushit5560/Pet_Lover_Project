import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 45, right: 45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              AddPhoto(),
              SizedBox(height: 25,),
              NameTextFieldModule(),
              SizedBox(height: 25,),
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
              SizedBox(height: 25,),
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
              SizedBox(height: 25,),
              ColorTextFieldModule(),
              SizedBox(height: 25,),
              VaccinatedRadio(),
              SizedBox(height: 25,),
              TemperamentRadio(),
              SizedBox(height: 25,),
              MicroChippedRadio(),
              SizedBox(height: 25,),
              NeuteredRadio(),
              SizedBox(height: 25,),
              SaveButtonModule()
            ],
          ),
        ),
      ),
    );
  }

}

class AddPhoto extends StatefulWidget {
  AddPhoto({Key? key}) : super(key: key);

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  final ImagePicker imagePicker = ImagePicker();
  final petProfileScreenController = Get.find<PetProfileScreenController>();

  XFile? file1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        openGallery();
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
          child: petProfileScreenController.file != null ? Image.file(petProfileScreenController.file!, fit: BoxFit.fill,) :
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.addImageImg, scale: 2.5,),
              const SizedBox(height: 10,),
              Text("Add Photo", style: TextStyle(color: AppColors.colorDarkBlue1))
            ],
          ),
        ),
      ),
    );
  }

  void openGallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        petProfileScreenController.file = File(image.path);
        print('Camera File Path : ${petProfileScreenController.file}');
        print('Camera Image Path : ${image.path}');
        //Fluttertoast.showToast(msg: '${image.path}', toastLength: Toast.LENGTH_LONG);
        //renameImage();
      });
    } else {}
  }

  void pickVideoFromGallery() async {
    file1 = await imagePicker.pickVideo(source: ImageSource.gallery);
    if (file1 != null) {
      setState(() {

      });
    }
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

  //String _selectedDate = 'Lost Date';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2025),
    );
    if (d != null) {
      //setState(() {
      petProfileScreenController.selectedDate.value = DateFormat.yMMMMd("en_US").format(d);
      //});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Container(
        height: 45,
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
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: InkWell(
                  child: Text(
                      petProfileScreenController.selectedDate.value,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.colorDarkBlue1)
                  ),
                  onTap: (){
                    _selectDate(context);
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: Icon(Icons.calendar_today_outlined, color: AppColors.colorDarkBlue1, size: 20,),
                  tooltip: 'DOB',
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GenderTextFieldModule extends StatefulWidget {
  GenderTextFieldModule({Key? key}) : super(key: key);

  @override
  State<GenderTextFieldModule> createState() => _GenderTextFieldModuleState();
}

class _GenderTextFieldModuleState extends State<GenderTextFieldModule> {
  final petProfileScreenController = Get.find<PetProfileScreenController>();

  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Container(
         padding: const EdgeInsets.only(right: 10),
          height: 45,
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
              canvasColor: Colors.grey.shade100,
              // background color for the dropdown items
              buttonTheme: ButtonTheme.of(context).copyWith(
                alignedDropdown: true, //If false (the default), then the dropdown's menu will be wider than its button.
              )),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              icon: Image.asset(AppImages.dropDownArrowImg, scale: 2,),
              isExpanded: true,
              focusColor: Colors.white,
              value: petProfileScreenController.gender,
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
                setState(() {
                  petProfileScreenController.gender = newValue!;
                });
                },
            ),
          ),
        ),
    );
  }
}

class BreedTextFieldModule extends StatefulWidget {
  BreedTextFieldModule({Key? key}) : super(key: key);

  @override
  State<BreedTextFieldModule> createState() => _BreedTextFieldModuleState();
}

class _BreedTextFieldModuleState extends State<BreedTextFieldModule> {
  final petProfileScreenController = Get.find<PetProfileScreenController>();

  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Container(
           padding: const EdgeInsets.only(right: 10),
          height: 45,
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
                canvasColor: Colors.grey.shade100,
                // background color for the dropdown items
                buttonTheme: ButtonTheme.of(context).copyWith(
                  alignedDropdown: true, //If false (the default), then the dropdown's menu will be wider than its button.
                )),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: Image.asset(AppImages.dropDownArrowImg, scale: 2,),
                isExpanded: true,
                focusColor: Colors.white,
                value: petProfileScreenController.breed,
                //elevation: 5,
                style: TextStyle(color: AppColors.colorDarkBlue1),
                iconEnabledColor: Colors.black,
                items: <String>[
                  '1',
                  '2',
                  '3'
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
                hint: Text("Breed", style: TextStyle(color: AppColors.colorDarkBlue1),),
                onChanged: (newValue) {
                  petProfileScreenController.breed = newValue!;
                },
              ),
            ),
          ),
    );
  }
}

class WeightTextFieldModule extends StatefulWidget {
  WeightTextFieldModule({Key? key}) : super(key: key);

  @override
  State<WeightTextFieldModule> createState() => _WeightTextFieldModuleState();
}

class _WeightTextFieldModuleState extends State<WeightTextFieldModule> {
  final petProfileScreenController = Get.find<PetProfileScreenController>();

  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Container(
           padding: const EdgeInsets.only(right: 10),
          height: 45,
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
                canvasColor: Colors.grey.shade100,
                // background color for the dropdown items
                buttonTheme: ButtonTheme.of(context).copyWith(
                  alignedDropdown: true, //If false (the default), then the dropdown's menu will be wider than its button.
                )),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: Image.asset(AppImages.dropDownArrowImg, scale: 2,),
                isExpanded: true,
                focusColor: Colors.white,
                value: petProfileScreenController.weight,
                //elevation: 5,
                style: TextStyle(color: AppColors.colorDarkBlue1),
                iconEnabledColor: Colors.black,
                items: <String>[
                  '31',
                  '32',
                  '33'
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
                hint: Text("Breed", style: TextStyle(color: AppColors.colorDarkBlue1),),
                onChanged: (newValue) {
                  setState(() {
                    petProfileScreenController.weight = newValue!;
                  });

                },
              ),
            ),
          ),
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
          if(petProfileScreenController.file == null){
            Fluttertoast.showToast(msg: 'Profile Image required...!');
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.colorDarkBlue1,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
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
          height: 45,
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
          height: 45,
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
          height: 45,
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
          height: 45,
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