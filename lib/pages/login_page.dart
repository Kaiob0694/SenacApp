import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(40, 100, 40, 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              //LOGO
              Container(
                width: 200,
                height: 200,
                child: Image.asset(
                  'assets/img/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
          
              //IMPUT EMAIL E SENHA
          
              Column(
                spacing: 40,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Digite seu e-mail',
                    filled: true,
                    fillColor: Color(0xFFE5E6F2),
                    contentPadding: EdgeInsets.fromLTRB(12, 24, 12, 24),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(3),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xFF535B9E),
                        width: 0.2,
              ),
            ),
          ),
        ),
        
                      TextField(
                        obscureText: true,
                    controller: senhaController,
                    decoration: const InputDecoration(
                      hintText: 'Digite sua senha',
                    filled: true,
                    fillColor: Color(0xFFE5E6F2),
                    contentPadding: EdgeInsets.fromLTRB(12, 24, 12, 24),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(3),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xFF535B9E),
                        width: 0.2,
              ),
            ),
          ),
        )
                ],
              ),
              //BOTÂO
              Column( 
                spacing: 20,
                children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SegundaTela(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF244977),
                  padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "LOGIN",
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight(700),
                    color: Color(0xFFE5E6F2),
                  ),
                ),
              ),
                  //Botão cadastro
                  Text("cadastrar",
                    style: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight(500), color: Color(0xFF0B59BC),
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFF0B59BC)),
                                
                    ),
                ],
              ),
              
            ],
          ),
        ),
      
      ),
    );
  }
}

//