import 'package:badges/badges.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class SingleProductScreen extends StatelessWidget {
  final ProductModel producto;
  const SingleProductScreen({Key? key, required this.producto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 238, 238, 238),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 34, 40, 49), //change your color here
          ),
          elevation: 0,
          centerTitle: false,
          backgroundColor: Color.fromARGB(255, 238, 238, 238),
          actions: <Widget>[
            _shoppingCartBadge(),
          ],
        ),
        body: Column(
          children: [
            _carrusel(producto: producto),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(50.0),
                      topRight: const Radius.circular(50.0),
                    )),
                height: 300,
                width: 500.0,
                margin: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding:const EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                producto.name,
                                style: const TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Product Description',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                producto.description,
                                style: const TextStyle(
                                    letterSpacing: 2.0, fontSize: 15.0),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Center(
                                child: MaterialButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Add cart',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'SFUIDisplay',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  color: const Color.fromARGB(255, 214, 90, 49),
                                  elevation: 0,
                                  minWidth: 200,
                                  height: 60,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}

class _carrusel extends StatelessWidget {
  const _carrusel({
    Key? key,
    required this.producto,
  }) : super(key: key);

  final ProductModel producto;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 280,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: FadeInImage(
                  image: NetworkImage(producto.gallery[index]),
                  placeholder: AssetImage('assets/giphy.gif'),
                  height: 130,
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(milliseconds: 300),
                ),
              ),
            );
          },
          pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: new DotSwiperPaginationBuilder(
                color: Colors.grey,
                activeColor: Color.fromARGB(255, 214, 90, 49)),
          ),
          itemCount: producto.gallery.length,
          viewportFraction: 0.7,
          scale: 0.90,
        ));
  }
}

Widget _shoppingCartBadge() {
  return Badge(
    position: BadgePosition.topEnd(top: 0, end: 3),
    animationDuration: Duration(milliseconds: 300),
    animationType: BadgeAnimationType.slide,
    badgeContent: Text(
      '5',
      style: TextStyle(color: Colors.white),
    ),
    child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
  );
}
