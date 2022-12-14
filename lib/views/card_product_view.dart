import 'package:fl_gym_app/screens/single_product_screen.dart';
import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CardProductView extends StatelessWidget {
  final List<ProductModel> products;
  const CardProductView(this.products);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return _Producto(producto: this.products[index], index: index);
      }, 
    );
  }
}

class _Producto extends StatelessWidget {
  final ProductModel producto;
  final int index;
  const _Producto({required this.producto, required this.index});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SingleProductScreen(producto: producto,))),
      child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          margin: EdgeInsets.all(25),
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          child: Column(
            children: [
              FadeInImage(
                image: NetworkImage(
                    'https://www.asimetrica.org/wp-content/uploads/2019/03/no-imagen.jpg'),
                placeholder: AssetImage('assets/giphy.gif'),
                height: 230,
                fit: BoxFit.cover,
                fadeInDuration: Duration(milliseconds: 300),
              ),
              Container(
                  alignment: AlignmentDirectional.centerStart,
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    children: [Text(producto.brand.name)],
                  )),
              Container(
                  alignment: AlignmentDirectional.centerStart,
                  padding: const EdgeInsets.only(
                      right: 20, top: 10, bottom: 10, left: 20),
                  child: Text(
                    producto.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )),
              Container(
                  alignment: AlignmentDirectional.centerStart,
                  padding: const EdgeInsets.only(right: 20, bottom: 10, left: 20),
                  child: Row(
                    children: [
                      const Text(
                        '\$',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Text(producto.price.toString(),
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 25))
                    ],
                  )),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: MaterialButton(
                  onPressed: () {},
                  child:const Text(
                    'Add cart',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'SFUIDisplay',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  color:const Color.fromARGB(255, 214, 90, 49),
                  elevation: 0,
                  minWidth: 200,
                  height: 60,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              )
            ],
          ),
      ),
    );
  }
}
