import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:nib/models/product_details_model.dart';

import '../services/product_details_service.dart';

class ProductDetailsController extends GetxController{
  final _services = ProductDetailsServices();
  Future<ProductDetailsModel>? future;

  @override
  Future<void> onInit()async{
    super.onInit();
    future=_services.fetchdetails();
  }
}