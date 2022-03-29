import 'package:flutter/material.dart';
import 'package:pet_service_project/common/extension_methods/extension_methods.dart';

import '../../common/constants/box_decorations.dart';

class HeadingModule extends StatelessWidget {
  const HeadingModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Services',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(width: 15),
        Text(
          'Prices',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    ).commonSymmetricPadding(horizontal: 10);
  }
}

class MyServicesListsModule extends StatelessWidget {
  const MyServicesListsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return Container(
          decoration: containerElevationDecoration(),
          child: Row(
            children: const [
              Expanded(
                child: Text(
                  'Service Name',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Text(
                  '\$25.00',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ).commonAllSidePadding(padding: 10),
        ).commonSymmetricPadding(vertical: 10);
      },
    ).commonSymmetricPadding(horizontal: 10);
  }
}

