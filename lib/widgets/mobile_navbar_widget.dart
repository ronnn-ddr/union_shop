import 'package:flutter/material.dart';

class MobileNavbarWidget extends StatelessWidget {
  const MobileNavbarWidget({super.key});

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
          Material(
            color: Colors.white,
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, '/'),
              child: const ListTile(
                leading: Icon(Icons.home),
                title: Text('Home', style: TextStyle(fontFamily: 'WorkSans')),
              ),
            ),
          ),
          Material(
            color: Colors.white,
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, '/shop'),
              child: const ListTile(
                leading: Icon(Icons.shop),
                title: Text('Shop', style: TextStyle(fontFamily: 'WorkSans')),
              ),
            ),
          ),
          Material(
            color: Colors.white,
            child: InkWell(
              onTap: () => _showPlaceholder(context),
              child: const ListTile(
                leading: Icon(Icons.print),
                title: Text('The Print Shack',
                    style: TextStyle(fontFamily: 'WorkSans')),
              ),
            ),
          ),
          Material(
            color: Colors.white,
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, '/sale'),
              child: const ListTile(
                leading: Icon(Icons.local_offer),
                title: Text('SALE!', style: TextStyle(fontFamily: 'WorkSans')),
              ),
            ),
          ),
          Material(
            color: Colors.white,
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, '/about'),
              child: const ListTile(
                leading: Icon(Icons.info),
                title: Text('About', style: TextStyle(fontFamily: 'WorkSans')),
              ),
            ),
          ),
          Material(
            color: Colors.white,
            child: InkWell(
              onTap: () => _showPlaceholder(context),
              child: const ListTile(
                leading: Icon(Icons.web),
                title:
                    Text('UPSU.net', style: TextStyle(fontFamily: 'WorkSans')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
