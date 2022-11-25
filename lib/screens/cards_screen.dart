import 'package:fl_gym_app/screens/add_card_screen.dart';
import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({Key? key}) : super(key: key);

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
      ),
      body: Center(
        child: Text('CardsScreen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddCardScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
