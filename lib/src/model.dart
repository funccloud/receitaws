class Info {
  Info({
    required this.abertura,
    required this.situacao,
    required this.tipo,
    required this.nome,
    required this.porte,
    required this.naturezaJuridica,
    required this.atividadePrincipal,
    required this.atividadesSecundarias,
    required this.qsa,
    required this.logradouro,
    required this.numero,
    required this.complemento,
    required this.municipio,
    required this.bairro,
    required this.uf,
    required this.cep,
    required this.email,
    required this.telefone,
    required this.dataSituacao,
    required this.cnpj,
    required this.ultimaAtualizacao,
    required this.status,
    required this.fantasia,
    required this.efr,
    required this.motivoSituacao,
    required this.situacaoEspecial,
    required this.dataSituacaoEspecial,
    required this.capitalSocial,
    this.simples,
    this.simei,
    required this.extra,
    required this.billing,
  });

  late final String abertura;
  late final String situacao;
  late final String tipo;
  late final String nome;
  late final String porte;
  late final String naturezaJuridica;
  late final List<Atividade> atividadePrincipal;
  late final List<Atividade> atividadesSecundarias;
  late final List<Qsa> qsa;
  late final String logradouro;
  late final String numero;
  late final String complemento;
  late final String municipio;
  late final String bairro;
  late final String uf;
  late final String cep;
  late final String email;
  late final String telefone;
  late final String dataSituacao;
  late final String cnpj;
  late final String ultimaAtualizacao;
  late final String status;
  late final String fantasia;
  late final String efr;
  late final String motivoSituacao;
  late final String situacaoEspecial;
  late final String dataSituacaoEspecial;
  late final String capitalSocial;
  late final RegimeTributario? simples;
  late final RegimeTributario? simei;
  late final Extra extra;
  late final Billing billing;

  Info.fromJson(Map<String, dynamic> json) {
    abertura = _str(json['abertura']);
    situacao = _str(json['situacao']);
    tipo = _str(json['tipo']);
    nome = _str(json['nome']);
    porte = _str(json['porte']);
    naturezaJuridica = _str(json['natureza_juridica']);
    atividadePrincipal = _list(json['atividade_principal'], Atividade.fromJson);
    atividadesSecundarias = _list(
      json['atividades_secundarias'],
      Atividade.fromJson,
    );
    qsa = _list(json['qsa'], Qsa.fromJson);
    logradouro = _str(json['logradouro']);
    numero = _str(json['numero']);
    complemento = _str(json['complemento']);
    municipio = _str(json['municipio']);
    bairro = _str(json['bairro']);
    uf = _str(json['uf']);
    cep = _str(json['cep']);
    email = _str(json['email']);
    telefone = _str(json['telefone']);
    dataSituacao = _str(json['data_situacao']);
    cnpj = _str(json['cnpj']);
    ultimaAtualizacao = _str(json['ultima_atualizacao']);
    status = _str(json['status']);
    fantasia = _str(json['fantasia']);
    efr = _str(json['efr']);
    motivoSituacao = _str(json['motivo_situacao']);
    situacaoEspecial = _str(json['situacao_especial']);
    dataSituacaoEspecial = _str(json['data_situacao_especial']);
    capitalSocial = _str(json['capital_social']);
    simples = json['simples'] is Map
        ? RegimeTributario.fromJson(
            Map<String, dynamic>.from(json['simples'] as Map),
          )
        : null;
    simei = json['simei'] is Map
        ? RegimeTributario.fromJson(
            Map<String, dynamic>.from(json['simei'] as Map),
          )
        : null;
    extra = Extra.fromJson(json['extra'] is Map ? json['extra'] as Map : {});
    billing = Billing.fromJson(
      Map<String, dynamic>.from(json['billing'] as Map? ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
    'abertura': abertura,
    'situacao': situacao,
    'tipo': tipo,
    'nome': nome,
    'porte': porte,
    'natureza_juridica': naturezaJuridica,
    'atividade_principal': atividadePrincipal.map((e) => e.toJson()).toList(),
    'atividades_secundarias': atividadesSecundarias
        .map((e) => e.toJson())
        .toList(),
    'qsa': qsa.map((e) => e.toJson()).toList(),
    'logradouro': logradouro,
    'numero': numero,
    'complemento': complemento,
    'municipio': municipio,
    'bairro': bairro,
    'uf': uf,
    'cep': cep,
    'email': email,
    'telefone': telefone,
    'data_situacao': dataSituacao,
    'cnpj': cnpj,
    'ultima_atualizacao': ultimaAtualizacao,
    'status': status,
    'fantasia': fantasia,
    'efr': efr,
    'motivo_situacao': motivoSituacao,
    'situacao_especial': situacaoEspecial,
    'data_situacao_especial': dataSituacaoEspecial,
    'capital_social': capitalSocial,
    if (simples != null) 'simples': simples!.toJson(),
    if (simei != null) 'simei': simei!.toJson(),
    'extra': extra.toJson(),
    'billing': billing.toJson(),
  };
}

/// Mantido por compatibilidade; use [Atividade].
typedef AtividadePrincipal = Atividade;

/// Mantido por compatibilidade; use [Atividade].
typedef AtividadesSecundarias = Atividade;

class Atividade {
  Atividade({required this.code, required this.text});

  late final String code;
  late final String text;

  Atividade.fromJson(Map<String, dynamic> json) {
    code = _str(json['code']);
    text = _str(json['text']);
  }

  Map<String, dynamic> toJson() => {'code': code, 'text': text};
}

class Qsa {
  Qsa({
    required this.nome,
    required this.qual,
    this.paisOrigem,
    this.nomeRepLegal,
    this.qualRepLegal,
  });

  late final String nome;
  late final String qual;
  late final String? paisOrigem;
  late final String? nomeRepLegal;
  late final String? qualRepLegal;

  Qsa.fromJson(Map<String, dynamic> json) {
    nome = _str(json['nome']);
    qual = _str(json['qual']);
    paisOrigem = json['pais_origem']?.toString();
    nomeRepLegal = json['nome_rep_legal']?.toString();
    qualRepLegal = json['qual_rep_legal']?.toString();
  }

  Map<String, dynamic> toJson() => {
    'nome': nome,
    'qual': qual,
    if (paisOrigem != null) 'pais_origem': paisOrigem,
    if (nomeRepLegal != null) 'nome_rep_legal': nomeRepLegal,
    if (qualRepLegal != null) 'qual_rep_legal': qualRepLegal,
  };
}

class RegimeTributario {
  RegimeTributario({
    required this.optante,
    this.dataOpcao,
    this.dataExclusao,
    this.ultimaAtualizacao,
  });

  late final bool optante;
  late final String? dataOpcao;
  late final String? dataExclusao;
  late final String? ultimaAtualizacao;

  RegimeTributario.fromJson(Map<String, dynamic> json) {
    optante = json['optante'] == true;
    dataOpcao = json['data_opcao']?.toString();
    dataExclusao = json['data_exclusao']?.toString();
    ultimaAtualizacao = json['ultima_atualizacao']?.toString();
  }

  Map<String, dynamic> toJson() => {
    'optante': optante,
    if (dataOpcao != null) 'data_opcao': dataOpcao,
    if (dataExclusao != null) 'data_exclusao': dataExclusao,
    if (ultimaAtualizacao != null) 'ultima_atualizacao': ultimaAtualizacao,
  };
}

class Extra {
  Extra();

  Extra.fromJson(Map json);

  Map<String, dynamic> toJson() => {};
}

class Billing {
  Billing({required this.free, required this.database});

  late final bool free;
  late final bool database;

  Billing.fromJson(Map<String, dynamic> json) {
    free = json['free'] == true;
    database = json['database'] == true;
  }

  Map<String, dynamic> toJson() => {'free': free, 'database': database};
}

class CccInfo {
  CccInfo({
    required this.status,
    required this.ultimaAtualizacao,
    required this.cnpj,
    required this.registros,
    required this.billing,
  });

  late final String status;
  late final String ultimaAtualizacao;
  late final String cnpj;
  late final List<CccRegistro> registros;
  late final Billing billing;

  CccInfo.fromJson(Map<String, dynamic> json) {
    status = _str(json['status']);
    ultimaAtualizacao = _str(json['ultima_atualizacao']);
    cnpj = _str(json['cnpj']);
    registros = _list(json['registros'], CccRegistro.fromJson);
    billing = Billing.fromJson(
      Map<String, dynamic>.from(json['billing'] as Map? ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'ultima_atualizacao': ultimaAtualizacao,
    'cnpj': cnpj,
    'registros': registros.map((e) => e.toJson()).toList(),
    'billing': billing.toJson(),
  };
}

class CccRegistro {
  CccRegistro({
    required this.uf,
    required this.ie,
    required this.tipoIe,
    required this.situacaoIe,
    required this.dataSituacao,
    required this.regimeIcms,
    required this.situacaoCnpj,
    required this.dataAtualizacao,
  });

  late final String uf;
  late final String ie;
  late final String tipoIe;
  late final String situacaoIe;
  late final String dataSituacao;
  late final String regimeIcms;
  late final String situacaoCnpj;
  late final String dataAtualizacao;

  CccRegistro.fromJson(Map<String, dynamic> json) {
    uf = _str(json['uf']);
    ie = _str(json['ie']);
    tipoIe = _str(json['tipo_ie']);
    situacaoIe = _str(json['situacao_ie']);
    dataSituacao = _str(json['data_situacao']);
    regimeIcms = _str(json['regime_icms']);
    situacaoCnpj = _str(json['situacao_cnpj']);
    dataAtualizacao = _str(json['data_atualizacao']);
  }

  Map<String, dynamic> toJson() => {
    'uf': uf,
    'ie': ie,
    'tipo_ie': tipoIe,
    'situacao_ie': situacaoIe,
    'data_situacao': dataSituacao,
    'regime_icms': regimeIcms,
    'situacao_cnpj': situacaoCnpj,
    'data_atualizacao': dataAtualizacao,
  };
}

class SimplesInfo {
  SimplesInfo({
    required this.cnpj,
    this.simples,
    this.simei,
    required this.billing,
  });

  late final String cnpj;
  late final SimplesDetalhe? simples;
  late final SimplesDetalhe? simei;
  late final Billing billing;

  SimplesInfo.fromJson(Map<String, dynamic> json) {
    cnpj = _str(json['cnpj']);
    simples = json['simples'] is Map
        ? SimplesDetalhe.fromJson(
            Map<String, dynamic>.from(json['simples'] as Map),
          )
        : null;
    simei = json['simei'] is Map
        ? SimplesDetalhe.fromJson(
            Map<String, dynamic>.from(json['simei'] as Map),
          )
        : null;
    billing = Billing.fromJson(
      Map<String, dynamic>.from(json['billing'] as Map? ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
    'cnpj': cnpj,
    if (simples != null) 'simples': simples!.toJson(),
    if (simei != null) 'simei': simei!.toJson(),
    'billing': billing.toJson(),
  };
}

class SimplesDetalhe {
  SimplesDetalhe({required this.optante, this.dataOpcao, this.historico});

  late final bool optante;
  late final String? dataOpcao;
  late final SimplesHistorico? historico;

  SimplesDetalhe.fromJson(Map<String, dynamic> json) {
    optante = json['optante'] == true;
    dataOpcao = json['data_opcao']?.toString();
    historico = json['historico'] is Map
        ? SimplesHistorico.fromJson(
            Map<String, dynamic>.from(json['historico'] as Map),
          )
        : null;
  }

  Map<String, dynamic> toJson() => {
    'optante': optante,
    if (dataOpcao != null) 'data_opcao': dataOpcao,
    if (historico != null) 'historico': historico!.toJson(),
  };
}

class SimplesHistorico {
  SimplesHistorico({required this.periodosAnteriores});

  late final List<SimplesPeriodo> periodosAnteriores;

  SimplesHistorico.fromJson(Map<String, dynamic> json) {
    periodosAnteriores = _list(
      json['periodos_anteriores'],
      SimplesPeriodo.fromJson,
    );
  }

  Map<String, dynamic> toJson() => {
    'periodos_anteriores': periodosAnteriores.map((e) => e.toJson()).toList(),
  };
}

class SimplesPeriodo {
  SimplesPeriodo({
    required this.inicio,
    required this.fim,
    required this.detalhamento,
  });

  late final String inicio;
  late final String fim;
  late final String detalhamento;

  SimplesPeriodo.fromJson(Map<String, dynamic> json) {
    inicio = _str(json['inicio']);
    fim = _str(json['fim']);
    detalhamento = _str(json['detalhamento']);
  }

  Map<String, dynamic> toJson() => {
    'inicio': inicio,
    'fim': fim,
    'detalhamento': detalhamento,
  };
}

class AccountQuota {
  AccountQuota({required this.status, required this.quota});

  late final String status;
  late final QuotaDetails quota;

  AccountQuota.fromJson(Map<String, dynamic> json) {
    status = _str(json['status']);
    quota = QuotaDetails.fromJson(
      Map<String, dynamic>.from(json['quota'] as Map? ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {'status': status, 'quota': quota.toJson()};
}

class QuotaDetails {
  QuotaDetails({
    required this.fromDatabase,
    required this.fromExternal,
    required this.nextRenewalDate,
  });

  late final num fromDatabase;
  late final num fromExternal;
  late final String nextRenewalDate;

  QuotaDetails.fromJson(Map<String, dynamic> json) {
    fromDatabase = json['from_database'] as num? ?? 0;
    fromExternal = json['from_external'] as num? ?? 0;
    nextRenewalDate = _str(json['next_renewal_date']);
  }

  Map<String, dynamic> toJson() => {
    'from_database': fromDatabase,
    'from_external': fromExternal,
    'next_renewal_date': nextRenewalDate,
  };
}

class CallsReport {
  CallsReport({required this.status, required this.calls});

  late final String status;
  late final List<ApiCall> calls;

  CallsReport.fromJson(Map<String, dynamic> json) {
    status = _str(json['status']);
    calls = _list(json['calls'], ApiCall.fromJson);
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'calls': calls.map((e) => e.toJson()).toList(),
  };
}

class ApiCall {
  ApiCall({required this.id, required this.start, this.end});

  late final String id;
  late final String start;
  late final String? end;

  ApiCall.fromJson(Map<String, dynamic> json) {
    id = _str(json['id']);
    start = _str(json['start']);
    end = json['end']?.toString();
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'start': start,
    if (end != null) 'end': end,
  };
}

String _str(Object? value) => value?.toString() ?? '';

List<T> _list<T>(Object? value, T Function(Map<String, dynamic>) fromJson) {
  if (value is! List) return [];
  return value
      .whereType<Map>()
      .map((e) => fromJson(Map<String, dynamic>.from(e)))
      .toList();
}
