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
  // TIPO DE USUÁRIO SELECIONADO
  // ==========================================

  String tipoUsuario = 'Aluno';

  @override
  Widget build(BuildContext context) {
    // Verifica se Professor está selecionado
    final bool professorSelecionado = tipoUsuario == 'Professor';

    // ==========================================
    // CORES
    // ==========================================

    final Color corFundo = professorSelecionado
        ? const Color(0xFFF29C00)
        : Colors.white;

    final Color corPrincipal = professorSelecionado
        ? const Color(0xFF244977)
        : const Color(0xFF244977);

    return SafeArea(
      child: Scaffold(
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOut,

          width: double.infinity,
          height: double.infinity,

          color: corFundo,

          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                40,
                40,
                40,
                40,
              ),

              child: Column(
                children: [

                  // ==========================================
                  // SELETOR ALUNO / PROFESSOR
                  // ==========================================

                  Container(
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

                    child: Row(
                      children: [

                        // ==================================
                        // ALUNO
                        // ==================================

                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                tipoUsuario = 'Aluno';
                              });
                            },

                            child: AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 400,
                              ),

                              curve: Curves.easeInOut,

                              height: double.infinity,

                              decoration: BoxDecoration(
                                color: tipoUsuario == 'Aluno'
                                    ? const Color(0xFF244977)
                                    : Colors.transparent,

                                borderRadius:
                                    BorderRadius.circular(25),
                              ),

                              child: Center(
                                child: Text(
                                  'Aluno',

                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,

                                    color:
                                        tipoUsuario == 'Aluno'
                                            ? Colors.white
                                            : const Color(
                                                0xFF244977,
                                              ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // ==================================
                        // PROFESSOR
                        // ==================================

                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                tipoUsuario = 'Professor';
                              });
                            },

                            child: AnimatedContainer(
                              duration: const Duration(
                                milliseconds: 400,
                              ),

                              curve: Curves.easeInOut,

                              height: double.infinity,

                              decoration: BoxDecoration(
                                color:
                                    tipoUsuario == 'Professor'
                                        ? const Color(0xFFF29C00)
                                        : Colors.transparent,

                                borderRadius:
                                    BorderRadius.circular(25),
                              ),

                              child: Center(
                                child: Text(
                                  'Professor',

                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,

                                    color:
                                        tipoUsuario ==
                                                'Professor'
                                            ? Colors.white
                                            : const Color(
                                                0xFFF29C00,
                                              ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  // ==========================================
                  // LOGO
                  // ==========================================

                  SizedBox(
                    width: 200,
                    height: 200,

                    child: Image.asset(
                      'assets/img/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // ==========================================
                  // TÍTULO
                  // ==========================================

                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 500),

                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,

                      color: corPrincipal,
                    ),

                    child: Text(
                      professorSelecionado
                          ? 'Login do Professor'
                          : 'Login do Aluno',
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ==========================================
                  // EMAIL
                  // ==========================================

                  TextField(
                    controller: emailController,

                    keyboardType:
                        TextInputType.emailAddress,

                    style: const TextStyle(
                      color: Color(0xFF244977),
                      fontSize: 16,
                    ),

                    decoration: InputDecoration(
                      hintText: 'Digite seu e-mail',

                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),

                      filled: true,

                      fillColor: Colors.white,

                      contentPadding:
                          const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),

                      enabledBorder:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(53),

                        borderSide: BorderSide(
                          color: professorSelecionado
                              ? const Color(0xFF244977)
                              : const Color(0xFFF29C00),

                          width: 1,
                        ),
                      ),

                      focusedBorder:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(53),

                        borderSide: BorderSide(
                          color: professorSelecionado
                              ? const Color(0xFF244977)
                              : const Color(0xFFF29C00),

                          width: 2,
                        ),
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

                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),

                      filled: true,

                      fillColor: Colors.white,

                      contentPadding:
                          const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),

                      enabledBorder:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(53),

                        borderSide: BorderSide(
                          color: professorSelecionado
                              ? const Color(0xFF244977)
                              : const Color(0xFFF29C00),

                          width: 1,
                        ),
                      ),

                      focusedBorder:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(53),

                        borderSide: BorderSide(
                          color: professorSelecionado
                              ? const Color(0xFF244977)
                              : const Color(0xFFF29C00),

                          width: 2,
                        ),
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

                    child: AnimatedContainer(
                      duration:
                          const Duration(milliseconds: 500),

                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder: (context) =>
                                  const SegundaTela(),
                            ),
                          );
                        },

                        style:
                            ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF244977),

                          elevation: 0,

                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10),
                          ),
                        ),

                        child: Text(
                          'LOGIN',

                          style: GoogleFonts.inter(
                            fontSize: 20,

                            fontWeight:
                                FontWeight.w700,

                            color: Colors.white,
                          ),
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

                        fontWeight:
                            FontWeight.w500,

                        color:
                            const Color(0xFF244977),

                        decoration:
                            TextDecoration.underline,

                        decorationColor:
                            const Color(0xFF244977),
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
  // LIMPA OS CONTROLLERS
  // ==========================================

  @override
  void dispose() {
    emailController.dispose();
    senhaController.dispose();

    super.dispose();
  }
}