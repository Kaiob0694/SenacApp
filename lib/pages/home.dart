import 'package:flutter/material.dart';


class SegundaTela extends StatefulWidget {
  const SegundaTela({super.key});

  @override
  State<SegundaTela> createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {

  int indiceSelecionado = 0;

  // Lista de páginas
  final paginas = [
    const TelaInicio(),
    const TelaBuscar(),
    const TelaFavoritos(),
    const TelaPerfil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Mostra a página selecionada
      body: paginas[indiceSelecionado],

      bottomNavigationBar: NavigationBar(
        selectedIndex: indiceSelecionado,

        onDestinationSelected: (int index) {
          setState(() {
            indiceSelecionado = index;
          });
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Início',
          ),

          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),

          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),

          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}


// ============================
// TELA INÍCIO
// ============================

class TelaInicio extends StatelessWidget {
  const TelaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Tela Inicial',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}


// ============================
// TELA BUSCAR
// ============================

class TelaBuscar extends StatelessWidget {
  const TelaBuscar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Tela de Busca',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}


// ============================
// TELA FAVORITOS
// ============================

class TelaFavoritos extends StatelessWidget {
  const TelaFavoritos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Tela de Favoritos',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}


// ============================
// TELA PERFIL
// ============================

class TelaPerfil extends StatelessWidget {
  const TelaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Meu Perfil',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Usuário do aplicativo',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () {
                // ação do botão
              },
              icon: const Icon(Icons.edit),
              label: const Text('Editar perfil'),
            ),
          ],
        ),
      ),
    );
  }
}