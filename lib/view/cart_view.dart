import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shop_app_mvvm_getx_besia/core/utils/extention.dart';
import 'package:shop_app_mvvm_getx_besia/view/widgets/custom_button.dart';
import 'package:shop_app_mvvm_getx_besia/view/widgets/custom_text.dart';

import '../core/utils/constance.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Slidable(
                  closeOnScroll: true,
                  startActionPane:
                      ActionPane(
                          extentRatio: 0.3,
                      motion: const DrawerMotion(),
                          children: [
                    SlidableAction(

                      onPressed: (context) {},
                      backgroundColor: "#FFC107".toColor(),
                      icon: Icons.star,
                      foregroundColor: Colors.white,
                    )
                  ]),
                  endActionPane: ActionPane(motion: const DrawerMotion(),
                      extentRatio: 0.3,
                      children: [
                        SlidableAction(

                          onPressed: (context) {},
                          backgroundColor: errorColor,
                          icon: Icons.delete,
                          foregroundColor: Colors.white,
                        )
                      ]),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    child: Row(
                      children: [
                        SizedBox(
                          height: double.infinity,
                          width: 140,
                          child: Image.asset(
                            'assets/images/forgetpass.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomText(
                                text: 'TOTAL',
                                color: Colors.black87,
                              ),
                              CustomText(
                                text: "ssss",
                                color: primaryColor,
                                fontSize: 20,
                              ),
                              Container(
                                decoration:
                                    BoxDecoration(color: Colors.grey.shade100),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: const Icon(Icons.add, size: 15),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      CustomText(
                                        text: '1',
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: const Padding(
                                          padding: EdgeInsets.only(bottom: 7),
                                          child: Icon(
                                            Icons.minimize,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
            )),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 17,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: 'TOTAL',
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      CustomText(
                        text: "\$4000",
                        color: primaryColor,
                        fontSize: 25,
                      ),
                    ],
                  ),
                  SizedBox(
                      width: 146,
                      height: 50,
                      child: CustomButton(
                        onPress: () {},
                        text: 'CHECKOUT',
                        borderRadius: 4,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
