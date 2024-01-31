import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:definitivo_app_tcc/bottomBar/common_widgets/custom_textfield.dart';
import 'package:definitivo_app_tcc/bottomBar/despesas_comp/components/type_choice.dart';
import 'package:flutter/material.dart';

class EntradaAdd extends StatefulWidget {
  const EntradaAdd({super.key});

  @override
  State<EntradaAdd> createState() => _EntradaAddState();
}

class _EntradaAddState extends State<EntradaAdd> {

  TextEditingController _tituloEntradaC = TextEditingController();
  TextEditingController _valorEntradaC = TextEditingController();
  TextEditingController _tipoEntradaC = TextEditingController();
  TextEditingController _comentarioEntradaC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime actualdate = DateTime.now();
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
                      Text('Título da entrada'),
                      CustomTextField(icon: Icons.title, controller: _tituloEntradaC ,),
                      Text('Valor'),
                      CustomTextField(
                        icon: Icons.money,
                        type: TextInputType.number,
                        controller: _valorEntradaC,
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
                                //Teste
                                onTap: () {
                                  print('Casa');
                                },
                                //Teste
                                child: TypeChoice(
                                  icon: Icons.waving_hand_sharp,
                                  label: 'Salário',
                                  color: Colors.red,
                                ),
                              ),
                              TypeChoice(
                                icon: Icons.gif_box_outlined,
                                label: 'Presente',
                                color: Colors.blue,
                              ),
                              TypeChoice(
                                icon: Icons.emoji_symbols,
                                label: 'Outro',
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text('Comentário'),
                      CustomTextField(
                        icon: Icons.comment,
                        controller: _comentarioEntradaC,
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
                            style: TextStyle(
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
                            onPressed: () {
                              setState(() {
                                adicionarEntradaAoFirestore();
                              });
                            },
                            child: const Text(
                              'Concluir',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
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

  Future<void> adicionarEntradaAoFirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    print(_tituloEntradaC);
    print(_tituloEntradaC.text);
    await firestore.collection('entradas').add({
      'titulo': _tituloEntradaC.text,
      'valor': double.tryParse(_valorEntradaC.text),
      'tipo': 'random',
      'comentario': _comentarioEntradaC.text,
      'data': FieldValue.serverTimestamp(),
    });
    
  }
}
