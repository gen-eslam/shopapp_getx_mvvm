import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../core/view_model/control_view_model.dart';

class ControlView extends GetWidget<ControlViewModel> {
  const ControlView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

      return GetBuilder<ControlViewModel>(
        init: ControlViewModel(),
        builder: (controller) {

      return Scaffold(
        body: controller.currentScreen,
        bottomNavigationBar: bottomNavigationBar(),
      );
    });

  }

  bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(

        builder: (controller) {
          return BottomNavigationBar(
              elevation: 0,
              currentIndex: controller.navigatorValue,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.grey.shade50,
              onTap: (index) {
                controller.changeSelectedValue(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/explore.png',
                    fit: BoxFit.contain,
                  ),
                  label: 'explore',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/cart.png',
                      fit: BoxFit.contain),
                  label: 'cart',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/user.png',
                      fit: BoxFit.contain),
                  label: 'user',
                ),
              ]);
        });
  }
}
