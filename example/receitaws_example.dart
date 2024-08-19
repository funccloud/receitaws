import 'package:receitaws_api/receitaws_api.dart';

void main() {
  var api = ReceitaWS(token: 'your_token_here');
  api.getInfo('27865757000102').then((info) {
    print(info);
  }).catchError((error) {
    print(error);
  });
}
