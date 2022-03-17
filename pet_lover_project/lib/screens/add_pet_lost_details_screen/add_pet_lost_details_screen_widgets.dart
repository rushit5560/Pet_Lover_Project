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
import 'package:pet_lover_project/controllers/add_pet_lost_details_screen_controller/add_pet_lost_details_screen_controller.dart';

class AddPetLostDetailsForm extends StatefulWidget {
  AddPetLostDetailsForm({Key? key}) : super(key: key);

  @override
  State<AddPetLostDetailsForm> createState() => _AddPetLostDetailsFormState();
}

class _AddPetLostDetailsFormState extends State<AddPetLostDetailsForm> {
  final ImagePicker imagePicker = ImagePicker();
  final FieldValidator fieldValidator = FieldValidator();
  final addPetLostDetailsScreenController = Get.find<AddPetLostDetailsScreenController>();
  String _selectedDate = 'Lost Date';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2025),
    );
    if (d != null) {
      setState(() {
        _selectedDate = DateFormat.yMMMMd("en_US").format(d);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: addPetLostDetailsScreenController.detailsFormKey,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            addPhoto(),
            SizedBox(height: 25,),
            selectAnimalDropDownButton(),
            SizedBox(height: 25,),
            addDescriptionTextFieldModule(),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 45),
              child: Row(
                children: [
                  Expanded(child: ageDropDownButton()),
                  SizedBox(width: 25,),
                  Expanded(child: genderDropDownButton()),
                ],
              ),
            ),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 45),
              child: Row(
                children: [
                  Expanded(child: breedDropDownButton()),
                  SizedBox(width: 25,),
                  Expanded(child: weightDropDownButton()),
                ],
              ),
            ),
            SizedBox(height: 25,),
            colorTextFieldModule(),
            SizedBox(height: 25,),
            lostDateTextFieldModule(),
            SizedBox(height: 25,),
            locationTextFieldModule(),
            SizedBox(height: 25,),
            statusDropDownModule(),
            SizedBox(height: 25,),
            postButtonModule()
          ],
        ),
      ),
    );
  }

  Widget addPhoto(){
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
        child: addPetLostDetailsScreenController.file != null ? Image.file(addPetLostDetailsScreenController.file!, fit: BoxFit.fill,) :
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.addImageImg, scale: 2.5,),
            SizedBox(height: 10,),
            Text("Add Photo", style: TextStyle(color: AppColors.colorDarkBlue1))
          ],
        ),

      ),
    );
  }

  void openGallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        addPetLostDetailsScreenController.file = File(image.path);
        print('Camera File Path : ${addPetLostDetailsScreenController.file}');
        print('Camera Image Path : ${image.path}');
        //Fluttertoast.showToast(msg: '${image.path}', toastLength: Toast.LENGTH_LONG);
        //renameImage();
      });
    } else {}
  }

  Widget selectAnimalDropDownButton(){
    return Obx(()=>
        Padding(
          padding: const EdgeInsets.only(left: 45, right: 45),
          child: Container(
            padding: const EdgeInsets.only(right: 10),
            height: 45,
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
                  canvasColor:  Colors.white,
                  // background color for the dropdown items
                  buttonTheme: ButtonTheme.of(context).copyWith(
                    alignedDropdown: true, //If false (the default), then the dropdown's menu will be wider than its button.
                  )),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  icon: Image.asset(AppImages.dropDownArrowImg, scale: 2,),
                  isExpanded: true,
                  focusColor: Colors.white,
                  value: addPetLostDetailsScreenController.selectAnimal.value,
                  //elevation: 5,
                  style: TextStyle(color: AppColors.colorDarkBlue1),
                  iconEnabledColor: Colors.black,
                  items: <String>[
                    'Tiger',
                    'Elephant',
                    'Giraffe',
                    'Camel',
                    'Horse'
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
                  hint: Text("Select Animal", style: TextStyle(color: AppColors.colorDarkBlue1),),
                  onChanged: (newValue) {
                    addPetLostDetailsScreenController.selectAnimal.value = newValue!;
                  },
                ),
              ),
            ),
          ),
        ),
    );
  }

  Widget addDescriptionTextFieldModule(){
    return Padding(
      padding: const EdgeInsets.only(left: 45, right: 45),
      child: Stack(
        children: [
          const TextFieldElevationModule(),
          TextFormField(
            controller: addPetLostDetailsScreenController.addDescriptionTextFieldController,
            keyboardType: TextInputType.text,
            cursorColor: AppColors.colorDarkBlue1,
            decoration: signInFormFieldDecoration(hintText: 'Add Description'),
            validator: (value) => fieldValidator.validateDescription(value!),
          ),
        ],
      ),
    );
  }

  Widget addPriceTextFieldModule(){
    return Padding(
      padding: const EdgeInsets.only(left: 45, right: 45),
      child: Stack(
        children: [
          const TextFieldElevationModule(),
          TextFormField(
            controller: addPetLostDetailsScreenController.addPriceTextFieldController,
            keyboardType: TextInputType.number,
            cursorColor: AppColors.colorDarkBlue1,
            decoration: signInFormFieldDecoration(hintText: 'Add Price'),
            validator: (value) => fieldValidator.validatePrice(value!),
          ),
        ],
      ),
    );
  }

  Widget ageDropDownButton(){
    return Obx(()=>
        Container(
          padding: const EdgeInsets.only(right: 10),
          height: 45,
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
                value: addPetLostDetailsScreenController.age.value,
                //elevation: 5,
                style: TextStyle(color: AppColors.colorDarkBlue1),
                iconEnabledColor: Colors.black,
                items: <String>[
                  '21',
                  '22',
                  '23',
                  '24',
                  '25'
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
                hint: Text("Age", style: TextStyle(color: AppColors.colorDarkBlue1),),
                onChanged: (newValue) {
                  addPetLostDetailsScreenController.age.value = newValue!;
                },
              ),
            ),
          ),
        ),
    );
  }

  Widget genderDropDownButton(){
    return Obx(()=>
        Container(
          padding: const EdgeInsets.only(right: 10),
          height: 45,
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
                value: addPetLostDetailsScreenController.gender.value,
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
                  addPetLostDetailsScreenController.gender.value = newValue!;
                },
              ),
            ),
          ),
        ),
    );
  }

  Widget breedDropDownButton(){
    return Obx(()=>
        Container(
          padding: const EdgeInsets.only(right: 10),
          height: 45,
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
                value: addPetLostDetailsScreenController.breed.value,
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
                  addPetLostDetailsScreenController.breed.value = newValue!;
                },
              ),
            ),
          ),
        ),
    );
  }

  Widget weightDropDownButton(){
    return Obx(()=>
        Container(
          padding: const EdgeInsets.only(right: 10),
          height: 45,
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
                value: addPetLostDetailsScreenController.weight.value,
                //elevation: 5,
                style: TextStyle(color: AppColors.colorDarkBlue1),
                iconEnabledColor: Colors.black,
                items: <String>[
                  '25',
                  '30',
                  '35',
                  '40',
                  '45'
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
                hint: Text("Weight", style: TextStyle(color: AppColors.colorDarkBlue1),),
                onChanged: (newValue) {
                  addPetLostDetailsScreenController.weight.value = newValue!;
                },
              ),
            ),
          ),
        ),
    );
  }

  Widget colorTextFieldModule(){
    return Padding(
      padding: const EdgeInsets.only(left: 45, right: 45),
      child: Stack(
        children: [
          const TextFieldElevationModule(),
          TextFormField(
            controller: addPetLostDetailsScreenController.colorTextFieldController,
            keyboardType: TextInputType.text,
            cursorColor: AppColors.colorDarkBlue1,
            decoration: signInFormFieldDecoration(hintText: 'Color'),
            validator: (value) => fieldValidator.validateColor(value!),
          ),
        ],
      ),
    );
  }

  Widget lostDateTextFieldModule(){
    return Padding(
      padding: const EdgeInsets.only(left: 45, right: 45),
      child: Container(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Text(
                    _selectedDate,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.colorDarkBlue1)
                ),
                onTap: (){
                  _selectDate(context);
                },
              ),
              IconButton(
                icon: Icon(Icons.calendar_today_outlined, color: AppColors.colorDarkBlue1, size: 20,),
                tooltip: 'Lost Date',
                onPressed: () {
                  _selectDate(context);
                },
              ),
            ],
          ),
        ),
      ),
      // child: Stack(
      //   children: [
      //     const TextFieldElevationModule(),
      //     TextFormField(
      //       controller: addPetLostDetailsScreenController.colorTextFieldController,
      //       keyboardType: TextInputType.text,
      //       cursorColor: AppColors.colorDarkBlue1,
      //       //decoration: signInFormFieldDecoration(hintText: 'Lost Date'),
      //       decoration: InputDecoration(
      //         hintText: "Lost Date",
      //         hintStyle: TextStyle(color: AppColors.colorDarkBlue1),
      //         suffixIcon: GestureDetector(
      //           onTap: (){
      //             _selectDate(context);
      //           },
      //             child: Icon(Icons.calendar_today)),
      //         isDense: true,
      //         contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      //         filled: true,
      //         fillColor: Colors.white,
      //         border: InputBorder.none,
      //         // suffix: IconButton(
      //         //   onPressed: () {},
      //         //   iconSize: 15,
      //         //   icon: Icon(Icons.visibility_off_rounded),
      //         // ),
      //         // suffix: Container(
      //         //   child: index == 0
      //         //       ? null
      //         //       : GestureDetector(
      //         //     onTap: () {
      //         //       signInScreenController.isPassVisible.value = !signInScreenController.isPassVisible.value;
      //         //       print('isPassVisible : ${signInScreenController.isPassVisible.value}');
      //         //     },
      //         //     child: Obx(
      //         //       ()=> Icon(signInScreenController.isPassVisible.value
      //         //           ? Icons.visibility_rounded
      //         //           : Icons.visibility_off_rounded),
      //         //     ),
      //         //   ),
      //         // ),
      //       ),
      //       //validator: (value) => fieldValidator.validateColor(value!),
      //     ),
      //   ],
      // ),
    );
  }

  Widget locationTextFieldModule(){
    /*return Padding(
      padding: const EdgeInsets.only(left: 45, right: 45),
      child: Stack(
        children: [
          const TextFieldElevationModule(),
          TextFormField(
            controller: addPetLostDetailsScreenController.colorTextFieldController,
            keyboardType: TextInputType.text,
            cursorColor: AppColors.colorDarkBlue1,
            decoration: signInFormFieldDecoration(hintText: 'Location'),
            validator: (value) => fieldValidator.validateLocation(value!),
          ),
        ],
      ),
    );*/
    return Padding(
      padding: const EdgeInsets.only(left: 45, right: 45),
      child: Container(
        height: 45,
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
              Image.asset(AppImages.locationImg, scale: 1.5,)
            ],
          ),
        ),
      ),
      // child: Stack(
      //   children: [
      //     const TextFieldElevationModule(),
      //     TextFormField(
      //       controller: addPetLostDetailsScreenController.colorTextFieldController,
      //       keyboardType: TextInputType.text,
      //       cursorColor: AppColors.colorDarkBlue1,
      //       //decoration: signInFormFieldDecoration(hintText: 'Lost Date'),
      //       decoration: InputDecoration(
      //         hintText: "Lost Date",
      //         hintStyle: TextStyle(color: AppColors.colorDarkBlue1),
      //         suffixIcon: GestureDetector(
      //           onTap: (){
      //             _selectDate(context);
      //           },
      //             child: Icon(Icons.calendar_today)),
      //         isDense: true,
      //         contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      //         filled: true,
      //         fillColor: Colors.white,
      //         border: InputBorder.none,
      //         // suffix: IconButton(
      //         //   onPressed: () {},
      //         //   iconSize: 15,
      //         //   icon: Icon(Icons.visibility_off_rounded),
      //         // ),
      //         // suffix: Container(
      //         //   child: index == 0
      //         //       ? null
      //         //       : GestureDetector(
      //         //     onTap: () {
      //         //       signInScreenController.isPassVisible.value = !signInScreenController.isPassVisible.value;
      //         //       print('isPassVisible : ${signInScreenController.isPassVisible.value}');
      //         //     },
      //         //     child: Obx(
      //         //       ()=> Icon(signInScreenController.isPassVisible.value
      //         //           ? Icons.visibility_rounded
      //         //           : Icons.visibility_off_rounded),
      //         //     ),
      //         //   ),
      //         // ),
      //       ),
      //       //validator: (value) => fieldValidator.validateColor(value!),
      //     ),
      //   ],
      // ),
    );
  }

  Widget statusDropDownModule(){
    return Obx(()=>
        Container(
          padding: const EdgeInsets.only(right: 10),
          height: 45,
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
                value: addPetLostDetailsScreenController.status.value,
                //elevation: 5,
                style: TextStyle(color: AppColors.colorDarkBlue1),
                iconEnabledColor: Colors.black,
                items: <String>[
                  'Lost',
                  'Found',
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
                hint: Text("Status", style: TextStyle(color: AppColors.colorDarkBlue1),),
                onChanged: (newValue) {
                  addPetLostDetailsScreenController.status.value = newValue!;
                },
              ),
            ),
          ),
        ),
    );
  }

  Widget postButtonModule(){
    return GestureDetector(
      onTap: () {
        if(addPetLostDetailsScreenController.detailsFormKey.currentState!.validate()){
          if(addPetLostDetailsScreenController.file == null){
            Fluttertoast.showToast(msg: 'Profile Image required...!');
          }
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.colorDarkBlue1,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Text(
            'POST',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}