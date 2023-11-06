import 'package:flutter/material.dart';
import 'package:invest_app/pages/tabs/accound_tab.dart';
import 'package:invest_app/pages/tabs/home_tab.dart';
import 'package:invest_app/pages/tabs/product_tab.dart';
import 'package:invest_app/pages/tabs/transaction_tab.dart';

class BottomNavigationBarWidget extends StatefulWidget {
 

  const BottomNavigationBarWidget({super.key, });

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int currentIndex = 0;
  List pages = [
    const HomeTab(),
    const ProductTab(),
    const TransactionTab(),
    const AccountTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: const Color.fromARGB(255, 49, 160, 98),
        unselectedItemColor: Colors.black,
        selectedIconTheme: const IconThemeData(
          size: 30,
        ),
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sync_alt_rounded),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
