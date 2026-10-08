
import 'package:flutter/material.dart';

class AtividadesPage extends StatelessWidget {
  const AtividadesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text('Atividades'),
        backgroundColor: const Color(0xFFF29C00),
        foregroundColor: Colors.white,
      ),

      body: const Center(
        child: Text('Tela de Atividades'),
      ),
    );
  }
}