import 'package:flutter/material.dart';

class FrequenciaPage extends StatelessWidget {
  const FrequenciaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text('Frequência'),
        backgroundColor: const Color(0xFFF29C00),
        foregroundColor: Colors.white,
      ),
    );
  }
}