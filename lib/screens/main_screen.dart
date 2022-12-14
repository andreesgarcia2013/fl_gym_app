import 'package:fl_gym_app/models/userInfo_model.dart';
import 'package:fl_gym_app/screens/cart_screen.dart';
import 'package:fl_gym_app/screens/products_screen.dart';
import 'package:fl_gym_app/screens/profile_screen.dart';
import 'package:fl_gym_app/service/products_service.dart';
import 'package:fl_gym_app/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/login_service.dart';

class MainScreen extends StatelessWidget {
  String token;
   MainScreen(  {Key? key, required this.token }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModels(),
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            backgroundColor: Color.fromARGB(255, 238, 238, 238),
            title: Image(
              image: AssetImage("assets/logo.png"),
              fit: BoxFit.cover,
              width: 50,
            ),
            
            actions: [
              //add
              IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.black,
                  onPressed: () {})
            ]),
        body: _Paginas(token:token),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModels>(context);

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Color.fromARGB(255, 214, 90, 49),
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => {navegacionModel.paginaActual = i},
    );
  }
}

class _Paginas extends StatelessWidget {
  String token;
   _Paginas(  {required this.token,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModels>(context);

    return PageView(
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        ProductsScreen(),
        CartScreen(),
        ProfileScreen(token: token,),
      ],
    );
  }
}

class _NavegacionModels with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;

    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 150), curve: Curves.easeInOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
