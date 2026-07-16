## 2.0.0

- **Breaking:** rename `ReceitaWS` → `ReceitaWsApi` and `ReceitaWsException` → `ReceitaWsApiException`.
- Align with current ReceitaWS API ([docs](https://developers.receitaws.com.br/)).
- Support public API (optional token) and commercial endpoints: CCC, Simples, quota, calls report.
- Add `fallback` query param, `simples`/`simei` fields, and alphanumeric CNPJ cleanup.
- Throw `ReceitaWsApiException` on API errors instead of raw JSON.
- Update for Dart 3.8+ / Flutter 3.44 (Dart 3.12); bump `http` and `lints`.

## 1.0.0

- Initial version.
