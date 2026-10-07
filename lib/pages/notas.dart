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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              title: Text('Português'),
              subtitle: Text('10,00'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Nota 2'),
              subtitle: Text('Conteúdo da segunda nota'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Nota 3'),
              subtitle: Text('Conteúdo da terceira nota'),
            ),
          ),
        ],
      ),
    );
  }
}