import 'package:flutter/material.dart';

class DeleteAlertDialog extends StatelessWidget {
  const DeleteAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: AlertDialog(
        title: Text('هل تريد تأكيد الحذف',),
        actions: [
          TextButton(onPressed: (){}, child: Text('حذف')),
          TextButton(onPressed: (){}, child: Text('الغاء')),

        ],
      ),
    );
  }
}
