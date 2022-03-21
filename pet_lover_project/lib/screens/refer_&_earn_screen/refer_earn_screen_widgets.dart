import 'package:flutter/material.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';

class ReferEarnImage extends StatelessWidget {
  const ReferEarnImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.referEarnImg, scale: 2.5);
  }
}


class InviteFriendsText extends StatelessWidget {
  const InviteFriendsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Invite Your Friends to Pet Lover", style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 21
        ),),

        SizedBox(height: 20,),
        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
          style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),)
      ],
    );
  }
}

class CopyText extends StatelessWidget {
  const CopyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text("Copy Your Code", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),),
        SizedBox(width: 15,),
        Text("Zh6gf5", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
      ],
    );
  }
}

class InviteButtonModule extends StatelessWidget {
  const InviteButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.colorDarkBlue1
      ),
      child: const Center(
        child: Text("Invite", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
      ),
    );
  }
}
