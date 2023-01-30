import 'package:get/get.dart';
import 'package:shop_app_mvvm_getx_besia/core/services/database/cart_database_helper.dart';
import 'package:shop_app_mvvm_getx_besia/model/cart_product_model.dart';

class CartViewModel extends GetxController{

  List<CartProductModel> _listCartProductModel =[];
  List<CartProductModel>  get listCartProductModel =>_listCartProductModel;

  CartViewModel(){
    getAllProduct();
  }


  Future<void> addProduct(CartProductModel cartProductModel)async{
    var dbHelper = CartDatabaseHelper.databaseHelper;
    await dbHelper.insertIntoDatabase(cartProductModel);


  }

   getAllProduct()async{
    var dbHelper = CartDatabaseHelper.databaseHelper;
    _listCartProductModel =  await dbHelper.getAllProduct();

    update();
  }


}