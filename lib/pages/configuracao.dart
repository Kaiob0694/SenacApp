
import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatelessWidget {
  const ConfiguracoesPage({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text('Configurações'),
        backgroundColor: const Color(0xFFF29C00),
        foregroundColor: Colors.white,
      ),

      body: const Center(
        child: Text('Tela de Configurações'),
      ),
    );
  }
}