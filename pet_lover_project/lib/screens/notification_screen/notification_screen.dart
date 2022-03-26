import 'package:flutter/material.dart';
import 'package:pet_lover_project/common/constants/enums.dart';
import 'package:pet_lover_project/common/custom_appbar/custom_appbar.dart';
import 'package:pet_lover_project/common/extension_methods/extension_methods.dart';
import 'package:pet_lover_project/screens/notification_screen/notification_screen_widgets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CommonAppBarModule(title: 'Notification', appBarOption: AppBarOption.backButtonScreenOption),

            const SizedBox(height: 20,),

            const Expanded(
              child: NotificationList(),
            )
          ],
        ).commonPadding(),
      ),
    );
  }
}
