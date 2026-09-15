# utils/

Small, stateless helper functions — formatting, validation, extension
methods. No Flutter widget code, no business logic that belongs in
`services/`.

Planned helpers:

- `formatters.dart` — points formatting (`1.250`), relative dates for
  articles ("2 hari lalu"), price formatting for marketplace listings
- `validators.dart` — email/password validation for the auth forms

Empty on purpose for this foundation stage — add a file here the
first time a screen needs one of these instead of duplicating logic
inline.
