import 'package:flutter/material.dart';
import 'package:pet_service_project/common/extension_methods/extension_methods.dart';

import '../../common/constants/enums.dart';
import '../../common/custom_appbar/custom_appbar.dart';
import 'my_service_screen_widgets.dart';

class MyServiceScreen extends StatelessWidget {
  const MyServiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CommonAppBarModule(title: 'My Services', appBarOption: AppBarOption.backButtonScreenOption),
            const SizedBox(height: 35),

            HeadingModule(),
            const SizedBox(height: 15),
            Expanded(child: const MyServicesListsModule()),
          ],
        ).commonAllSidePadding(),
      ),
    );
  }
}
