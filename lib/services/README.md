# services/

Data-access and business-logic layer — the only place screens should
reach for data, so the source (mock JSON today, a real backend later)
can change without touching UI code.

Planned services:

- `auth_service.dart` — login, sign up, logout, current-user stream
- `waste_report_service.dart` — submit a waste report, fetch history
- `points_service.dart` — points balance, redemption
- `article_service.dart` — fetch/search articles
- `marketplace_service.dart` — fetch/search listings

For this foundation stage, screens stub their actions directly
(`Future.delayed` + `Navigator`) instead of calling a service — wire
each screen to its real service as that feature is built out.
