import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../app/design_system/design_system.dart';
import '../../widgets/widgets.dart';
import '../../components/manual_illustrations.dart';

class MarketplaceScreen extends StatefulWidget { const MarketplaceScreen({super.key}); @override State<MarketplaceScreen> createState()=>_MarketplaceScreenState(); }
class _MarketplaceScreenState extends State<MarketplaceScreen> {
  int selected=0; static const chips=['Semua','Fashion','Elektronik','Rumah Tangga'];
  static const products=[('Tote Bag Daur Ulang','Rp 35.000',ManualIllustrationType.marketplaceBag),('Sepatu Second Hand','Rp 120.000',ManualIllustrationType.marketplaceShoe),('Pot Tanaman','Rp 15.000',ManualIllustrationType.marketplacePlant),('Buku Bekas','Rp 25.000',ManualIllustrationType.marketplaceBook)];
  @override Widget build(BuildContext context){return Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
    const SizedBox(height: AppSpacing.sm),
    Row(children:[const BackButton(),Text('Marketplace',style:AppTextStyles.h4),const Spacer(),IconButton(onPressed:(){},icon:const Icon(LucideIcons.shoppingCart))]),
    AppSearchField(hintText:'Cari barang bekas...',onFilterTap:(){}), const SizedBox(height:8),
    SizedBox(height:34,child:ListView.separated(scrollDirection:Axis.horizontal,itemCount:chips.length,separatorBuilder:(_,_)=>const SizedBox(width:8),itemBuilder:(_,i)=>ChoiceChip(label:Text(chips[i]),selected:i==selected,onSelected:(_)=>setState(()=>selected=i),labelStyle:AppTextStyles.labelMedium.copyWith(color:i==selected?Colors.white:AppColors.textSecondary)))),
    const SizedBox(height:12), Expanded(child:GridView.builder(itemCount:products.length,gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,crossAxisSpacing:10,mainAxisSpacing:12,childAspectRatio:.78),itemBuilder:(_,i){final p=products[i];return Material(color:Colors.white,borderRadius:AppRadius.radiusMd,child:InkWell(onTap:(){},borderRadius:AppRadius.radiusMd,child:Padding(padding:const EdgeInsets.all(8),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Expanded(child:ClipRRect(borderRadius:AppRadius.radiusSm,child:Container(color:AppColors.paleGreen, width:double.infinity, child:ManualIllustration(type:p.$3)))),const SizedBox(height:7),Text(p.$1,style:AppTextStyles.caption.copyWith(color:AppColors.textPrimary,fontWeight:FontWeight.w600)),const SizedBox(height:3),Text(p.$2,style:AppTextStyles.labelMedium.copyWith(color:AppColors.primary))]))));}))
  ]);}
}
