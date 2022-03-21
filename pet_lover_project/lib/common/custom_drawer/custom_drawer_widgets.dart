import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';
import 'package:pet_lover_project/screens/adopt_pet_screen/adopt_pet_screen.dart';
import 'package:pet_lover_project/screens/my_order_screen/my_order_screen.dart';
import 'package:pet_lover_project/screens/sign_in_screen/sign_in_screen.dart';
import 'package:pet_lover_project/screens/vet_consultation_screen/vet_consultation_screen.dart';

import '../../screens/lost_pet_list_screen/lost_pet_list_screen.dart';
import '../../screens/profile_screens/pet_profile_screen/pet_profile_screen.dart';
import '../constants/app_colors.dart';

class UserDetailsModule extends StatelessWidget {
  const UserDetailsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Material(
                  elevation: 6,
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset(AppImages.profilePicImg),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'johndeo@gmail.com',
                      style: TextStyle(
                          fontSize: 11
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Image.asset(AppImages.editOptionImg),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PetProfileModule extends StatelessWidget {
  const PetProfileModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
        Get.to(()=> PetProfileScreen(), transition: Transition.leftToRight);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 1,
                blurStyle: BlurStyle.outer
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(AppImages.option1Img),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      'Pet Profile',
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColors.colorDarkBlue1,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationModule extends StatelessWidget {
  const NotificationModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
        // Get.to(()=> PetProfileScreen(), transition: Transition.leftToRight);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 1,
                blurStyle: BlurStyle.outer
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(AppImages.option2Img),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      'Notification',
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColors.colorDarkBlue1,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoyaltyPointModule extends StatelessWidget {
  const LoyaltyPointModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
        // Get.to(()=> PetProfileScreen(), transition: Transition.leftToRight);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 1,
                blurStyle: BlurStyle.outer
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(AppImages.option3Img),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      'Loyalty Point',
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColors.colorDarkBlue1,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OnlineVetConsultationModule extends StatelessWidget {
  const OnlineVetConsultationModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
        Get.to(()=> VetConsultationScreen(), transition: Transition.leftToRight);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 1,
                blurStyle: BlurStyle.outer
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(AppImages.option4Img),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      'Online Vet Consultation',
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColors.colorDarkBlue1,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BlogModule extends StatelessWidget {
  const BlogModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: AppColors.colorDarkBlue1.withOpacity(0.2),
              blurRadius: 8,
              spreadRadius: 1,
              blurStyle: BlurStyle.outer
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset(AppImages.option5Img),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    'Blog',
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.colorDarkBlue1,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
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

class CostManagerModule extends StatelessWidget {
  const CostManagerModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: AppColors.colorDarkBlue1.withOpacity(0.2),
              blurRadius: 8,
              spreadRadius: 1,
              blurStyle: BlurStyle.outer
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset(AppImages.option6Img),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    'Cost Manager',
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.colorDarkBlue1,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
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

class SignOutModule extends StatelessWidget {
  const SignOutModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
        Get.offAll(()=> SignInScreen(), transition: Transition.leftToRight);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 1,
                blurStyle: BlurStyle.outer
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(AppImages.option7Img),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      'Sign Out',
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColors.colorDarkBlue1,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class AdoptPetModule extends StatelessWidget {
  const AdoptPetModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       Get.back();
       Get.to(()=> AdoptPetScreen(), transition: Transition.leftToRight);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 1,
                blurStyle: BlurStyle.outer
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(AppImages.option5Img),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      'Adopt Pet',
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColors.colorDarkBlue1,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LostPetListModule extends StatelessWidget {
  const LostPetListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
        Get.to(()=> LostPetListScreen(), transition: Transition.leftToRight);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 1,
                blurStyle: BlurStyle.outer
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(AppImages.option5Img),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      'Lost Pet',
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColors.colorDarkBlue1,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyOrdersModule extends StatelessWidget {
  const MyOrdersModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
        Get.to(()=> const MyOrderScreen(), transition: Transition.leftToRight);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 1,
                blurStyle: BlurStyle.outer
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(AppImages.option5Img),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      'My Orders',
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColors.colorDarkBlue1,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

