import 'package:flutter/material.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/common/custom_appbar/custom_appbar.dart';
import 'package:pet_lover_project/common/extension_methods/extension_methods.dart';
import 'package:pet_lover_project/screens/blog_details_screen/blog_details_screen_widgets.dart';

class BlogDetailsScreen extends StatelessWidget {
  const BlogDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CommonAppBarModule(title: 'Blog', appBarOption: AppBarOption.blogDetailScreenOption),
            const SizedBox(height: 20,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    BlogDetailsProfile(),
                    SizedBox(height: 20,),
                    BlogDetailsHeading(),
                    SizedBox(height: 20,),
                    BlogDetails(),
                  ],
                ),
              ),
            )
          ],
        ).commonAllSidePadding(),
      ),
    );
  }
}
