import 'package:flutter/material.dart';
import 'package:shop_app_mvvm_getx_besia/core/utils/constance.dart';
import 'package:shop_app_mvvm_getx_besia/view/widgets/custom_text.dart';

class HomeView extends StatelessWidget {
   HomeView({Key? key}) : super(key: key);
  final List<String> names = [''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Column(
          children: [
            Container(
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
            ),
            SizedBox(height: 50,),
            CustomText(
              text: 'Categories',
            ),
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
