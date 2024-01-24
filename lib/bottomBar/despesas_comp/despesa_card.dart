import 'package:definitivo_app_tcc/models/appdata.dart';
import 'package:definitivo_app_tcc/models/despesa_model.dart';
import 'package:definitivo_app_tcc/services/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:definitivo_app_tcc/models/appdata.dart' as appData;

class DespesaCard extends StatefulWidget {
  final DespesaModel despesaItem;

  DespesaCard({
    super.key,
    required this.despesaItem,
  });

  @override
  State<DespesaCard> createState() => _DespesaCardState();
}

class _DespesaCardState extends State<DespesaCard> {
  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Icon(Icons.type_specimen, size: 40,),
        title: Text(
          widget.despesaItem.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: Text(
          '- ${utilServices.priceToCurrency(widget.despesaItem.value)}',
          style: TextStyle(
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
    );
  }
}
