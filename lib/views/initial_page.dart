import 'package:flutter/material.dart';
import 'package:salety_market/views/Login_Page.dart';
import 'package:salety_market/views/register_page.dart';


class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height /3,
                  width: MediaQuery.of(context).size.width /3,
                  child:Image.asset('assets/vegetables.png',
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width /20,
                ),
                Column(
                  children: const [
                    Text(
                      'سلتي',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      'S E L A T Y',
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height /150,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(

                backgroundColor: Colors.red,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }));
                print('تسجيل الدخول');
              },
              child: const Center(
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RegisterPage();
                }));
                print('انشئ حساب ');
              },
              child: const Center(
                child: Text(
                  ' انشئ حساب',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }
}
