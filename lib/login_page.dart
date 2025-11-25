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
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: 'Login'),
                      Tab(text: 'Sign Up'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Center(child: Text('Login Form')),
                        Center(child: Text('Sign Up Form')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          FooterWidget(),
        ],
      ),
    );
  }
}
