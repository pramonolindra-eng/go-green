import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/design_system/design_system.dart';
import '../../app/routes.dart';
import '../../components/illustrations.dart';
import '../../components/manual_illustrations.dart';
import '../../widgets/widgets.dart';

/// Login screen — email/password fields, social login row, sign-up
/// link. Submission is stubbed (navigates straight to the main shell)
/// since no auth service exists yet.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _rememberMe = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _isLoading = true);
    // TODO: wire to an AuthService in lib/services once one exists.
    await Future.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    setState(() => _isLoading = false);
    Navigator.of(context).pushReplacementNamed(AppRoutes.main);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: AuthLeafDecoration()),
          SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.xl),
              const SizedBox(height: 34, width: 40, child: SvgIllustration(AppIllustrations.leafElement)),
              const SizedBox(height: AppSpacing.md),
              Text('Welcome Back!', style: AppTextStyles.h1),
              const SizedBox(height: AppSpacing.xs),
              Text(
                "Let's make a better planet together",
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              AppTextField(
                controller: _emailController,
                hintText: 'Email or Phone Number',
                prefixIcon: LucideIcons.mail,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  final input = value?.trim() ?? '';
                  if (input.isEmpty) return 'Enter your email or phone number';
                  if (input.contains('@') && !input.contains('.')) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextField(
                controller: _passwordController,
                hintText: 'Password',
                prefixIcon: LucideIcons.lock,
                obscureText: _obscurePassword,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if ((value ?? '').length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? LucideIcons.eyeOff : LucideIcons.eye,
                    size: 20,
                    color: AppColors.textSecondary,
                  ),
                  onPressed: () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  },
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: Checkbox(
                          value: _rememberMe,
                          activeColor: AppColors.primary,
                          onChanged: (value) {
                            setState(() => _rememberMe = value ?? false);
                          },
                        ),
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      Text('Remember me', style: AppTextStyles.bodySmall),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Forgot password?'),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              PrimaryButton(
                label: 'Log In',
                isLoading: _isLoading,
                onPressed: _handleLogin,
              ),
              const SizedBox(height: AppSpacing.md),
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: AppTextStyles.bodySmall,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.signup);
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                    ),
                    child: Text('or', style: AppTextStyles.caption),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              // NOTE: the reference design shows Google/Apple/Facebook brand
              // marks here. Lucide's outline set intentionally excludes
              // brand logos (trademark reasons), so this uses neutral
              // stand-ins for now — swap in real brand SVGs under
              // assets/icons/ (with each brand's own usage guidelines) when
              // real social auth is wired up.
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIconButton(icon: LucideIcons.mail, onPressed: () {}),
                  const SizedBox(width: AppSpacing.md),
                  AppIconButton(icon: LucideIcons.phone, onPressed: () {}),
                ],
              ),
              const SizedBox(height: 70),
              Align(alignment: Alignment.bottomRight, child: Opacity(opacity: .75, child: const SizedBox(height: 92, width: 210, child: ManualIllustration(type: ManualIllustrationType.leaves)))),
              const SizedBox(height: AppSpacing.md),
            ],
          ),
        ),
          ),
        ],
      ),
    );
  }
}
