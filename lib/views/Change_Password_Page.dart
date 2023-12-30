import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('تغيير كلمة المرور',style: TextStyle(
          color: Colors.black,fontWeight: FontWeight.w500
        ),),
        centerTitle: true,
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
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height/50,
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                      'أدخل كلمة المرور الجديدة',
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 20,
                      color: Colors.grey,
                    ),

                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height /10,
                ),
                TextFormField(
                 // controller: passController,

                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value){
                    print(value);
                  },
                  // strutStyle: StrutStyle(
                  //   height: MediaQuery.of(context).size.height / 600,
                  // ),
                  decoration: const InputDecoration(
                   //border: OutlineInputBorder(),
                    border: InputBorder.none,

                    hintText: 'كلمة المرور الحالية',
                    hintTextDirection: TextDirection.rtl,
                    prefixIcon: Icon(
                      Icons.remove_red_eye_sharp,
                      color: Colors.grey,

                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/70,
                ),
                TextFormField(
                  //controller: passController,
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
                   // border: OutlineInputBorder(),
                    border: InputBorder.none,
                    hintText: 'كلمة المرور الجديدة',
                    hintTextDirection: TextDirection.rtl,
                    prefixIcon: Icon(
                      Icons.remove_red_eye_sharp,
                      color: Colors.grey,

                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/40,
                ),
                 ElevatedButton(
                    style: ElevatedButton.styleFrom(

                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const ChangePasswordPage();
                      }));

                    },
                    child: const Center(
                      child: Text(
                        'تغيير',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

              ],
            ),
          ),
        ),
    );
  }
}
