
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nib/controllers/cart_controller.dart';
import 'package:nib/models/cart_model.dart';
import '../models/categories_model.dart';
import '../models/products_model.dart';
import '../models/search_model.dart';
import '../services/products_services.dart';
import '../utils/app_colors.dart';

class ProductsController extends GetxController{
  final _services = ProductsServices();
  Future<ProductsModel>? futureData;
  Future<SearchModel>? search;
  Future<CategoriesModel>? category;

  final text=''.obs;


  @override
  Future<void> onInit()async{
    super.onInit();
    futureData=_services.getProducts();
    category=_services.getCategory();


  }

  late CartController _cart;
  int _quantity = 0;

  int get quantity => _quantity;
  int _inCartItems = 0;

  int get inCartItems => _inCartItems + _quantity;

  void setQuantity(bool isIncrement){
    if(isIncrement){
      // print("increment"+_quantity.toString());
      _quantity = checkQuantity(_quantity+1);
     // print('nomber of items'+_quantity.toString());
    }else{
      _quantity=checkQuantity(_quantity-1);
      // print('decrement'+_quantity.toString());
    }
    update();
  }

  int checkQuantity(int quantity) {
    if(_inCartItems+quantity<0){
      Get.snackbar("Item count", "You can't reduce more",
      backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
      );
      return 20;
    }else{
      return quantity;
    }
  }

 /* void iniitProduct(CartController cartController,ProductsModel product){
    _quantity=0;
    _inCartItems=0;
    _cart=cartController;
    var exist = false;
    exist=_cart.existInCart();
    // if exist
    //get from storage _inCartItems=3
    //print('exist or not ' + exist.toString());
    if(exist){
      _inCartItems=_cart.getQuantity(product);
    }
    // print("the quantity in the cart is " + _inCartItems.toString());
  }

  void addItem(ProductsModel product){
    _cart.addItem(_cart, _quantity);
  }*/
}