import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nib/controllers/cart_controller.dart';
import '../../utils/app_colors.dart';

class CardItems extends StatelessWidget {


  CardItems({
    Key? key,
    this.onTap,
    this.image,
    this.price,
    this.name,
    this.iconTap,
    this.favIcon,
    this.icon,
    this.quantity,

  }) : super(key: key);

  final Function()? onTap;
  final Function()? iconTap;
  final Function()? favIcon;
  final String? image;
  final String? price;
  final String? name;
  final Icon? icon;
  final  String? quantity;

 // final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 100.h,
              width: 150.w,
              child: Align(
                alignment: Alignment.center,
                child: Image.network(
                  image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              name!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.sp,
                color: AppColors.font1Color,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 12.sp,
              itemPadding: const EdgeInsets.symmetric(horizontal: 0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: AppColors.but2Color,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'SAR',
                  style: TextStyle(color: AppColors.mainColor, fontSize: 20.sp),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  price!.toString(),
                  style: TextStyle(color: AppColors.mainColor, fontSize: 20.sp),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  'SAR 300',
                  style: TextStyle(
                    color: AppColors.sarColor,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
            Text(
              '5% VAT',
              style: TextStyle(color: AppColors.searchColor, fontSize: 9.sp),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: favIcon,
                  icon: icon!,
                  color: AppColors.but2Color,
                ),
                GestureDetector(
                  onTap: () {
               //    cartController.addProductToCart(cartModel);
                  },
                  child: Container(
                    height: 40.h,
                    width: 100.w,
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.shopping_cart_rounded,
                          color: Colors.white,
                        ),
                        Text(
                          'Add to Cart',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
