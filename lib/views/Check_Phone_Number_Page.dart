import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:salety_market/views/Change_Password_Page.dart';

class CheckPhoneNumberPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'EG');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('تحقق من رقم الهاتف',style: TextStyle(
        color: Colors.black,fontWeight: FontWeight.w500),),
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
          child: ListView(
            children: [

              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              const Text(
                'لقد أرسلنا لك رسالة نصية قصيرة تحتوى على رمز التأكيد ',
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 20,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 7,
              ),
              Form(
                key: formKey,
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: const TextStyle(color: Colors.black),
                  initialValue: number,
                  textFieldController: controller,
                  formatInput: true,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  //inputBorder: OutlineInputBorder(),
                  inputBorder: InputBorder.none,
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
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
                      'تأكيد',
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
