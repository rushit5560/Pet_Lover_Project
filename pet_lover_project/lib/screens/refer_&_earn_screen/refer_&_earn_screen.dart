import 'package:flutter/material.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/common/custom_appbar/custom_appbar.dart';
import 'package:pet_lover_project/common/extension_methods/extension_methods.dart';
import 'package:pet_lover_project/screens/refer_&_earn_screen/refer_earn_screen_widgets.dart';

class ReferEarnScreen extends StatelessWidget {
  const ReferEarnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonAppBarModule(title: 'Refer & Earn', appBarOption: AppBarOption.backButtonScreenOption),

            const SizedBox(height: 40,),
            const ReferEarnImage(),
            const SizedBox(height: 30,),
            const InviteFriendsText(),
            const SizedBox(height: 20,),
            const CopyText(),
            const SizedBox(height: 20,),
            const InviteButtonModule()

          ],
        ).commonPadding(),
      ),
    );
  }
}
