import 'package:fl_gym_app/service/purchases_service.dart';
import 'package:flutter/material.dart';

import '../models/purchases_model.dart';

class ShoppingHistoryScreen extends StatelessWidget {
  String token;
   
  ShoppingHistoryScreen({Key? key,required this.token}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        title: Text('My shopping', style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(
            color: Color.fromARGB(255, 34, 40, 49), //change your color here
          ),
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 238, 238, 238),
      ),
      body: FutureBuilder(future: PurchasesService().getHistoryPurchases(token),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
        if (snapshot.hasError) {
          return Center(
            child: Text("Ocurrio un error"),
          );
        } else {
          if (snapshot.hasData) {
            return _purchasesList(snapshot.data);
          }else{
            return Center(
            child: Text("Ocurrio un error"),
          );
          }
        }
      },)
    );
  }
}

 Widget _purchasesList(List<PurchasesModel>? purchase) {
   return Container(
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.separated(
        itemBuilder: (context, i){
          PurchasesModel purchases=purchase![i];
          return _purchaseView(purchase[i]);
        },
        separatorBuilder: (_,__)=>const Divider(),
          itemCount: purchase!.length
        ),
    ),
  );
 }

 Column _purchaseView(PurchasesModel purchase) {
  String total=purchase.total.toString();
  String discount=purchase.discount.toString();
  String addres=purchase.address;
  List <Product> productsPurchased=purchase.products;
   return Column(
          children: [
            Row(
        children: [
          const Text('Fecha: ', style: TextStyle(color: Color.fromARGB(255, 214, 90, 49),fontWeight: FontWeight.bold),),
          Text(purchase.date, style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text('Total: \$ $total', style: TextStyle(fontWeight: FontWeight.bold),),
           Text('Discount: \$ $discount', style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
        ],
      ),
      Container(
        height: 40,
        child: Text('Address: $addres'),
      ),
      SizedBox(
        height: 200,
        child: ListView.separated(itemBuilder: (context, i){
          Product products=productsPurchased[i];
          return _listProductPurchase(productsPurchased[i]);
        },
         separatorBuilder: (_,__)=>const Divider(), itemCount: productsPurchased.length),
      )
          ],
        );
 }

 Widget _listProductPurchase(Product productsPurchased) {
  //  return Row(
  //     children: [
  //       Image(image: AssetImage('assets/no-image.png'), width: 120, height: 120,),
  //       Column(
  //         children: [
  //           Text(productsPurchased.idProduct.name,style: TextStyle(fontWeight: FontWeight.bold)),
  //           Text('Precio: \$9999',style: TextStyle(fontWeight: FontWeight.bold)),
  //           Text('Cantidad: 99',style: TextStyle(fontWeight: FontWeight.bold))
  //         ],
  //       )
  //     ],
  //   );
      String price=productsPurchased.idProduct.price.toString();
      String amount=productsPurchased.quantity.toString();
      return ListTile(
        leading: FadeInImage(
                image: NetworkImage(
                    productsPurchased.idProduct.gallery[0]),
                placeholder: AssetImage('assets/giphy.gif'),
                height: 230,
                fit: BoxFit.cover,
                fadeInDuration: Duration(milliseconds: 300),
              ),
        title: Text(productsPurchased.idProduct.name),
        subtitle: Text(
          'Price: \$ $price \nCantidad: $amount'
        ),
        isThreeLine: true,
      );
 }