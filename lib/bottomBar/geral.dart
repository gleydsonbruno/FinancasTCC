import 'package:flutter/material.dart';

class Geral extends StatelessWidget {
  const Geral({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Barra de amostra de saldo

        //Despesas | Entrada

        //Lista de despesas\entradas
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25),
              ),
              color: Color.fromARGB(255, 90, 139, 90),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 194, 241, 195),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                        child: Text(
                      'Não houveram mudanças no dinheiro hoje.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.lightGreenAccent,
                  ),
                  Text('Você está está com gastos controlados, continue assim.')
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
