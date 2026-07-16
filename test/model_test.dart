import 'dart:convert';

import 'package:receitaws_api/receitaws_api.dart';
import 'package:test/test.dart';

void main() {
  test('parses current RF response with simples/simei', () {
    final json = jsonDecode('''
{
  "abertura": "01/08/1966",
  "situacao": "ATIVA",
  "tipo": "MATRIZ",
  "nome": "BANCO DO BRASIL SA",
  "fantasia": "DIRECAO GERAL",
  "porte": "DEMAIS",
  "natureza_juridica": "203-8 - Sociedade de Economia Mista",
  "atividade_principal": [{"code": "64.22-1-00", "text": "Bancos"}],
  "atividades_secundarias": [{"code": "64.99-9-99", "text": "Outras"}],
  "qsa": [{"nome": "FULANO", "qual": "10-Diretor", "pais_origem": "BRASIL"}],
  "logradouro": "Q SAUN",
  "numero": "SN",
  "complemento": "",
  "municipio": "BRASILIA",
  "bairro": "ASA NORTE",
  "uf": "DF",
  "cep": "70.040-912",
  "email": "a@b.com",
  "telefone": "(61) 0000-0000",
  "data_situacao": "03/11/2005",
  "efr": "UNIÃO",
  "cnpj": "00.000.000/0001-91",
  "ultima_atualizacao": "2026-07-14T20:31:46.729Z",
  "status": "OK",
  "motivo_situacao": "",
  "situacao_especial": "",
  "data_situacao_especial": "",
  "capital_social": "120000000000.00",
  "simples": {
    "optante": false,
    "data_opcao": "01/07/2007",
    "data_exclusao": "01/07/2007",
    "ultima_atualizacao": "2026-07-13T23:59:59.000Z"
  },
  "simei": {
    "optante": false,
    "data_opcao": "01/07/2009",
    "data_exclusao": "01/07/2009",
    "ultima_atualizacao": "2026-07-13T23:59:59.000Z"
  },
  "extra": {},
  "billing": {"free": true, "database": true}
}
''') as Map<String, dynamic>;

    final info = Info.fromJson(json);
    expect(info.nome, 'BANCO DO BRASIL SA');
    expect(info.simples?.optante, isFalse);
    expect(info.simei?.optante, isFalse);
    expect(info.qsa.first.paisOrigem, 'BRASIL');
    expect(info.billing.free, isTrue);
  });
}
