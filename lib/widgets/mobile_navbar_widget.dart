import 'package:flutter/material.dart';

class MobileNavbarWidget extends StatelessWidget {
  const MobileNavbarWidget({super.key});

  void _navigateTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
    Navigator.pop(context); // Close the modal
  }

  void _showPlaceholder(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Coming soon!')),
    );
    Navigator.pop(context); // Close the modal
  }

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
            onTap: () => _navigateTo(context, '/'),
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Shop', style: TextStyle(fontFamily: 'WorkSans')),
            onTap: () => _navigateTo(context, '/shop'),
          ),
          ListTile(
            leading: const Icon(Icons.print),
            title: const Text('The Print Shack',
                style: TextStyle(fontFamily: 'WorkSans')),
            onTap: () => _showPlaceholder(context),
          ),
          ListTile(
            leading: const Icon(Icons.local_offer),
            title:
                const Text('SALE!', style: TextStyle(fontFamily: 'WorkSans')),
            onTap: () => _navigateTo(context, '/sale'),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title:
                const Text('About', style: TextStyle(fontFamily: 'WorkSans')),
            onTap: () => _navigateTo(context, '/about'),
          ),
          ListTile(
            leading: const Icon(Icons.web),
            title: const Text('UPSU.net',
                style: TextStyle(fontFamily: 'WorkSans')),
            onTap: () => _showPlaceholder(context),
          ),
        ],
      ),
    );
  }
}
