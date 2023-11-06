import 'package:flutter/material.dart';

class TransactionTab extends StatefulWidget {
  const TransactionTab({super.key});

  @override
  State<TransactionTab> createState() => _TransactionTabState();
}

class _TransactionTabState extends State<TransactionTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text(
        '33',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
