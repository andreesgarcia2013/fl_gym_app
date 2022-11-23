import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      body: ListView(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text("Cart",
                  style: TextStyle(fontFamily: 'Facon', fontSize: 25)),
            ),
          ),
          Container(
            height: 350,
            child: Center(
              child: Text("You still have no items in your cart"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Subtotal",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.5)),
                      ),
                      Text(
                        "\$ 0.00",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Discount",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.5)),
                      ),
                      Text(
                        "\$ 0.00",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(0.5)),
                      ),
                      Text(
                        "\$ 0.00",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          color: const Color.fromARGB(255, 34, 40, 49),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
          child: InkWell(
            onTap: () {
              //print('called on tap');
            },
            child: const SizedBox(
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Checkout',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'SFUIDisplay',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
