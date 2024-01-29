import 'package:definitivo_app_tcc/auth/common/custom_form.dart';
import 'package:definitivo_app_tcc/bottomBar/common_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final cpfFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##',
      filter: {'#': RegExp(r'[0-9]')},
    );
  final phoneFormatter = MaskTextInputFormatter(
      mask: '(##) # ####-####',
      filter: {'#': RegExp(r'[0-9]')},
    );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),

                  //Formulario
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(45),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomAuthField(
                          icon: Icons.email,
                          label: 'Email',
                        ),
                        CustomAuthField(
                          icon: Icons.lock,
                          label: 'Senha',
                          isSecret: true,
                        ),
                        CustomAuthField(
                          icon: Icons.person,
                          label: 'Nome',
                        ),
                        CustomAuthField(
                          icon: Icons.phone,
                          label: 'Celular',
                          inputFormatters: [phoneFormatter],
                        ),
                        CustomAuthField(
                          icon: Icons.file_copy,
                          label: 'CPF',
                          inputFormatters: [cpfFormatter],
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Cadastrar usuário',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 10,
                top: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
