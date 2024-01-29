import 'package:definitivo_app_tcc/models/appdata.dart';
import 'package:definitivo_app_tcc/models/banco_de_dados/database.dart';
import 'package:definitivo_app_tcc/models/despesa_model.dart';
import 'package:definitivo_app_tcc/services/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:definitivo_app_tcc/models/appdata.dart' as appData;

class DespesaCard extends StatefulWidget {
  final TesteID despesaItem;
  List<TesteID> listaDespesas;

  DespesaCard({
    super.key,
    required this.despesaItem,
    required this.listaDespesas,
  });

  @override
  State<DespesaCard> createState() => _DespesaCardState();
}

class _DespesaCardState extends State<DespesaCard> {
  final _db = DatabaseHelper();
  final UtilServices utilServices = UtilServices();

  listarDespesas() async {
    List itemsRecuperados = await _db.listarDespesas();
    List<TesteID> listaTemporaria = [];

    for (var despesa in itemsRecuperados) {
      TesteID item = TesteID.fromMap(despesa);
      listaTemporaria.add(item);
    }

    if (mounted) {
      setState(() {
        widget.listaDespesas = listaTemporaria;
      });
    }
    ;
    listaTemporaria = [];
  }

  _removerDespesa(int id) async {
    await _db.removerDespesa(id);
    listarDespesas();
  }

  @override
  void initState() {
    super.initState();
    listarDespesas();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        _removerDespesa(widget.despesaItem.id!);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          leading: Icon(
            Icons.type_specimen,
            size: 40,
          ),
          title: Text(
            widget.despesaItem.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          subtitle: Text(
            '- ${utilServices.priceToCurrency(widget.despesaItem.value)}',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.read_more),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('${widget.despesaItem.description}'),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}
