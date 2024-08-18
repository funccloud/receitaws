# Receita WS

ReceitaWS API client

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

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

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
