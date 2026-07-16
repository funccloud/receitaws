## 1.1.0

- Align with current ReceitaWS API ([docs](https://developers.receitaws.com.br/)).
- Support public API (optional token) and commercial endpoints: CCC, Simples, quota, calls report.
- Add `fallback` query param, `simples`/`simei` fields, and alphanumeric CNPJ cleanup.
- Throw `ReceitaWsException` on API errors instead of raw JSON.
- Update for Dart 3.8+ / Flutter 3.44 (Dart 3.12); bump `http` and `lints`.

## 1.0.0

- Initial version.
