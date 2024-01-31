import 'package:definitivo_app_tcc/bottomBar/despesas_comp/despesa_card.dart';
import 'package:definitivo_app_tcc/bottomBar/despesas_comp/despesas_add.dart';
import 'package:definitivo_app_tcc/models/banco_de_dados/database.dart';
import 'package:flutter/material.dart';

class Despesas extends StatefulWidget {
  Despesas({
    super.key,
  });

  @override
  State<Despesas> createState() => _DespesasState();
}

class _DespesasState extends State<Despesas> {
  List<TesteID> listaDespesas = [];
  final _db = DatabaseHelper();

  listarDespesas() async {
    List itemsRecuperados = await _db.listarDespesas();
    List<TesteID> listaTemporaria = [];

    for (var despesa in itemsRecuperados) {
      TesteID item = TesteID.fromMap(despesa);
      listaTemporaria.add(item);
    }

    if (mounted) {
      setState(() {
        listaDespesas = listaTemporaria;
      });
    }
    listaTemporaria = [];
  }

  @override
  void initState() {
    super.initState();
    listarDespesas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(150),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.green.withAlpha(150),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: listaDespesas.length,
                  itemBuilder: (context, index) {
                    return DespesaCard(
                      listaDespesas: listaDespesas,
                      despesaItem: listaDespesas[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniStartDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return DespesaAdd(
                    listaDespesas: listaDespesas,
                  );
                });
          },
          backgroundColor: Colors.black.withAlpha(150),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
