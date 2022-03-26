import 'package:flutter/material.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';

class BlogDetailsProfile extends StatelessWidget {
  const BlogDetailsProfile({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
        child: Image.asset(AppImages.blogDetailImg));
  }
}

class BlogDetailsHeading extends StatelessWidget {
  const BlogDetailsHeading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry", style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18
        ),),
        SizedBox(height: 20,),
        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
          style: TextStyle(fontSize: 13
        ),)
      ],
    );
  }
}

class BlogDetails extends StatelessWidget {
  const BlogDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(45),
          child: Image.asset(AppImages.chatProfile3Img, scale: 12,),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Denver Ballard", style: TextStyle(color: AppColors.colorDarkBlue1, fontSize: 17),),
              const SizedBox(height: 7,),
              Row(
                children: [
                  Row(
                    children: [
                      Image.asset(AppImages.likeImg, scale: 1.7,),
                      const SizedBox(width: 10,),
                      Text("30", style: TextStyle(color: AppColors.colorDarkBlue1),)
                    ],
                  ),
                  const SizedBox(width: 20,),
                  Row(
                    children: [
                      Image.asset(AppImages.msgIconImg, scale: 1.7,),
                      const SizedBox(width: 10,),
                      Text("30", style: TextStyle(color: AppColors.colorDarkBlue1),)
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

