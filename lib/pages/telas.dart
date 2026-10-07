import 'package:flutter/material.dart';

// Modelo base: todas as telas usam o mesmo layout simples.
// Depois você substitui o corpo de cada uma pelo conteúdo real.
class _TelaBase extends StatelessWidget {
  final String titulo;

  const _TelaBase({required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(titulo),
        backgroundColor: const Color(0xFFF29C00),
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text('Tela de $titulo')),
    );
  }
}



class ComunicadosPage extends StatelessWidget {
  const ComunicadosPage({super.key});

  @override
  Widget build(BuildContext context) => const _TelaBase(titulo: 'Comunicados');
}

class AtividadesPage extends StatelessWidget {
  const AtividadesPage({super.key});

  @override
  Widget build(BuildContext context) => const _TelaBase(titulo: 'Atividades');
}

class NotificacoesPage extends StatelessWidget {
  const NotificacoesPage({super.key});

  @override
  Widget build(BuildContext context) => const _TelaBase(titulo: 'Notificações');
}

class ConfiguracoesPage extends StatelessWidget {
  const ConfiguracoesPage({super.key});

  @override
  Widget build(BuildContext context) =>
      const _TelaBase(titulo: 'Configurações');
}