

import 'package:flutter/material.dart';

class NotificacoesPage extends StatelessWidget {
  const NotificacoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text('Notificação'),
        backgroundColor: const Color(0xFFF29C00),
        foregroundColor: Colors.white,
      ),

      body: const Center(
        child: Text('Tela de Notificações'),
      ),
    );
  }
}