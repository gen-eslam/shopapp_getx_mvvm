import 'package:get/get.dart';
import 'package:shop_app_mvvm_getx_besia/core/view_model/auth_view_model.dart';

class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AuthViewModel>(() => AuthViewModel());
  }

}