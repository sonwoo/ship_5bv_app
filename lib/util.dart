import 'package:flutter/material.dart';
import 'package:ship_5bv_app/component/custom_alert_popup.dart';

void showCustomAlertPopup(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomAelrtPopup(title: title, message: message);
    },
  );
}