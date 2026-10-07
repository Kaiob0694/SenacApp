import 'package:flutter/material.dart';

class FrequenciaPage extends StatelessWidget {
  const FrequenciaPage({super.key});

  @override
  Widget build(BuildContext context) {
    // dia do mês: true = presente, false = falta
    const dias = {1: true, 2: true, 5: false, 6: true, 7: true};

    final presencas = dias.values.where((p) => p).length;
    final percentual = (presencas / dias.length * 100).round();

    // Outubro de 2026 (começa na quinta-feira)
    final primeiroDia = DateTime(2026, 10, 1);
    final totalDias = DateTime(2026, 11, 0).day;
    final espacosVazios = primeiroDia.weekday % 7; // domingo = 0

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Frequência'),
        backgroundColor: const Color(0xFFF29C00),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Porcentagem
            Text(
              '$percentual%',
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF29C00),
              ),
            ),
            const Text('de frequência'),

            const SizedBox(height: 24),

            // Calendário
            const Text(
              'Outubro de 2026',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('D'),
                Text('S'),
                Text('T'),
                Text('Q'),
                Text('Q'),
                Text('S'),
                Text('S'),
              ],
            ),
            const SizedBox(height: 8),
            GridView.count(
              crossAxisCount: 7,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
              children: [
                for (var i = 0; i < espacosVazios; i++) const SizedBox(),
                for (var dia = 1; dia <= totalDias; dia++)
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: dias[dia] == null
                          ? Colors.grey.shade100
                          : dias[dia]!
                          ? Colors.green
                          : Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$dia',
                      style: TextStyle(
                        color: dias[dia] == null
                            ? Colors.black87
                            : Colors.white,
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, size: 12, color: Colors.green),
                SizedBox(width: 4),
                Text('Presença'),
                SizedBox(width: 16),
                Icon(Icons.circle, size: 12, color: Colors.red),
                SizedBox(width: 4),
                Text('Falta'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
