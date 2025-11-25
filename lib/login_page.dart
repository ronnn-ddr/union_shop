import 'package:flutter/material.dart';

import 'widgets/header_widget.dart';
import 'widgets/footer_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          HeaderWidget(),
          Expanded(
            child: Center(
              child: Text('Login Page Placeholder'),
            ),
          ),
          FooterWidget(),
        ],
      ),
    );
  }
}