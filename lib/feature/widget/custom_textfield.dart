import 'package:flutter/material.dart';
import 'package:travel_app_design/product/constant/colors.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      cursorColor: ApplicationColors.grey,
      decoration: const InputDecoration(
        filled: true,
        fillColor: ApplicationColors.textfieldbackroundCollor,
        hintText: 'Find things to do',
        hintStyle: TextStyle(color: ApplicationColors.grey3, fontSize: 13),
        prefixIcon: Icon(Icons.search, color: Colors.grey, size: 20),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: ApplicationColors.white)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: ApplicationColors.white),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: ApplicationColors.white)),
      ),
    );
  }
}
