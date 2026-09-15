import 'package:flutter/material.dart';
import 'illustrations.dart';

enum ManualIllustrationType { hero, splash, waste, reward, article, articleTree, articlePlastic, marketplaceBag, marketplaceShoe, marketplacePlant, marketplaceBook, profile, leaves }

class ManualIllustration extends StatelessWidget {
  const ManualIllustration({super.key, required this.type, this.fit = BoxFit.contain});
  final ManualIllustrationType type;
  final BoxFit fit;

  String get asset {
    switch (type) {
      case ManualIllustrationType.hero: return AppIllustrations.heroHome;
      case ManualIllustrationType.splash: return AppIllustrations.earthIllustration;
      case ManualIllustrationType.waste: return AppIllustrations.throwingTrash;
      case ManualIllustrationType.reward: return AppIllustrations.reward;
      case ManualIllustrationType.article: return AppIllustrations.article;
      case ManualIllustrationType.articleTree: return 'assets/illustrations/article_tree.svg';
      case ManualIllustrationType.articlePlastic: return 'assets/illustrations/article_plastic.svg';
      case ManualIllustrationType.marketplaceBag: return 'assets/illustrations/marketplace_bag.svg';
      case ManualIllustrationType.marketplaceShoe: return 'assets/illustrations/marketplace_shoe.svg';
      case ManualIllustrationType.marketplacePlant: return 'assets/illustrations/marketplace_plant.svg';
      case ManualIllustrationType.marketplaceBook: return 'assets/illustrations/marketplace_book.svg';
      case ManualIllustrationType.profile: return AppIllustrations.profile;
      case ManualIllustrationType.leaves: return AppIllustrations.leafElement;
    }
  }

  @override
  Widget build(BuildContext context) => SvgIllustration(asset, fit: fit);
}
