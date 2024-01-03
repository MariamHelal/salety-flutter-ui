import 'package:flutter/material.dart';
import 'package:salety_market/views/Login_Page.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


class RegisterPage extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                //  SizedBox(
                //   height: 30.h,
                // ),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:  [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'انشاء حساب جديد',

                        style: TextStyle(fontSize: 27.sp,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'أدخل بياناتك لإنشاء حساب',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w100,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                 SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  strutStyle: StrutStyle(
                    height: MediaQuery.of(context).size.height / 600,
                  ),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'الاسم',
                    hintTextDirection: TextDirection.rtl,
                  ),
                ),
                 SizedBox(
                  height: 20.h,
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
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value){
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
                 SizedBox(
                  height: 30.h,
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                    print(emailController.text);
                    print(passController.text);
                  },
                  child:  Center(
                    child: Text(
                      'اشتراك',
                      style: TextStyle(
                        fontSize: 25.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                 SizedBox(
                  height: 20.h,
                ),
                 Center(
                  child: Text(
                    'أو الاشتراك مع',
                    style: TextStyle(
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 45.h,
                      width: MediaQuery.of(context).size.width/2.4 ,
                      child: ElevatedButton(

                        onPressed: () {
                          print('register by Google');
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return HomePage();
                          // }));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side:  BorderSide(
                            color: Color(0xFEE52C34),
                            width: 0.7.h,
                          ),
                          // fixedSize: Size(10, 30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.asset('assets/google+.png',
                            ),
                             SizedBox(
                              width: 8.w,
                            ),
                             Text(
                              'Google',
                              style: TextStyle(
                                  color: Color(0xFEE52C34),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(flex: 1,),
                    Container(
                      height: 45.h,
                      width: MediaQuery.of(context).size.width/2.4 ,
                      child: OutlinedButton(

                        onPressed: () {
                          print('register by facebook');
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return HomePage();
                          // }));
                        },
                        style: ElevatedButton.styleFrom(

                          backgroundColor: Colors.white,
                          side:  BorderSide(
                            color: Colors.indigo,
                            width: 0.7.h,
                          ),

                          // fixedSize: Size(10, 30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children:  [
                            Icon(
                              Icons.facebook,
                              color: Colors.indigo,
                              size: 30.sp,

                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Facebook',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


                  ],
                ),SizedBox(
                  height: MediaQuery.of(context).size.height/7,
                ),
                Row(
                  children: [
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return LoginPage();
                      }));
                    }, child: Row(
                      children:  [
                        const Text('تسجيل الدخول',style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),),
                        Icon(Icons.play_arrow_rounded,
                          size: 25.sp,
                          color: Colors.black,),
                      ],
                    ),
                    ),
                    const Spacer(flex: 1,),
                    const Text(
                      'لديك حساب بالفعل؟ '
                      ,style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),)

                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
