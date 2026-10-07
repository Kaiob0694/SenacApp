import 'package:flutter/material.dart';

class NotasPage extends StatelessWidget {
  const NotasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Notas'),
        backgroundColor: const Color(0xFFF29C00),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Aqui vão as suas notas'),
      ),
    );
  }
}