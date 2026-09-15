import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../app/design_system/design_system.dart';
import '../../app/routes.dart';
import '../../components/illustrations.dart';
import '../../widgets/widgets.dart';

/// Registration screen — full name, email, phone, password/confirm
/// and a terms checkbox. Submission is mocked (no real auth service
/// yet): on success it goes straight to the main shell, same as
/// [LoginScreen], so the demo flow feels like a real sign-up.
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreedToTerms = false;
  bool _showTermsError = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    FocusManager.instance.primaryFocus?.unfocus();

    final formValid = _formKey.currentState?.validate() ?? false;
    setState(() => _showTermsError = !_agreedToTerms);

    if (!formValid || !_agreedToTerms) return;

    setState(() => _isLoading = true);
    // TODO: wire to an AuthService in lib/services once one exists.
    await Future.delayed(const Duration(milliseconds: 700));
    if (!mounted) return;
    setState(() => _isLoading = false);

    // Mock registration succeeds straight into the app, mirroring
    // LoginScreen's mock navigation — swap for AppRoutes.login if the
    // real flow should ask the user to sign in after registering.
    Navigator.of(context).pushReplacementNamed(AppRoutes.main);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Register'),
      ),
      body: Stack(
        children: [
          const Positioned.fill(child: AuthLeafDecoration()),
          SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.sm),
              Icon(LucideIcons.leaf, color: AppColors.primary, size: 28),
              const SizedBox(height: AppSpacing.md),
              Text('Create Account', style: AppTextStyles.h1),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Join us and start making an impact',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              AppTextField(
                controller: _nameController,
                hintText: 'Full Name',
                prefixIcon: LucideIcons.user,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if ((value ?? '').trim().isEmpty) {
                    return 'Enter your full name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextField(
                controller: _emailController,
                hintText: 'Email',
                prefixIcon: LucideIcons.mail,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  final input = value?.trim() ?? '';
                  if (input.isEmpty) return 'Enter your email';
                  if (!input.contains('@') || !input.contains('.')) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextField(
                controller: _phoneController,
                hintText: 'Phone Number',
                prefixIcon: LucideIcons.phone,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  final input = value?.trim() ?? '';
                  if (input.isEmpty) return 'Enter your phone number';
                  if (input.length < 9) return 'Enter a valid phone number';
                  return null;
                },
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextField(
                controller: _passwordController,
                hintText: 'Password',
                prefixIcon: LucideIcons.lock,
                obscureText: _obscurePassword,
                textInputAction: TextInputAction.next,
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
              const SizedBox(height: AppSpacing.md),
              AppTextField(
                controller: _confirmPasswordController,
                hintText: 'Confirm Password',
                prefixIcon: LucideIcons.lock,
                obscureText: _obscureConfirmPassword,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => _handleRegister(),
                validator: (value) {
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword ? LucideIcons.eyeOff : LucideIcons.eye,
                    size: 20,
                    color: AppColors.textSecondary,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Checkbox(
                      value: _agreedToTerms,
                      activeColor: AppColors.primary,
                      onChanged: (value) {
                        setState(() {
                          _agreedToTerms = value ?? false;
                          if (_agreedToTerms) _showTermsError = false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        'I agree to the Terms & Conditions and Privacy Policy',
                        style: AppTextStyles.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
              if (_showTermsError) ...[
                const SizedBox(height: AppSpacing.xxs),
                Padding(
                  padding: const EdgeInsets.only(left: AppSpacing.xl),
                  child: Text(
                    'Please accept the terms to continue',
                    style: AppTextStyles.caption.copyWith(color: AppColors.error),
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.lg),
              PrimaryButton(
                label: 'Register',
                isLoading: _isLoading,
                onPressed: _handleRegister,
              ),
              const SizedBox(height: AppSpacing.md),
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: AppTextStyles.bodySmall,
                    ),
                    TextButton(
                      onPressed: () {
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        } else {
                          Navigator.of(context).pushReplacementNamed(AppRoutes.login);
                        }
                      },
                      child: const Text('Log In'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
          ),
        ],
      ),
    );
  }
}
