import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../app/design_system/design_system.dart';
import '../../app/routes.dart';
import '../../widgets/widgets.dart';
import '../../components/manual_illustrations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const items=[(LucideIcons.user,'Data Diri'),(LucideIcons.settings,'Pengaturan'),(LucideIcons.bell,'Notifikasi'),(LucideIcons.circleQuestionMark,'Bantuan & FAQ'),(LucideIcons.info,'Tentang Aplikasi')];
  @override Widget build(BuildContext context){return SingleChildScrollView(padding:const EdgeInsets.symmetric(vertical:AppSpacing.md),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
    Container(height:115,width:double.infinity,decoration:BoxDecoration(color:AppColors.paleGreen,borderRadius:AppRadius.radiusLg),child:Stack(children:[const Positioned(right:0,top:-8,width:130,height:125,child:ManualIllustration(type:ManualIllustrationType.profile)),Padding(padding:const EdgeInsets.all(16),child:Row(children:[const ClipOval(child:SizedBox(height:56,width:56,child:ManualIllustration(type:ManualIllustrationType.profile))),const SizedBox(width:12),Column(crossAxisAlignment:CrossAxisAlignment.start,mainAxisAlignment:MainAxisAlignment.center,children:[Text('Jack L.',style:AppTextStyles.h4),Text('jack@email.com',style:AppTextStyles.bodySmall)])]))])),
    const SizedBox(height:12),
    Container(width:double.infinity,padding:const EdgeInsets.all(14),decoration:BoxDecoration(color:AppColors.primary,borderRadius:AppRadius.radiusLg),child:Row(children:[const CircleAvatar(backgroundColor:Color(0x33555555),child:Icon(LucideIcons.leaf,color:Colors.white,size:18)),const SizedBox(width:10),Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('Total Poin',style:AppTextStyles.caption.copyWith(color:AppColors.lightGreen)),Text('1.250',style:AppTextStyles.h2.copyWith(color:Colors.white))]),const Spacer(),SizedBox(width:72,height:36,child:OutlinedButton(onPressed:(){},style:OutlinedButton.styleFrom(foregroundColor:Colors.white,side:const BorderSide(color:Colors.white54)),child:const Text('Riwayat')))])),
    const SizedBox(height:12),
    Container(decoration:BoxDecoration(color:Colors.white,borderRadius:AppRadius.radiusLg),child:Column(children:[for(final item in items)_MenuRow(icon:item.$1,label:item.$2)])),
    const SizedBox(height:14), Center(child:SecondaryButton(label:'Logout',leadingIcon:LucideIcons.logOut,onPressed:(){Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.login,(_)=>false);})),
  ]));}
}
class _MenuRow extends StatelessWidget{const _MenuRow({required this.icon,required this.label});final IconData icon;final String label;@override Widget build(BuildContext context)=>InkWell(onTap:(){},child:Padding(padding:const EdgeInsets.symmetric(horizontal:14,vertical:13),child:Row(children:[Icon(icon,size:18,color:AppColors.textSecondary),const SizedBox(width:12),Expanded(child:Text(label,style:AppTextStyles.bodyMedium)),const Icon(LucideIcons.chevronRight,size:17,color:AppColors.textSecondary)])));}
