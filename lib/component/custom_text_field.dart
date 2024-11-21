import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ship_5bv_app/const/colors.dart';

class CustomTextField extends StatelessWidget {

  final bool isTime;

  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final TextEditingController? controller;
  final String? initialValue;

  const CustomTextField({super.key, required this.isTime, required this.onSaved, required this.validator, this.initialValue, this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextFormField(
              controller: controller,
              initialValue: controller == null ? initialValue : null, // controller가 없을 때만 initialValue 사용
              onSaved: onSaved,
              validator: validator,
              cursorColor: Colors.grey,
              maxLines: 1,
              keyboardType: isTime? TextInputType.number:null,
              inputFormatters: isTime?
              [
               FilteringTextInputFormatter.digitsOnly,  // 숫자만 허용
               LengthLimitingTextInputFormatter(4),   // 4자리로 제한
              ]:[],
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: TEXT_FIELD_FILL_COLOR,
              ),
            )
        );
  }

}