import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:http/http.dart' as http;

final uri = Platform.environment['URI'];

Future<http.Response> _getResponse() async {
  final url = Uri.parse(uri!);
  return await http.get(url);
}

Future<Response> getNRCPrefixAll(Request request) async {
  final response = await _getResponse();

  if (response.statusCode == 200) {
    return Response.ok(
      response.body,
      headers: {'Content-Type': 'application/json'},
    );
  } else {
    return Response.internalServerError(
      body: 'An Error Occured: ${response.body}',
    );
  }
}

Future<Response> getUnionTerritories(Request request) async {
  final response = await _getResponse();

  if (response.statusCode == 200) {
    final responseBody = jsonDecode(response.body);
    return Response.ok(
      jsonEncode(responseBody['union_territories']),
      headers: {'Content-Type': 'application/json'},
    );
  } else {
    return Response.internalServerError(
      body: 'An Error Occured: ${response.body}',
    );
  }
}

Future<Response> getNRCPrefixCodes(Request request) async {
  final response = await _getResponse();

  if (response.statusCode == 200) {
    final responseBody = jsonDecode(response.body);
    return Response.ok(
      jsonEncode(responseBody['nrc_prefix_codes']),
      headers: {'Content-Type': 'application/json'},
    );
  } else {
    return Response.internalServerError(
      body: 'An Error Occured: ${response.body}',
    );
  }
}
