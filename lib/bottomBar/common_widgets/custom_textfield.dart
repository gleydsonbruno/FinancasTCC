import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final TextInputType type;

  const CustomTextField({
    super.key,
    required this.icon,
    this.type = TextInputType.text, 
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        keyboardType: widget.type,
        decoration: InputDecoration(
            prefixIcon: Icon(widget.icon),
            suffixIcon: Icon(Icons.read_more),
            
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
            ),),
      ),
    );
  }
}
