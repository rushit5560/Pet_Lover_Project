import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_lover_project/common/constants/app_colors.dart';
import 'package:pet_lover_project/common/constants/app_images.dart';
import 'package:pet_lover_project/common/field_validation.dart';
import 'package:pet_lover_project/controllers/checkout_screen_controller/checkout_screen_controller.dart';


Widget paymentText() {
  return const Text(
    "Payment",
    style: TextStyle(
        fontWeight: FontWeight.w700, fontSize: 18, color: Colors.black),
  );
}

class PaymentDetails extends StatelessWidget {
  PaymentDetails({Key? key}) : super(key: key);

  final checkoutScreenController = Get.find<CheckoutScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        debitCardRadio(),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  children: [
                    CardNumberTextField(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DateTextField(),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: CvvTextField(),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              flex: 1,
              child: SaveButtonModule(),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        upiPayment(),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: UpiTextField(),
            ),
            const SizedBox(width: 15),
            Expanded(
              flex: 1,
              child: UPISaveButtonModule(),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        cashOnDelivery()
      ],
    );
  }

  Widget debitCardRadio() {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: ListTile(
          trailing: Radio<String>(
            value: 'CREDIT/DEBIT CARD',
            activeColor: AppColors.colorDarkBlue1,
            groupValue: checkoutScreenController.payment.value,
            onChanged: (value) {
              checkoutScreenController.payment.value = value!;
            },
          ),
          leading: Image.asset(
            AppImages.debitCardImg,
            scale: 2,
          ),
          title: const Text('CREDIT/DEBIT CARD'),
        ),
      ),
    );
  }

  Widget upiPayment() {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: ListTile(
          trailing: Radio<String>(
            value: 'UPI PAYMENT',
            activeColor: AppColors.colorDarkBlue1,
            groupValue: checkoutScreenController.payment.value,
            onChanged: (value) {
              checkoutScreenController.payment.value = value!;
            },
          ),
          leading: Image.asset(
            AppImages.upiImg,
            scale: 2,
          ),
          title: const Text('UPI PAYMENT'),
        ),
      ),
    );
  }

  Widget cashOnDelivery() {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: ListTile(
          trailing: Radio<String>(
            value: 'CASH ON DELIVERY',
            activeColor: AppColors.colorDarkBlue1,
            groupValue: checkoutScreenController.payment.value,
            onChanged: (value) {
              checkoutScreenController.payment.value = value!;
            },
          ),
          leading: Image.asset(
            AppImages.cashOnDeliveryImg,
            scale: 2,
          ),
          title: const Text('CASH ON DELIVERY'),
        ),
      ),
    );
  }
}

class CardNumberTextField extends StatelessWidget {
  CardNumberTextField({Key? key}) : super(key: key);
  final checkoutScreenController = Get.find<CheckoutScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 5,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
        ),
        TextFormField(
          controller: checkoutScreenController.cardNumberTextFieldController,
          keyboardType: TextInputType.number,
          cursorColor: AppColors.colorDarkBlue1,
          decoration: InputDecoration(
            hintText: "Card Number",
            hintStyle: TextStyle(color: AppColors.colorDarkBlue1),
            contentPadding: const EdgeInsets.only(left: 15, bottom: 7),
            border: InputBorder.none,
          ),
          validator: (value) => fieldValidator.validateEmail(value!),
        ),
      ],
    );
  }
}

class DateTextField extends StatelessWidget {
  DateTextField({Key? key}) : super(key: key);
  final checkoutScreenController = Get.find<CheckoutScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 5,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
        ),
        TextFormField(
          controller: checkoutScreenController.dateTextFieldController,
          keyboardType: TextInputType.number,
          cursorColor: AppColors.colorDarkBlue1,
          decoration: InputDecoration(
            hintText: "MM/YYYY",
            hintStyle: TextStyle(color: AppColors.colorDarkBlue1),
            contentPadding: const EdgeInsets.only(left: 15, bottom: 7),
            border: InputBorder.none,
          ),
          validator: (value) => fieldValidator.validateEmail(value!),
        ),
      ],
    );
  }
}

class CvvTextField extends StatelessWidget {
  CvvTextField({Key? key}) : super(key: key);
  final checkoutScreenController = Get.find<CheckoutScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 5,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
        ),
        TextFormField(
          controller: checkoutScreenController.cvvTextFieldController,
          keyboardType: TextInputType.number,
          cursorColor: AppColors.colorDarkBlue1,
          decoration: InputDecoration(
            hintText: "CVV",
            hintStyle: TextStyle(color: AppColors.colorDarkBlue1),
            contentPadding: const EdgeInsets.only(left: 15, bottom: 7),
            border: InputBorder.none,
          ),
          validator: (value) => fieldValidator.validateEmail(value!),
        ),
      ],
    );
  }
}

