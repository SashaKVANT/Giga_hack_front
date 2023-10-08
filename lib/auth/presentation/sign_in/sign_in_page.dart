import 'package:flutter/material.dart';

import 'widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: const Text("Рады видеть вас снова!"),
      //),
      body: Row(
        children: [
          // 2/3 экрана для SignInForm
          Expanded(
            flex: 2,
            child: SignInForm(),
          ),
          // 1/3 экрана оставляем пустым или для другого контента
          Expanded(
            flex: 1,
            child: Container(
              // Вы можете добавить здесь дополнительный контент или просто использовать Container
            ),
          ),
        ],
      ),
    );
  }
}
