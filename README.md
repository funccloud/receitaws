# Receita WS

ReceitaWS API client

## Usage

```dart
import 'package:receitaws/receitaws.dart';

void main() {
  var api = ReceitaWS(token: 'your_token_here');
  api.getInfo('27865757000102').then((info) {
    print(info);
  }).catchError((error) {
    print(error);
  });
}
```
