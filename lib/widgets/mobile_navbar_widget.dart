import 'package:flutter/material.dart';

class MobileNavbarWidget extends StatelessWidget {
  const MobileNavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home', style: TextStyle(fontFamily: 'WorkSans')),
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Shop', style: TextStyle(fontFamily: 'WorkSans')),
          ),
          ListTile(
            leading: const Icon(Icons.print),
            title: const Text('The Print Shack', style: TextStyle(fontFamily: 'WorkSans')),
          ),
          ListTile(
            leading: const Icon(Icons.local_offer),
            title: const Text('SALE!', style: TextStyle(fontFamily: 'WorkSans')),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About', style: TextStyle(fontFamily: 'WorkSans')),
          ),
          ListTile(
            leading: const Icon(Icons.web),
            title: const Text('UPSU.net', style: TextStyle(fontFamily: 'WorkSans')),
          ),
        ],
      ),
    );
  }
}
