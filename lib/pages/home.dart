import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notas.dart';
import 'frequencia.dart';
import 'comunicados.dart';
import 'notificacao.dart';
import 'atividades.dart';
import 'configuracao.dart';

class SegundaTela extends StatefulWidget {
  const SegundaTela({super.key});

  @override
  State<SegundaTela> createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  static const Color laranja = Color(0xFFF29C00);
  static const Color laranjaEscuro = Color(0xFFF2711C);

  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 28),
              _buildMenu(context),
              const SizedBox(height: 24),
              _buildBannerInfo(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  
  void _abrir(BuildContext context, Widget tela) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => tela));
  }

  
  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 28,
          backgroundImage: AssetImage('assets/perfil.png'),
        ),
        const SizedBox(width: 12),
        Text(
          'Olá, Kaio',
          style: GoogleFonts.poppins(
            color: laranjaEscuro,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 4),
        const Icon(Icons.keyboard_arrow_down, color: Colors.black87, size: 20),
        const Spacer(),
        IconButton(
          onPressed: () => _abrir(context, const NotificacoesPage()),
          icon: const Icon(Icons.notifications_none,
              color: laranjaEscuro, size: 28),
        ),
        IconButton(
          onPressed: () => _abrir(context, const ConfiguracoesPage()),
          icon: const Icon(Icons.settings_outlined,
              color: laranjaEscuro, size: 28),
        ),
      ],
    );
  }

  // Linha com os 4 botões
  Widget _buildMenu(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _menuItem(Icons.edit_note, 'Notas',
            () => _abrir(context, const NotasPage())),
        _menuItem(Icons.percent, 'Frequência',
            () => _abrir(context, const FrequenciaPage())),
        _menuItem(Icons.folder_shared_outlined, 'Comunicados',
            () => _abrir(context, const ComunicadosPage())),
        _menuItem(Icons.folder_shared_outlined, 'Atividades',
            () => _abrir(context, const AtividadesPage())),
      ],
    );
  }

  Widget _menuItem(IconData icone, String titulo, VoidCallback onTap) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: AspectRatio(
          aspectRatio: 1,
          child: Material(
            color: laranja,
            borderRadius: BorderRadius.circular(24),
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: onTap,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icone, color: Colors.white, size: 32),
                  const SizedBox(height: 6),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      titulo,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  
  Widget _buildBannerInfo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: double.infinity,
        height: 190,
        decoration: const BoxDecoration(color: laranja),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/banner.jpg',
              fit: BoxFit.cover,
              // Se a imagem não existir, mostra um fundo laranja com ícone
              errorBuilder: (context, error, stackTrace) => Container(
                color: laranja,
                child: const Icon(Icons.image_outlined,
                    color: Colors.white54, size: 64),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.65),
                  ],
                ),
              ),
            ),
            // Informações sobre a imagem
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: laranjaEscuro,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'AVISO',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Semana de Provas',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'De 14 a 18 de outubro. Confira o calendário completo na Agenda.',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Barra inferior
  Widget _buildBottomBar() {
    return BottomNavigationBar(
      currentIndex: _indiceAtual,
      onTap: (i) => setState(() => _indiceAtual = i),
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: laranjaEscuro,
      unselectedItemColor: Colors.black38,
      selectedLabelStyle: GoogleFonts.poppins(fontSize: 11),
      unselectedLabelStyle: GoogleFonts.poppins(fontSize: 11),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Início'),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined), label: 'Agenda'),
        BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline), label: 'Mensagens'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Perfil'),
      ],
    );
  }
}