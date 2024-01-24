import 'dart:math';

import 'package:definitivo_app_tcc/bottomBar/despesas.dart';
import 'package:definitivo_app_tcc/bottomBar/entradas.dart';
import 'package:definitivo_app_tcc/bottomBar/geral.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String saldo;

  Home({
    super.key,
    required this.saldo,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 221, 221),
      body: Column(
        children: [
          SafeArea(
          child: Container(
            height: 50,
            decoration: const BoxDecoration(
              color: const Color.fromARGB(255, 34, 77, 36),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    'Saldo: R\$ ${widget.saldo}',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  left: 8,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.account_circle_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                Geral(),
                Despesas(),
                Entradas(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
          });   
        },
        unselectedItemColor: Colors.white.withAlpha(100),
        selectedItemColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 10, 48, 11),
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance_wallet_outlined,
                size: 40,
              ),
              label: 'Geral'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.attach_money,
                size: 40,
              ),
              label: 'Despesas'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.wallet_rounded,
                size: 40,
              ),
              label: 'Entradas'),
        ],
      ),
    );
  }
}


class Testwidget extends StatelessWidget {
  const Testwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.symmetric(
        vertical: 2,
      ),
      decoration: ShapeDecoration(
        color: Colors.grey, // Cor de fundo
        shape:
            CircleBorder(), // Forma do botão (pode ser ajustado conforme necessário)
      ),
      child: IconButton(
        color: Colors.white,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Ok'),
              );
            },
          );
        },
        icon: Icon(
          Icons.add,
        ),
      ),
    );
  }
}