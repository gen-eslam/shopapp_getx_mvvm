import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shop_app_mvvm_getx_besia/core/utils/constance.dart';
import 'package:shop_app_mvvm_getx_besia/core/view_model/home_view_model.dart';
import 'package:shop_app_mvvm_getx_besia/view/widgets/custom_text.dart';
import 'package:shop_app_mvvm_getx_besia/view/widgets/custom_text_button.dart';

import 'details_view.dart';

class HomeView extends GetWidget<HomeViewModel> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Column(
          children: [
            _searchTextFormField(),
            const SizedBox(
              height: 30,
            ),
            const CustomText(
              text: 'Categories',
            ),
            const SizedBox(
              height: 30,
            ),
            _listViewCategory(),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: "Best Selling",
                ),
                CustomTextButton(
                  onPressed: () {},
                  text: 'See all',
                  fontSize: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            _listViewProducts(),
          ],
        ),
      ),
    );
  }

  _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: TextFormField(
        cursorColor: primaryColor,
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: primaryColor,
          ),
        ),
      ),
    );
  }

  _listViewCategory() {
    return GetBuilder<HomeViewModel>(builder: (controller) {
      return SizedBox(
        height: 60,
        child: controller.categories.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              )
            : ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 87,
                    child: Wrap(
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Image.network(
                          controller.categories[index].image,
                        ),
                        CustomText(
                          text: controller.categories[index].name,
                          alignment: Alignment.topCenter,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 20,
                ),
              ),
      );
    });
  }

  _listViewProducts() {
    return GetBuilder<HomeViewModel>(builder: (controller) {
      return SizedBox(
        height: 350,
        child: controller.product.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              )
            : ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.product.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Get.to(DetailsView(model:controller.product[index]));
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                            ),
                            child: SizedBox(
                              height: 220,
                              child: Image.network(
                                controller.product[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text: controller.product[index].name,
                            alignment: Alignment.bottomLeft,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            text: controller.product[index].description,
                            color: Colors.grey,
                            fontSize: 12,
                            alignment: Alignment.bottomLeft,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomText(
                            text: "\$${controller.product[index].price}",
                            color: primaryColor,
                            alignment: Alignment.bottomLeft,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: 20,
                ),
              ),
      );
    });
  }
}
