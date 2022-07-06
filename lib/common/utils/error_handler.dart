import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:job_finder/common/utils/snackbar.dart';

void errorHandler({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;

    case 401:
      final parsed = jsonDecode(response.body);
      snackBarHandler(context: context, content: parsed['detail'], label: 'OK');
      break;

    default:
      final parsed = jsonDecode(response.body);
      snackBarHandler(
        context: context,
        content: (parsed['detail'] == null || parsed['detail'] == "")
            ? "Not Found"
            : parsed['detail'],
        label: 'OK',
      );
      break;
  }
}
