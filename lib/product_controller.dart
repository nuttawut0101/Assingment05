import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxList<String>productName=<String>["Pizza","Berger","Spagetthi"].obs;
  RxList<String>price=<String>["299","59","199"].obs;
  final textProductName = TextEditingController();
  final textPrice = TextEditingController();

  void addProduct(){
   productName.add(textProductName.text);
   textProductName.clear();
  }
  void addPrice(){
    price.add(textPrice.text);
    textPrice.clear();
  }
  void removeProduct(int i){
    productName.removeAt(i);
    price.removeAt(i);
  }
}