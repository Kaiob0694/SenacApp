import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  // ==========================================
  // TIPO DE USUÁRIO
  // ==========================================

  String tipoUsuario = 'Aluno';

  // ==========================================
  // SELETOR ALUNO / PROFESSOR
  // ==========================================

  Widget _buildSeletor() {
    return Container(
      height: 55,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double largura = constraints.maxWidth / 2;

          return Stack(
            children: [
              // ==================================
              // FUNDO DESLIZANTE
              // ==================================

              AnimatedPositioned(
                duration: const Duration(milliseconds: 450),
                curve: Curves.easeInOutCubic,
                left: tipoUsuario == 'Aluno' ? 0 : largura,
                top: 0,
                bottom: 0,
                width: largura,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 450),
                  decoration: BoxDecoration(
                    color: tipoUsuario == 'Aluno'
                        ? const Color(0xFF244977)
                        : const Color(0xFFF29C00),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),

              // ==================================
              // TEXTOS
              // ==================================

              Row(
                children: [
                  // ALUNO
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        setState(() {
                          tipoUsuario = 'Aluno';
                        });
                      },
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 300),
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: tipoUsuario == 'Aluno'
                                ? Colors.white
                                : const Color(0xFF244977),
                          ),
                          child: const Text('Aluno'),
                        ),
                      ),
                    ),
                  ),

                  // PROFESSOR
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        setState(() {
                          tipoUsuario = 'Professor';
                        });
                      },
                      child: Center(
                        child: AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 300),
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: tipoUsuario == 'Professor'
                                ? Colors.white
                                : const Color(0xFFF29C00),
                          ),
                          child: const Text('Professor'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool professorSelecionado = tipoUsuario == 'Professor';

    // ==========================================
    // LOGOS
    // ==========================================

    const String logoAluno = 'assets/img/logo.png';
    const String logoProfessor = 'assets/img/logo_professor.png';

    // ==========================================
    // CORES
    // ==========================================

    final Color corFundo =
        professorSelecionado ? const Color(0xFFF29C00) : Colors.white;

    final Color corPrincipal = const Color(0xFF244977);

    final Color corBorda = professorSelecionado
        ? const Color(0xFF244977)
        : const Color(0xFFF29C00);

    return SafeArea(
      child: Scaffold(
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOutCubic,
          width: double.infinity,
          height: double.infinity,
          color: corFundo,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
              child: Column(
                children: [
                  // ==========================================
                  // LOGO (troca conforme Aluno / Professor)
                  // ==========================================

                  SizedBox(
                    width: 200,
                    height: 200,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      switchInCurve: Curves.easeInOut,
                      switchOutCurve: Curves.easeInOut,
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: ScaleTransition(
                            scale: Tween<double>(begin: 0.9, end: 1.0)
                                .animate(animation),
                            child: child,
                          ),
                        );
                      },
                      child: Image.asset(
                        professorSelecionado ? logoProfessor : logoAluno,
                        key: ValueKey(tipoUsuario),
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ==========================================
                  // TÍTULO
                  // ==========================================

                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: Text(
                      professorSelecionado
                          ? 'Login do Professor'
                          : 'Login do Aluno',
                      key: ValueKey(tipoUsuario),
                      style: GoogleFonts.inter(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: corPrincipal,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ==========================================
                  // SELETOR ALUNO / PROFESSOR (acima do e-mail)
                  // ==========================================

                  _buildSeletor(),

                  const SizedBox(height: 25),

                  // ==========================================
                  // EMAIL
                  // ==========================================

                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                      color: Color(0xFF244977),
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Digite seu e-mail',
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(53),
                        borderSide: BorderSide(color: corBorda, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(53),
                        borderSide: BorderSide(color: corBorda, width: 2),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ==========================================
                  // SENHA
                  // ==========================================

                  TextField(
                    controller: senhaController,
                    obscureText: true,
                    style: const TextStyle(
                      color: Color(0xFF244977),
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Digite sua senha',
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(53),
                        borderSide: BorderSide(color: corBorda, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(53),
                        borderSide: BorderSide(color: corBorda, width: 2),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // ==========================================
                  // BOTÃO LOGIN
                  // ==========================================

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SegundaTela(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: corPrincipal,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'LOGIN',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ==========================================
                  // CADASTRO
                  // ==========================================

                  GestureDetector(
                    onTap: () {
                      // Tela de cadastro
                    },
                    child: Text(
                      'Cadastrar',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: corPrincipal,
                        decoration: TextDecoration.underline,
                        decorationColor: corPrincipal,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================
  // DISPOSE
  // ==========================================

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();

    super.dispose();
  }
}