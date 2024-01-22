import 'package:assingment005/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    title: "Nuttawut_Assingment05",
    home: MainPage(),
  ));
}
class MainPage extends StatelessWidget {
  MainPage({super.key});
final ProductController myController=Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(FontAwesomeIcons.android),
        title: Text("MY Assingment05_Nuttawut"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.list),label: "Product"),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.cartShopping),label: "Cart"),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text("Product Name"),
                Container(
                  width: 120,
                  child: TextField(
                    controller: myController.textProductName,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text("Price",),
                Container(
                  width: 120,
                  child: TextField(
                    controller: myController.textPrice,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
            ElevatedButton(onPressed: (){
              myController.addProduct();
              myController.addPrice();
              print(myController.productName);
            },
              child: Text("Add"),
            ),
            Expanded(
              child:
                  Obx(() => ListView.builder(
                    itemCount: myController.productName.length,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        color: (index%2==0)?Colors.blueGrey:Colors.white12,
                        margin: EdgeInsets.all(15),
                        height: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Product Name ::${myController.productName[index]} ",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.yellowAccent
                            ),
                            ),
                            Text("Price :: ${myController.price[index]}",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.purpleAccent),
                            ),
                            FilledButton.icon(onPressed: (){
                              myController.removeProduct(index);
                            },
                                icon: Icon(FontAwesomeIcons.trash),
                                label: Text("Remove"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

