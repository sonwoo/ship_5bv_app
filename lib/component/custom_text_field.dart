import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final bool isTime;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final TextEditingController? controller;
  final String? initialValue;
  final int? mLength;
  final bool? isEnable;

  const CustomTextField({
    super.key,
    required this.isTime,
    required this.onSaved,
    required this.validator,
    this.initialValue,
    this.controller,
    this.mLength,
    this.isEnable
  });

  @override
  Widget build(BuildContext context) {
    final controller = this.controller ?? TextEditingController(text: initialValue);

    return TextFormField(

      controller: controller,

        onSaved: (value) {
          if (isTime && value != null) {
            // 시간일 때만 ":" 제거
            onSaved.call(value.replaceAll(':', ''));
          } else {
            onSaved.call(value);
          }
        },

      validator: validator,
      keyboardType: isTime ? TextInputType.number : TextInputType.text,

      inputFormatters: isTime
          ? [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(4),
        TimeTextFormatter(),
          ]
          : (mLength != null && mLength! > 0)
          ? [LengthLimitingTextInputFormatter(mLength)]
          : [],

      textAlignVertical: TextAlignVertical.top,

      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        hintStyle: TextStyle(
          color: Colors.white54,
        ),
      )
    );
  }
}


class TimeTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String digits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (digits.length > 4) {
      digits = digits.substring(0, 4);
    }

    String formatted = digits;
    if (digits.length >= 3) {
      formatted = '${digits.substring(0, 2)}:${digits.substring(2)}';
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}