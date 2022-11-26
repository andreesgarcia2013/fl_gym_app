import 'package:fl_gym_app/models/card_model.dart';
import 'package:fl_gym_app/screens/add_card_screen.dart';
import 'package:fl_gym_app/service/cards_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:math' as math;

class CardsScreen extends StatefulWidget {
  String token;
  CardsScreen({Key? key,required this.token}) : super(key: key);

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        title: const Text("Payment methods",
                style: TextStyle(fontFamily: 'Facon', fontSize: 25, color: Colors.black)),
        iconTheme: IconThemeData(
            color: Color.fromARGB(255, 34, 40, 49), //change your color here
          ),
          elevation: 0,
          centerTitle: false,
          backgroundColor: Color.fromARGB(255, 238, 238, 238),
      ),
      body: Container(
        child: FutureBuilder(future: CardsService().getAllCards(widget.token),
              builder:(BuildContext context, AsyncSnapshot<dynamic> snapshot){
                if (snapshot.hasError) {
              return const Center(
                child: Text('Ocurrio un error en la solicitud'),
              );
            } else{
              if (snapshot.connectionState==ConnectionState.done) {
                //Pasar datos a widget de tarjeta
                return _listCards(snapshot.data);
              }
              else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
              }
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddCardScreen(token: widget.token,))).then((value) => setState((){}));
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 214, 90, 49),
      ),
    );
  }

  Widget _listCards(List<CardModel>?card){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemBuilder: (context, i){
          CardModel cards= card![i];
          return Slidable(
              // Specify a key if the Slidable is dismissible.
              key: const ValueKey(0),

              // The start action pane is the one at the left or the top side.
              startActionPane: ActionPane(
                // A motion is a widget used to control how the pane animates.
                motion: const ScrollMotion(),

                // A pane can dismiss the Slidable.
                dismissible: DismissiblePane(onDismissed: () {}),

                // All actions are defined in the children parameter.
                children: const [
                  // A SlidableAction can have an icon and/or a label.
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),

              // The end action pane is the one at the right or the bottom side.
              endActionPane:  ActionPane(
                motion: ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {}),
                children: [
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),

              // The child of the Slidable is what the user sees when the
              // component is not dragged.
              child: _buildCreditCard(
              color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
              cardExpiration: "08/2022",
              cardHolder: card[i].name,
              cardNumber: card[i].number.toString())
            );
        },
         separatorBuilder: (_,__)=>const Divider(),
          itemCount: card!.length
        ),
    );
  }
}void doNothing(BuildContext context) {}

Card _buildCreditCard(
      {required Color color,
      required String cardNumber,
      required String cardHolder,
      required String cardExpiration}) {
    return Card(
      elevation: 10,
      color: color,
      /*1*/
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 200,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
        child: Column(
          /*2*/
          crossAxisAlignment: CrossAxisAlignment.start,
          /*3*/
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /* Here we are going to place the _buildLogosBlock */
            Image.asset(
          "assets/mastercard.png",
          height: 50,
          width: 50,
        ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              /* Here we are going to place the Card number */
              child: last4n(cardNumber)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                /* Here we are going to place the _buildDetailsBlock */
                Text(cardHolder, style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontFamily: 'CourrierPrime'))
              ],
            ),
          ],
        ),
      ),
    );
  }

   last4n(full){
    var newString = full.substring(full.length - 4);
    var hidden="**** **** **** $newString";
    return Text(hidden,style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontFamily: 'CourrierPrime') );
  }



