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
    required this.extra,
    required this.billing,
  });
  late final String abertura;
  late final String situacao;
  late final String tipo;
  late final String nome;
  late final String porte;
  late final String naturezaJuridica;
  late final List<AtividadePrincipal> atividadePrincipal;
  late final List<AtividadesSecundarias> atividadesSecundarias;
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
  late final Extra extra;
  late final Billing billing;

  Info.fromJson(Map<String, dynamic> json) {
    abertura = json['abertura'];
    situacao = json['situacao'];
    tipo = json['tipo'];
    nome = json['nome'];
    porte = json['porte'];
    naturezaJuridica = json['natureza_juridica'];
    atividadePrincipal = List.from(json['atividade_principal'])
        .map((e) => AtividadePrincipal.fromJson(e))
        .toList();
    atividadesSecundarias = List.from(json['atividades_secundarias'])
        .map((e) => AtividadesSecundarias.fromJson(e))
        .toList();
    qsa = List.from(json['qsa']).map((e) => Qsa.fromJson(e)).toList();
    logradouro = json['logradouro'];
    numero = json['numero'];
    complemento = json['complemento'];
    municipio = json['municipio'];
    bairro = json['bairro'];
    uf = json['uf'];
    cep = json['cep'];
    email = json['email'];
    telefone = json['telefone'];
    dataSituacao = json['data_situacao'];
    cnpj = json['cnpj'];
    ultimaAtualizacao = json['ultima_atualizacao'];
    status = json['status'];
    fantasia = json['fantasia'];
    efr = json['efr'];
    motivoSituacao = json['motivo_situacao'];
    situacaoEspecial = json['situacao_especial'];
    dataSituacaoEspecial = json['data_situacao_especial'];
    capitalSocial = json['capital_social'];
    extra = Extra.fromJson(json['extra']);
    billing = Billing.fromJson(json['billing']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['abertura'] = abertura;
    data['situacao'] = situacao;
    data['tipo'] = tipo;
    data['nome'] = nome;
    data['porte'] = porte;
    data['natureza_juridica'] = naturezaJuridica;
    data['atividade_principal'] =
        atividadePrincipal.map((e) => e.toJson()).toList();
    data['atividades_secundarias'] =
        atividadesSecundarias.map((e) => e.toJson()).toList();
    data['qsa'] = qsa.map((e) => e.toJson()).toList();
    data['logradouro'] = logradouro;
    data['numero'] = numero;
    data['complemento'] = complemento;
    data['municipio'] = municipio;
    data['bairro'] = bairro;
    data['uf'] = uf;
    data['cep'] = cep;
    data['email'] = email;
    data['telefone'] = telefone;
    data['data_situacao'] = dataSituacao;
    data['cnpj'] = cnpj;
    data['ultima_atualizacao'] = ultimaAtualizacao;
    data['status'] = status;
    data['fantasia'] = fantasia;
    data['efr'] = efr;
    data['motivo_situacao'] = motivoSituacao;
    data['situacao_especial'] = situacaoEspecial;
    data['data_situacao_especial'] = dataSituacaoEspecial;
    data['capital_social'] = capitalSocial;
    data['extra'] = extra.toJson();
    data['billing'] = billing.toJson();
    return data;
  }
}

class AtividadePrincipal {
  AtividadePrincipal({
    required this.code,
    required this.text,
  });
  late final String code;
  late final String text;

  AtividadePrincipal.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['text'] = text;
    return data;
  }
}

class AtividadesSecundarias {
  AtividadesSecundarias({
    required this.code,
    required this.text,
  });
  late final String code;
  late final String text;

  AtividadesSecundarias.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['text'] = text;
    return data;
  }
}

class Qsa {
  Qsa({
    required this.nome,
    required this.qual,
  });
  late final String nome;
  late final String qual;

  Qsa.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    qual = json['qual'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nome'] = nome;
    data['qual'] = qual;
    return data;
  }
}

class Extra {
  Extra();

  Extra.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data;
  }
}

class Billing {
  Billing({
    required this.free,
    required this.database,
  });
  late final bool free;
  late final bool database;

  Billing.fromJson(Map<String, dynamic> json) {
    free = json['free'];
    database = json['database'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['free'] = free;
    data['database'] = database;
    return data;
  }
}
