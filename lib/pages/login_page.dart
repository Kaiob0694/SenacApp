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
    final bool professorSelecionado = tipoUsuario == 'Professor';

    return Container(
      height: 45,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        // Borda laranja no modo Professor
        border: professorSelecionado
            ? Border.all(color: const Color(0xFFF29C00), width: 1)
            : null,
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
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                            color: tipoUsuario == 'Aluno'
                                ? Colors.white
                                : const Color(0xFFF29C00),
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
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
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

    const Color azul = Color(0xFF244977);
    const Color laranja = Color(0xFFF29C00);

    // Fundo laranja no modo Professor
    final Color corFundo = professorSelecionado ? laranja : Colors.white;

    // Borda dos campos: azul no Professor, laranja no Aluno
    final Color corBorda = professorSelecionado ? azul : laranja;

    // Texto digitado e dica dos campos (laranja no Professor)
    final Color corTextoCampo = professorSelecionado ? laranja : azul;
    final Color corHint = professorSelecionado ? laranja : Colors.grey;

    // ==========================================
    // BOTÃO "ACESSAR" E "CADASTRAR"
    // ==========================================

    // Professor: sem fundo, borda branca, texto branco
    // Aluno: fundo azul, texto branco
    final Color corBotaoFundo = professorSelecionado ? Colors.transparent : azul;
    final Color corBotaoBorda = professorSelecionado ? Colors.white : azul;
    final Color corBotaoTexto = Colors.white;

    // "Cadastrar": branco no Professor, azul no Aluno
    final Color corCadastrar = professorSelecionado ? Colors.white : azul;

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
                  // ESPAÇO EXTRA PARA DESCER O LOGO
                  // ==========================================

                  const SizedBox(height: 30),

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
  
                  ),

                  const SizedBox(height: 120),

                  // ==========================================
                  // SELETOR ALUNO / PROFESSOR (acima do e-mail)
                  // ==========================================

                  Center(
                    child: SizedBox(
                      width: 190,
                      child: _buildSeletor(),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // ==========================================
                  // EMAIL
                  // ==========================================

                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: corTextoCampo,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Digite seu e-mail',
                      hintStyle: TextStyle(color: corHint),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
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

                  const SizedBox(height: 20),

                  // ==========================================
                  // SENHA
                  // ==========================================

                  TextField(
                    controller: senhaController,
                    obscureText: true,
                    style: TextStyle(
                      color: corTextoCampo,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Digite sua senha',
                      hintStyle: TextStyle(color: corHint),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
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

                  const SizedBox(height: 20),

                  // ==========================================
                  // BOTÃO LOGIN
                  // ==========================================

                  SizedBox(
                    width: 165,
                    height: 37,
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
                        backgroundColor: corBotaoFundo, // ALTERADO
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        // ALTERADO: borda branca no Professor
                        side: BorderSide(color: corBotaoBorda, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        'Acessar',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: corBotaoTexto, // ALTERADO
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

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
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: corCadastrar, // ALTERADO
                        decorationColor: corCadastrar,
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