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
    final _controller = controller ?? TextEditingController(text: initialValue);

    return TextFormField(
      controller: _controller,
      onSaved: onSaved,
      validator: validator,
      keyboardType: isTime ? TextInputType.number : null,
      inputFormatters: isTime
          ? [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(4),
      ]
          : (mLength != null && mLength! > 0)
          ? [LengthLimitingTextInputFormatter(mLength)]
          : [],
      textAlignVertical: TextAlignVertical.top,
  /*
      decoration: InputDecoration(
        prefixIconConstraints: const BoxConstraints(minWidth: 30, minHeight: 30),
        prefixIcon: Container(
          margin: const EdgeInsets.only(right: 5),
          child: const Icon(Icons.edit, size: 20),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        hintText: '',
      ),
  */
    );
  }
}