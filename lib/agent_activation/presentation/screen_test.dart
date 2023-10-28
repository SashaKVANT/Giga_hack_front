import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void onBackPressed() {
      Navigator.pushNamed(context, '/A');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Главная'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(child: Text('Это главная страница')),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void onBackPressed() {
      Navigator.pushNamed(context, '/A');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(child: Text('Это страница профиля')),
    );
  }
}
