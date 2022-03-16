import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';
import 'package:pet_lover_project/models/cart_screen_model/cart_screen_model.dart';

class CartScreenController extends GetxController{

  RxInt count = 1.obs;
  RxBool isLoading = false.obs;

  List<CartItemModel> basketItemsList = [
    CartItemModel(
      img: AppImages.accessories5Img,
      name: 'Lorem Ipsum Lorem Ipsum',
      amount: '\$15.00',
      qty: 1,
    ),
    CartItemModel(
      img: AppImages.accessories6Img,
      name: 'Lorem Ipsum',
      amount: '\$20.00',
      qty: 1,
    ),
    CartItemModel(
      img: AppImages.accessories5Img,
      name: 'Lorem Ipsum',
      amount: '\$20.00',
      qty: 1,
    ),
    CartItemModel(
      img: AppImages.accessories6Img,
      name: 'Lorem Ipsum',
      amount: '\$15.00',
      qty: 1,
    ),
  ];

  void onClickedInc(int index) {
    isLoading(true);
    if(basketItemsList[index].qty < 9){
      basketItemsList[index].qty++;
    }
    isLoading(false);
  }

  void onClickedDec(int index) {
    isLoading(true);
    if (basketItemsList[index].qty > 0) {
      basketItemsList[index].qty--;
    }
    isLoading(false);
  }
}