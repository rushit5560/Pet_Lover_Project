import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_images.dart';

class VetDetailsBackButtonModule extends StatelessWidget {
  const VetDetailsBackButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        height: 52,
        width: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 1,
                blurStyle: BlurStyle.outer
            ),
          ],
        ),

        child: Image.asset(
          AppImages.backButton,
          scale: 2,
        ),
      ),
    );
  }
}

class VetImageModule extends StatelessWidget {
  const VetImageModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.40,
      width: Get.width,
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.productImgListImg),
          fit: BoxFit.cover,
          // fit: BoxFit.cover
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Image.asset(AppImages.vetConsultation5Img),
      ),
    );
  }
}

class VetNameAndSpecialistModule extends StatelessWidget {
  const VetNameAndSpecialistModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Text(
          'Dr. John Doe',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Dog Specialist',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}

class AddressAndTimeModule extends StatelessWidget {
  const AddressAndTimeModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _singleRowModule(title: 'Address', text: '3254, Lorem Ipsum is simply dummy text of the printing and typesetting industry has been the industry', i: 0),
        const SizedBox(height: 10),
        _singleRowModule(title: 'Time', text: '9:00 AM to 10:00 PM'),
        const SizedBox(height: 10),
        _singleRowModule(title: 'Days', text: 'Monday To Saturday'),
        const SizedBox(height: 10),
        _singleRowModule(title: 'Fees', text: '\$500/day'),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _singleRowModule({required String title, required String text, int i = 1}) {
    return Row(
      crossAxisAlignment: i == 0 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            '$title -',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,

            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            text,
            maxLines: i == 0 ? 2 : 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

}

class BookAppointmentAndMessageModule extends StatelessWidget {
  const BookAppointmentAndMessageModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.colorDarkBlue1,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: Row(
              children: const [
                Text(
                  'Book Appointment',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 5),
                Icon(Icons.calendar_month, color: Colors.white, size: 15)
              ],
            ),
          ),
        ),
        const SizedBox(width: 15),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.colorDarkBlue1,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: Row(
              children: const [
                Text(
                  'Message',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 5),
                Icon(Icons.chat_bubble_rounded, color: Colors.white, size: 15)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
