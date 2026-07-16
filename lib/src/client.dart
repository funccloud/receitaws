import 'dart:convert';

import 'package:http/http.dart';

import 'model.dart';

/// Estratégia de fallback da API Comercial.
///
/// - [cacheOnError] (padrão): retorna cache se a consulta em tempo real falhar
///   ou demorar mais de 30s.
/// - [noCache]: não retorna dados do cache em caso de erro/indisponibilidade.
enum Fallback { cacheOnError, noCache }

/// Client da [ReceitaWS API](https://developers.receitaws.com.br/).
class ReceitaWsApi {
  static const _baseUrl = 'https://receitaws.com.br/v1';

  /// Token da API Comercial. Opcional para a API Pública.
  final String? token;

  ReceitaWsApi({this.token});

  Map<String, String> get _headers => {
    'Accept': 'application/json',
    if (token != null) 'Authorization': 'Bearer $token',
  };

  /// Consulta dados da Receita Federal.
  ///
  /// Sem [token]: usa a API Pública (`GET /cnpj/{cnpj}`).
  /// Com [token]: usa a API Comercial (`GET /cnpj/{cnpj}/days/{days}`).
  Future<Info> getInfo(
    String cnpj, {
    int days = 0,
    Fallback fallback = Fallback.cacheOnError,
  }) async {
    final cleaned = _cleanCnpj(cnpj);
    final uri = token == null
        ? Uri.parse('$_baseUrl/cnpj/$cleaned')
        : _commercialUri('cnpj', cleaned, days, fallback);
    return _getJson(uri, Info.fromJson);
  }

  /// Consulta Inscrições Estaduais (Cadastro Centralizado de Contribuinte).
  ///
  /// Requer [token] (API Comercial).
  Future<CccInfo> getCcc(
    String cnpj, {
    int days = 0,
    Fallback fallback = Fallback.cacheOnError,
  }) async {
    _requireToken();
    final uri = _commercialUri('ccc', _cleanCnpj(cnpj), days, fallback);
    return _getJson(uri, CccInfo.fromJson);
  }

  /// Consulta detalhes do Simples Nacional / SIMEI.
  ///
  /// Requer [token] (API Comercial).
  Future<SimplesInfo> getSimples(
    String cnpj, {
    int days = 0,
    Fallback fallback = Fallback.cacheOnError,
  }) async {
    _requireToken();
    final uri = _commercialUri('simples', _cleanCnpj(cnpj), days, fallback);
    return _getJson(uri, SimplesInfo.fromJson);
  }

  /// Quota disponível da conta (API Comercial).
  Future<AccountQuota> getQuota() async {
    _requireToken();
    return _getJson(
      Uri.parse('$_baseUrl/account/quota'),
      AccountQuota.fromJson,
    );
  }

  /// Relatório das consultas recentes (API Comercial).
  Future<CallsReport> getCallsReport() async {
    _requireToken();
    return _getJson(
      Uri.parse('$_baseUrl/account/calls/report'),
      CallsReport.fromJson,
    );
  }

  Uri _commercialUri(
    String resource,
    String cnpj,
    int days,
    Fallback fallback,
  ) {
    return Uri.parse(
      '$_baseUrl/$resource/$cnpj/days/$days',
    ).replace(queryParameters: {'fallback': fallback.name});
  }

  Future<T> _getJson<T>(
    Uri uri,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final response = await get(uri, headers: _headers);
    final body = json.decode(response.body);

    if (response.statusCode == 200 && body is Map<String, dynamic>) {
      if (body['status'] == 'ERROR') {
        throw ReceitaWsApiException(
          statusCode: response.statusCode,
          message: body['message']?.toString() ?? 'Erro na consulta',
          body: body,
        );
      }
      return fromJson(body);
    }

    throw ReceitaWsApiException(
      statusCode: response.statusCode,
      message: body is Map ? body['message']?.toString() : null,
      body: body,
    );
  }

  void _requireToken() {
    if (token == null || token!.isEmpty) {
      throw StateError('Token é obrigatório para endpoints da API Comercial.');
    }
  }

  /// Remove pontuação; CNPJ pode ser alfanumérico (12 chars + 2 dígitos DV).
  static String _cleanCnpj(String cnpj) {
    return cnpj.replaceAll(RegExp(r'[^A-Za-z0-9]'), '').toUpperCase();
  }
}

class ReceitaWsApiException implements Exception {
  final int statusCode;
  final String? message;
  final Object? body;

  ReceitaWsApiException({required this.statusCode, this.message, this.body});

  @override
  String toString() =>
      'ReceitaWsApiException($statusCode${message != null ? ': $message' : ''})';
}
