import 'dart:convert';

String prettyPrintJson(dynamic jsonObject) {
  // jsonObject can be a Map<String, dynamic>, List<dynamic>, or any valid JSON object
  const JsonEncoder encoder = JsonEncoder.withIndent('  '); // Use 2 spaces for indent
  return encoder.convert(jsonObject);
}