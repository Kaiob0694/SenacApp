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
              title: Text(
                'Português',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Nota: 10,00'),
              trailing: Text(
                'Aprovado',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Card(
            child: ListTile(
              title: Text(
                'Matemática',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Nota: 9,00'),
              trailing: Text(
                'Aprovado',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Card(
            child: ListTile(
              title: Text(
                'Educação Física',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Nota: 10,00'),
              trailing: Text(
                'Aprovado',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Card(
            child: ListTile(
              title: Text(
                'História',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Nota: 9,50'),
              trailing: Text(
                'Aprovado',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SizedBox(height: 16),

          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Média Geral',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '9,63',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}