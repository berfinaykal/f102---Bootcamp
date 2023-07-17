import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:GetSetGo_Holiday/app/core/utils/extensions.dart';
import 'package:GetSetGo_Holiday/app/core/values/colors.dart';
import 'package:GetSetGo_Holiday/app/data/models/task.dart';
import 'package:GetSetGo_Holiday/app/modules/home/controller.dart';
import 'package:GetSetGo_Holiday/app/modules/home/widgets/add_card.dart';
import 'package:GetSetGo_Holiday/app/modules/home/widgets/add_dialog.dart';
import 'package:GetSetGo_Holiday/app/modules/home/widgets/task_card.dart';
import 'package:GetSetGo_Holiday/app/modules/report/view.dart';

import 'app/modules/home/view.dart';

class LoginPa extends StatelessWidget{
  const LoginPa({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => getstarted(),
        '/hom': (context) => HomePage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}

class getstarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.asset(
            'assets/img/giris-ekranı.jpg',
            height: 370.0,
          ),
          SizedBox(height: 20.0),
          Text(
            'GetSetGo-Holiday',
            style: TextStyle(
              fontSize: 30.0,
              color: Color(0xFF833BAA),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 100.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: ElevatedButton(
              child: Text(
                'Get Started',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF9D62BC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'assets/img/login-image.jpg',
              height: 170.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'GetSetGo-Holiday',
              style: TextStyle(
                color: Color(0xFF833BAA),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Text(
              'Plan Your Trip',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'E-mail',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Text(
                    'Forgot your password?',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {
                    // Şifremi unuttum işlemini burada yönetebilirsiniz
                  },
                ),
                GestureDetector(
                  child: Text(
                    'have an account?',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: () {
                    // Şifremi unuttum işlemini burada yönetebilirsiniz
                  },
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              child: Text('Sign In'),
              onPressed: () {
                // Giriş butonuna basılma işlemini burada yönetebilirsiniz
              },

              style: ElevatedButton.styleFrom(
                primary: Color(0xFF9D62BC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            //şimdilik atla bölümü
            SizedBox(height: 20.0),
            GestureDetector(
              child: RichText(
                textAlign: TextAlign.center, // Metni ortalamak için textAlign özelliğini kullanın
                text: TextSpan(
                  text: 'Skip for now',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/hom');
              },
            ),
          ],
        ),
      ),
    );
  }
}