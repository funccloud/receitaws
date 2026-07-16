import 'package:receitaws_api/receitaws_api.dart';

void main() async {
  // API Pública (sem token) — até 3 consultas/minuto
  final publicApi = ReceitaWS();
  final info = await publicApi.getInfo('00.000.000/0001-91');
  print('${info.nome} — ${info.situacao}');
  print('Simples: ${info.simples?.optante}');

  // API Comercial (com token)
  // final api = ReceitaWS(token: 'your_token_here');
  // final comercial = await api.getInfo('00000000000191', days: 30);
  // final ccc = await api.getCcc('00000000000191', days: 30);
  // final simples = await api.getSimples('00000000000191', days: 30);
  // final quota = await api.getQuota();
}
