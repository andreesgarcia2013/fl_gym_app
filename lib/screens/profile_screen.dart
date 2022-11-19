import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 238, 238, 238),
        body: ListView(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text("Profile",
                    style: TextStyle(fontFamily: 'Facon', fontSize: 25)),
              ),
            ),
            Container(
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage('assets/profile.jpeg'),
                      child: Stack(children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: MaterialButton(onPressed: (){},
                          child: Icon(Icons.edit, color: Colors.white,),
                          color: Colors.orange,
                          shape: CircleBorder(),
                          ),
                          
                        )
                      ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "John Doe",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text("0 Compras Realizadoas")
                  ],
                ),
              ),
            ),
            Container(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    MaterialButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.payment),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Payment methods",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        color: Colors.white,
                        elevation: 0,
                        minWidth: 300,
                        height: 50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))
                            
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
