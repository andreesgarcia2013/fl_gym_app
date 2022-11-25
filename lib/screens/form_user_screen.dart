import 'package:fl_gym_app/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import '../models/userInfo_model.dart';

class FormUserScreen extends StatelessWidget {
  final UserInfoModel dataUser;
  String token;
  FormUserScreen({Key? key, required this.dataUser, required this.token})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController.fromValue(TextEditingValue(text: dataUser.name!));
    TextEditingController emailController = TextEditingController.fromValue(
        TextEditingValue(text: dataUser.email!));
    final passwordController = TextEditingController();
    final UserService _userService = UserService();

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 238, 238, 238),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 238, 238, 238),
          iconTheme: IconThemeData(
            color: Color.fromARGB(255, 34, 40, 49), //change your color here
          ),
          elevation: 0,
        ),
        body: ListView(
          children: [
            Container(
              child: Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/profile.jpeg'),
                  child: Stack(children: []),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'New name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'New email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'New password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 12),
              child: Text(
                "If you do not want to change your password, leave it blank.",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: MaterialButton(
                onPressed: () async {
                  bool status = await _userService.patchData(
                      nameController.text,
                      emailController.text,
                      passwordController.text,
                      token);
                  if (status) {
                    _alertWidget(context);
                  } else {
                    print("No se pudo modificar");
                  }
                },
                child: const Text(
                  'Save',
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
        ));
  }

  void _alertWidget(context) {
    MotionToast.success(
      title: const Text(
        'Success',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      description: const Text(
        'Your information was updated successfully',
        style: TextStyle(fontSize: 12),
      ),
      layoutOrientation: ToastOrientation.rtl,
      animationType: AnimationType.fromRight,
      dismissable: true,
    ).show(context);
  }
}


