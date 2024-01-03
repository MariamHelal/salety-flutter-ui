import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salety_market/views/register_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Check_Phone_Number_Page.dart';
import 'Home_Page.dart';

class LoginPage extends StatelessWidget {
  var emailController=TextEditingController();
  var passController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus=FocusScope.of(context);
        if(!currentFocus.hasPrimaryFocus){
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading:  Center(
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(
                  color: Colors.black38,
                  width: .5,
                ),
                // fixedSize: Size(10, 30),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),

        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width / 3,
                        child: Image.asset(
                          'assets/vegetables.png',
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 20,
                      ),
                      Column(
                        children:  [
                          Text(
                            'سلتي',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.sp,
                              color: Colors.red,
                            ),
                          ),
                          Text(
                            'S E L A T Y',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 400,
                  ),
                  TextFormField(

                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    strutStyle: StrutStyle(
                      height: MediaQuery.of(context).size.height / 600,
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'عنوان البريد الإلكتروني ',
                      hintTextDirection: TextDirection.rtl,
                      prefixIcon: Icon(
                        Icons.check_circle_outline_rounded,
                        color: Colors.green,
                      ),
                    ),
                  ),
                   SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    controller: passController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    strutStyle: StrutStyle(
                      height: MediaQuery.of(context).size.height / 600,
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'كلمة المرور',
                      hintTextDirection: TextDirection.rtl,
                      prefixIcon: Icon(
                        Icons.remove_red_eye_sharp,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return CheckPhoneNumberPage();
                          }));
                        },
                        child: const Text(
                          'هل نسيت كلمة السر',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black38,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(

                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return  HomePage();
                      }));
                      print(emailController.text);
                      print(passController.text);
                    },
                    child:  Center(
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),


                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RegisterPage();
                          }));
                        },
                        child: Row(
                          children:  [
                            Text(
                              'انشاء حساب',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.play_arrow_rounded,
                              size: 25.sp,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      const Text(
                        'لديك حساب بالفعل؟ ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