class SaveButtonModule extends StatelessWidget {
  SaveButtonModule({Key? key}) : super(key: key);
  final checkoutScreenController = Get.find<CheckoutScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (checkoutScreenController.formKey.currentState!.validate()) {}
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.colorDarkBlue1,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Center(
            child: Text(
              'Save',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class UpiTextField extends StatelessWidget {
  UpiTextField({Key? key}) : super(key: key);
  final checkoutScreenController = Get.find<CheckoutScreenController>();
  final FieldValidator fieldValidator = FieldValidator();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 38,
          margin: const EdgeInsets.only(left: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: AppColors.colorDarkBlue1.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 5,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
        ),
        TextFormField(
          controller: checkoutScreenController.cvvTextFieldController,
          keyboardType: TextInputType.number,
          cursorColor: AppColors.colorDarkBlue1,
          decoration: InputDecoration(
            hintText: "Enter UPI ID",
            hintStyle: TextStyle(color: AppColors.colorDarkBlue1),
            contentPadding: const EdgeInsets.only(left: 15, bottom: 7),
            border: InputBorder.none,
          ),
          validator: (value) => fieldValidator.validateEmail(value!),
        ),
      ],
    );
  }
}

class UPISaveButtonModule extends StatelessWidget {
  UPISaveButtonModule({Key? key}) : super(key: key);
  final checkoutScreenController = Get.find<CheckoutScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (checkoutScreenController.formKey.currentState!.validate()) {}
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.colorDarkBlue1,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Center(
            child: Text(
              'Save',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class DeliveryAddressModule extends StatelessWidget {
  DeliveryAddressModule({Key? key}) : super(key: key);

  final checkoutScreenController = Get.find<CheckoutScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Delivery Address",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.black),
            ),
            Image.asset(
              AppImages.plusDarkBlueImg,
              scale: 2,
            )
          ],
        ),
        const SizedBox(height: 15),
        address1Radio(),
        const SizedBox(height: 15),
        address2Radio()
      ],
    );
  }

  Widget address1Radio() {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: ListTile(
          trailing: Radio<String>(
            value: 'address1',
            activeColor: AppColors.colorDarkBlue1,
            groupValue: checkoutScreenController.deliveryAddress.value,
            onChanged: (value) {
              checkoutScreenController.deliveryAddress.value = value!;
            },
          ),
          title: const Text(
              '3254, Lorem Ipsum is simply dummy text of the printing'),
        ),
      ),
    );
  }

  Widget address2Radio() {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: ListTile(
          trailing: Radio<String>(
            value: 'address2',
            activeColor: AppColors.colorDarkBlue1,
            groupValue: checkoutScreenController.deliveryAddress.value,
            onChanged: (value) {
              //setState(() {
              checkoutScreenController.deliveryAddress.value = value!;
              // });
            },
          ),
          title: const Text(
              '3254, Lorem Ipsum is simply dummy text of the printing'),
        ),
      ),
    );
  }
}

class OrderSummaryModule extends StatelessWidget {
  const OrderSummaryModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Order Summary",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 18, color: Colors.black),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          margin: const EdgeInsets.only(left: 7, right: 7),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              //border: Border.all(color: AppColors.colorDarkBlue1),
              boxShadow: [
                BoxShadow(
                    color: AppColors.colorDarkBlue1.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 5,
                    blurStyle: BlurStyle.outer)
              ]),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sub Total",
                    style:
                        TextStyle(fontSize: 18, color: AppColors.colorDarkBlue),
                  ),
                  Text("\$70.00",
                      style: TextStyle(
                          fontSize: 18, color: AppColors.colorDarkBlue))
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tax",
                      style: TextStyle(
                          fontSize: 18, color: AppColors.colorDarkBlue)),
                  Text("\$10.00",
                      style: TextStyle(
                          fontSize: 18, color: AppColors.colorDarkBlue))
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery",
                      style: TextStyle(
                          fontSize: 18, color: AppColors.colorDarkBlue)),
                  Text("\$20.00",
                      style: TextStyle(
                          fontSize: 18, color: AppColors.colorDarkBlue))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Total",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                  Text("\$100.00",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Container(
        height: 42,
        //width: Get.width/2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.colorDarkBlue),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Text(
            "Place Order",
            // textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
