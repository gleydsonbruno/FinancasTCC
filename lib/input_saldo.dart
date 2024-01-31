import 'dart:async';

import 'package:definitivo_app_tcc/home.dart';
import 'package:definitivo_app_tcc/models/banco_de_dados/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputSaldo extends StatefulWidget {
  InputSaldo({super.key});

  @override
  State<InputSaldo> createState() => _InputSaldoState();
}

class _InputSaldoState extends State<InputSaldo> {

  TextEditingController saldoC = TextEditingController();
  final db = DatabaseHelper();
  double saldoAtual = 0.0 ;



  enviarSaldo(Saldo valor) async {
    Saldo real = valor;
    return await db.atualizarSaldo(real);

  }

  @override
  void initState() {
    super.initState();
    //carregarSaldo();
    
  }

   carregarSaldo() async {
    Saldo? saldoAtual = await db.obterSaldoUsuario();
    return saldoAtual;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: Text(
              'Seu saldo atual:',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25, left: 55, right: 55),
            child: TextField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
              ),
              controller: saldoC,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 75,
              vertical: 25,
            ),
            child: ElevatedButton(
              onPressed: () async {
                dynamic oq = double.tryParse(saldoC.text);
                var valor = Saldo(oq);
                enviarSaldo(valor);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 33, 90, 35),
                padding: EdgeInsets.all(18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Text(
                'Confirmar',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

