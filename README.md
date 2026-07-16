# Receita WS

Client Dart/Flutter para a [ReceitaWS API](https://developers.receitaws.com.br/).

## Usage

### API Pública (sem token)

```dart
import 'package:receitaws_api/receitaws.dart';

void main() async {
  final api = ReceitaWS();
  final info = await api.getInfo('00000000000191');
  print(info.nome);
}
```

### API Comercial (com token)

```dart
import 'package:receitaws_api/receitaws.dart';

void main() async {
  final api = ReceitaWS(token: 'your_token_here');

  // Receita Federal (defasagem máxima de 30 dias)
  final info = await api.getInfo(
    '00000000000191',
    days: 30,
    fallback: Fallback.cacheOnError,
  );

  // Inscrições Estaduais (CCC)
  final ccc = await api.getCcc('00000000000191', days: 30);

  // Simples Nacional
  final simples = await api.getSimples('00000000000191', days: 30);

  // Quota e relatório
  final quota = await api.getQuota();
  final calls = await api.getCallsReport();
}
```
