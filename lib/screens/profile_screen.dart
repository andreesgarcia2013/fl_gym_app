import 'package:fl_gym_app/models/userInfo_model.dart';
import 'package:fl_gym_app/screens/cards_screen.dart';
import 'package:fl_gym_app/screens/form_user_screen.dart';
import 'package:fl_gym_app/screens/login_screen.dart';
import 'package:fl_gym_app/screens/shopping_history_screen.dart';
import 'package:fl_gym_app/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  String token;
   ProfileScreen(  {Key? key, required this.token }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Future refresh() async{
    setState(() {
      
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 238, 238, 238),
        body: RefreshIndicator(
          onRefresh: refresh,
          child: FutureBuilder(future: UserService().getUserInfo(widget.token),
           builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
            if (snapshot.hasData) {
              return InfoUser(snapshot.data!,widget.token);
            }
            else{
              return CircularProgressIndicator();
            }
            },),
        ));
  }
}

class InfoUser extends StatelessWidget {
  final UserInfoModel userService;
  String token;
  InfoUser(this.userService,this.token) ;
  

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                      child: MaterialButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FormUserScreen(dataUser: userService, token: token,)));
                      },
                      child: Icon(Icons.edit, color: Colors.white,),
                      color: const Color.fromARGB(255, 214, 90, 49),
                      shape: CircleBorder(),
                      ),
                      
                    )
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  userService.name!,
                  style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(userService.email!),
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
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CardsScreen(token:token)));
                    },
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
                        borderRadius: BorderRadius.circular(8))),
                    SizedBox(
                  height: 8,
                ),
                MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => ShoppingHistoryScreen( token: token)));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.shopping_bag_outlined),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Shopping history",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    color: Colors.white,
                    elevation: 0,
                    minWidth: 300,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                        SizedBox(
                  height: 8,
                ),
                MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => LoginScreen( )));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back_rounded, color: Colors.black,),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Log Out",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    color: Colors.white,
                    elevation: 0,
                    minWidth: 300,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                        
                        
              ],
            ),
          ),
        )
      ],
    );
  }
}
