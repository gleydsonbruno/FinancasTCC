import 'package:definitivo_app_tcc/bottomBar/common_widgets/custom_textfield.dart';
import 'package:definitivo_app_tcc/bottomBar/despesas_comp/components/type_choice.dart';
import 'package:definitivo_app_tcc/models/banco_de_dados/database.dart';
import 'package:flutter/material.dart';


class DespesaAdd extends StatefulWidget {
  List<TesteID> listaDespesas;
  DespesaAdd({
    super.key,
    required this.listaDespesas,
  });

  @override
  State<DespesaAdd> createState() => _DespesaAddState();
}

class _DespesaAddState extends State<DespesaAdd> {
  final _db = DatabaseHelper();
  DateTime actualdate = DateTime.now();
  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();
  TextEditingController d = TextEditingController();

  limpaCampos() {
    a.clear();
    b.clear();
    c.clear();
    d.clear();
  }

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
    listaTemporaria = [];
  }
  

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 7, bottom: 4, top: 15),
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              child: SingleChildScrollView(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Título da despesa'),
                      CustomTextField(
                        icon: Icons.title,
                        controller: a,
                      ),
                      Text('Valor'),
                      CustomTextField(
                        icon: Icons.money,
                        type: TextInputType.number,
                        controller: b,
                      ),
                      Text('Tipo'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black.withAlpha(70),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: TypeChoice(
                                  icon: Icons.house,
                                  label: 'Casa',
                                  color: Colors.red,
                                ),
                              ),
                              TypeChoice(
                                icon: Icons.layers,
                                label: 'Lazer',
                                color: Colors.blue,
                              ),
                              TypeChoice(
                                icon: Icons.heart_broken_outlined,
                                label: 'Saúde',
                                color: Colors.green,
                              ),
                              TypeChoice(
                                icon: Icons.bookmarks,
                                label: 'Educação',
                                color: Colors.purple,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text('Comentário'),
                      CustomTextField(
                        icon: Icons.comment,
                        controller: d,
                      ),
                      Text('Data'),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black.withAlpha(70),
                        ),
                        child: Center(
                          child: Text(
                            actualdate.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'Excluir',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              String title = a.text;
                              double value = double.parse(b.text);
                              String type = c.text;
                              String description = d.text;

                              TesteID teste = TesteID(
                                null,
                                title,
                                value,
                                description,
                                type,
                              );

                              await _db.inserir(teste);
                              setState(() {
                                widget.listaDespesas.add(teste);
                              });
                              limpaCampos();
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Concluir',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          
                        ],
                      ),
                     
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
