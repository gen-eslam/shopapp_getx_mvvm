import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shop_app_mvvm_getx_besia/core/utils/constance.dart';
import 'package:shop_app_mvvm_getx_besia/model/product_model.dart';
import 'package:shop_app_mvvm_getx_besia/view/control_view.dart';
import 'package:shop_app_mvvm_getx_besia/view/widgets/custom_button.dart';
import 'package:shop_app_mvvm_getx_besia/view/widgets/custom_text.dart';

class DetailsView extends StatelessWidget {
  ProductModel model;

  DetailsView({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(mainAxisSize: MainAxisSize.max, children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Image.network(
                  model.image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.off(ControlView());
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.star_border,color: Colors.black,),
                        ))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    CustomText(
                      text: model.name,
                      fontSize: 26,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.grey.shade100,
                              border:
                                  Border.all(color: Colors.grey, width: 0.2),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomText(
                                  text: 'Sized',
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                CustomText(
                                  text: model.sized,
                                ),
                              ],
                            )),
                        Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.grey.shade100,
                              border:
                                  Border.all(color: Colors.grey, width: 0.2),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomText(
                                  text: 'Color',
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    color: model.color,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const CustomText(
                      text: 'Details',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      text: model.description,
                      color: Colors.black,
                      fontSize: 18,
                      maxLine: 100,
                      fontWeight: FontWeight.w400,
                      height: 2.5,
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                      text: 'PRICE',
                      color: Colors.grey,
                    ),
                    CustomText(
                      text: "\$${model.price}",
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
                      text: 'ADD',
                      borderRadius: 4,
                    ))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
