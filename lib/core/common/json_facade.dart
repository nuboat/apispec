import 'dart:convert';

String prettyPrintJson(dynamic jsonObject) {
  const JsonEncoder encoder = JsonEncoder.withIndent('  '); // Use 2 spaces for indent
  return encoder.convert(jsonObject);
}