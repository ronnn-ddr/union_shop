import 'package:flutter/material.dart';

class SalePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sale', style: TextStyle(fontFamily: 'WorkSans')),
        backgroundColor: Color(0xFF4d2963),
      ),
      body: Container(
        color: Colors.white,
        // TODO: Add GridView.builder
      ),
    );
  }
}
