import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SegundaTela extends StatelessWidget {
  const SegundaTela({super.key});

  static const Color laranja = Color(0xFFF29C00);
  static const Color laranjaEscuro = Color(0xFFF2711C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 28),
              _buildMenu(context),
            ],
          ),
        ),
      ),
    );
  }

  // Cabeçalho: foto + "Olá, Kaio" + sino + engrenagem
  Widget _buildHeader() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 28,
          backgroundColor: Colors.grey,
          // Troque pela sua imagem: AssetImage('assets/perfil.png')
          child: Icon(Icons.person, color: Colors.white, size: 32),
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
          onPressed: () {},
          icon: const Icon(Icons.notifications_none, color: laranjaEscuro, size: 28),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings_outlined, color: laranjaEscuro, size: 28),
        ),
      ],
    );
  }

  // Linha com os 4 botões
  Widget _buildMenu(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _menuItem(Icons.edit_note, 'Notas', () {}),
        _menuItem(Icons.percent, 'Frequência', () {}),
        _menuItem(Icons.folder_shared_outlined, 'Comunicados', () {}),
        _menuItem(Icons.folder_shared_outlined, 'Atividades', () {}),
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
}