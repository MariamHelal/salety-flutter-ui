import 'package:flutter/material.dart';
import 'package:salety_market/views/Login_Page.dart';



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
                const SizedBox(
                  height: 30.0,
                ),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'انشاء حساب جديد',
                        style: TextStyle(fontSize: 40),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'أدخل بياناتك لإنشاء حساب',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w100,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
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
                const SizedBox(
                  height: 20,
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
                const SizedBox(
                  height: 20,
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
                const SizedBox(
                  height: 30,
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
                  child: const Center(
                    child: Text(
                      'اشتراك',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    'أو الاشتراك مع',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 45,
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
                          side: const BorderSide(
                            color: Color(0xFEE52C34),
                            width: .7,
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
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'Google',
                              style: TextStyle(
                                  color: Color(0xFEE52C34),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(flex: 1,),
                    Container(
                      height: 45,
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
                          side: const BorderSide(
                            color: Colors.indigo,
                            width: .7,
                          ),

                          // fixedSize: Size(10, 30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Icon(
                              Icons.facebook,
                              color: Colors.indigo,
                              size: 30,

                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Facebook',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
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
                      children: const [
                        Text('تسجيل الدخول',style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),),
                        Icon(Icons.play_arrow_rounded,
                          size: 25,
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
