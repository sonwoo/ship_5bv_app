import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ship_5bv_app/const/colors.dart';

class CustomTextField extends StatelessWidget {

  final bool isTime;

  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;

  const CustomTextField({super.key, required this.isTime, required this.onSaved, required this.validator});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextFormField(
              onSaved: onSaved,
              validator: validator,
              cursorColor: Colors.grey,
              maxLines: isTime ? 1:null,
              expands: !isTime,
              keyboardType: isTime? TextInputType.number:TextInputType.multiline,
              inputFormatters: isTime?
              [FilteringTextInputFormatter.digitsOnly,]:[],
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: TEXT_FIELD_FILL_COLOR,
                suffixText: isTime ? "시":null,
              ),
            )
        );
  }

}