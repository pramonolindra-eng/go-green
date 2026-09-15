# models/

Plain Dart data classes for the app's domain concepts — no Flutter
widget code here.

Planned models (added alongside the screens that need them, not all
at once):

- `waste_category.dart` — enum + display metadata for Plastik,
  Kertas, Kaca, Logam, Organik, Lainnya
- `waste_report.dart` — a submitted "Buang Sampah" entry: category,
  photo, status (pending/verified/rejected), points awarded
- `reward.dart` — redeemable reward: name, point cost, stock/type
- `article.dart` — environmental article: title, category, cover
  image, body, published date
- `product.dart` — marketplace listing: title, price, category,
  seller, condition, images
- `user_profile.dart` — name, email, avatar, total points

Keep these free of `services/` imports — models describe shape, not
how data is fetched or persisted.
