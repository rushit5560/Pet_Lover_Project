import 'package:flutter/material.dart';

import '../common/constants/app_colors.dart';

class ExtraScreen extends StatelessWidget {
  ExtraScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 50),

                Stack(
                  children: [

                    Container(
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
                    ),


                    TextFormField(
                      controller: usernameController,

                      decoration: const InputDecoration(
                        hintText: 'abc@gmail.com',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.visibility_rounded),
                      ),

                      validator: (value) {
                        if(value!.isEmpty){
                          return "Field is Required!";
                        }
                        return null;
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 50),

                GestureDetector(
                  onTap: () {
                    if(formKey.currentState!.validate()){}
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
