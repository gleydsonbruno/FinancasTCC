import 'package:definitivo_app_tcc/bottomBar/despesas_comp/despesa_card.dart';
import 'package:definitivo_app_tcc/bottomBar/despesas_comp/despesas_add.dart';
import 'package:definitivo_app_tcc/bottomBar/entradas_comp/entrada_card.dart';
import 'package:definitivo_app_tcc/bottomBar/entradas_comp/entradas_add.dart';
import 'package:definitivo_app_tcc/models/appdata.dart';
import 'package:definitivo_app_tcc/models/despesa_model.dart';
import 'package:flutter/material.dart';
import 'package:definitivo_app_tcc/models/appdata.dart' as appData;

class Entradas extends StatelessWidget {
  Entradas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(150),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.green.withAlpha(150),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(children: [
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: despesas.length,
                itemBuilder: (_, index) {
                  return EntradaCard(
                    entradaItem: appData.entradas[index],
                  );
                },
              ),
            ),
          ]),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniStartDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
            onPressed: () {
              showDialog(context: context, builder: (context) {
                return EntradaAdd();
              });
            },
            backgroundColor: Colors.black.withAlpha(150),
            child: Icon(Icons.add)),
      ),
    );
  }
}
