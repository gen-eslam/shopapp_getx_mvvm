import 'package:flutter/material.dart';
import 'package:shop_app_mvvm_getx_besia/model/product_model.dart';
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
        body: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Image.network(
                  model.image,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 15,
            ),
            Padding(
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
                            border:Border.all(color: Colors.grey,width: 0.2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             const CustomText(
                                text: 'Sized',
                              ),
                              SizedBox(width: 70,),
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
                            border:Border.all(color: Colors.grey,width: 0.2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CustomText(
                                text: 'Color',
                              ),
                              SizedBox(width: 70,),
                             Container(
                               width: 22,
                               height: 22,
                               decoration:BoxDecoration(
                                 color: model.color,
                                  borderRadius: BorderRadius.circular(8),

                               ) ,
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
                   Text(
                     model.description,
                   style:const TextStyle(
                     color: Colors.black,
                     fontSize: 18,
                     fontWeight: FontWeight.w400,
                     height: 1.8,

                   ),
                  ),


                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
