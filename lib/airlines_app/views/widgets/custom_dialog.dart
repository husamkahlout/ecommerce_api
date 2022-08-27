import 'package:ecommerce_api/airlines_app/router/router.dart';
import 'package:flutter/material.dart';

class CustomDialog {
 static showDialogFunction(String content){
       showDialog(
            context: AppRouter.navKey.currentContext!,
            builder: (context) => AlertDialog(
                  content: Text(content),
                  actions: [
                    TextButton(
                        onPressed: () {
                          AppRouter.popRouter();
                        },
                        child: const Text("Ok"))
                  ],
                ));
  }
}