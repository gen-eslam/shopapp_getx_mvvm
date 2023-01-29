import 'package:flutter/material.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  child: Row(
                    children: [
                      SizedBox(
                        height: double.infinity,
                        width: 120,
                        child: Image.asset('assets/images/forgetpass.png'),
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
                              color: Colors.grey,
                            ),
                            CustomText(
                              text: "ssss",
                              color: primaryColor,
                              fontSize: 20,
                            ),
                            Container(
                              width: 95,
                              height: 30,
                              decoration:
                                  BoxDecoration(color: Colors.grey.shade200),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap:(){} ,
                                        child:const CustomText(
                                      text: '+',
                                          fontSize: 20,
                                    ),

                                    ),
                                    CustomText(
                                      text: '1',
                                    ),
                                    GestureDetector(
                                      onTap:(){} ,
                                      child:const CustomText(
                                        text: '-',
                                        fontSize: 20,
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
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
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
                      ),
                      CustomText(
                        text: "ssss",
                        color: primaryColor,
                        fontSize: 20,
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
