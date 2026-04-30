import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final bool isTime;
  final bool isBizNumber;
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
    this.isBizNumber = false,
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
            onSaved.call(value.replaceAll(':', ''));
          } else if (isBizNumber && value != null) {
            onSaved.call(value.replaceAll('-', ''));
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
            : isBizNumber
            ? [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
          BizNumberFormatter(),
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

class BizNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // 숫자만 추출
    String digits = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // 최대 10자리 제한
    if (digits.length > 10) {
      digits = digits.substring(0, 10);
    }

    String formatted = digits;

    if (digits.length > 5) {
      formatted =
      '${digits.substring(0, 3)}-${digits.substring(3, 5)}-${digits.substring(5)}';
    } else if (digits.length > 3) {
      formatted =
      '${digits.substring(0, 3)}-${digits.substring(3)}';
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}