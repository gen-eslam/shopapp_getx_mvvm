import 'package:get/get.dart';
import 'package:shop_app_mvvm_getx_besia/core/services/home_service.dart';
import 'package:shop_app_mvvm_getx_besia/model/product_model.dart';

import '../../model/categories.dart';

class HomeViewModel extends GetxController {
  final List<CategoryModel> _categories = [];

  List<CategoryModel> get categories => _categories;
  final List<ProductModel> _product = [];

  List<ProductModel> get product => _product;

  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
  }

  Future<void> getCategory() async {
    await HomeService().getCategory().then((value) {
      for (var element in value) {
        _categories.add(
            CategoryModel.fromJson(element.data() as Map<dynamic, dynamic>));
      }
    });

    update();
  }

  getBestSellingProducts() async {
    await HomeService().getProducts().then((value) {
      for (var element in value) {
        _product
            .add(ProductModel.fromJson(element.data() as Map<String, dynamic>));
      }
    });

    update();
  }
}
