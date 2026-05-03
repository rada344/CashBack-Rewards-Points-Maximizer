part of '../ui.dart';

class _SplashScreen extends StatelessWidget {
  const _SplashScreen({required this.onLogin, required this.onSignup});
  final VoidCallback onLogin;
  final VoidCallback onSignup;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(children: [
        Expanded(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
            _Logo(),
            SizedBox(height: 100),
            Text('CardSmart', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
            SizedBox(height: 8),
            Text('The smartest way to use your reward cards — at the right store, at the right time.', textAlign: TextAlign.center, style: TextStyle(color: AppColors.text2, height: 1.6)),
          ]),
        ),
        _PrimaryButton(text: 'Sign In', onPressed: onLogin),
        const SizedBox(height: 12),
        _GhostButton(text: 'Create Account', onPressed: onSignup),
        const SizedBox(height: 40),
      ]),
    );
  }
}

class _LoginScreen extends StatelessWidget {
  const _LoginScreen({required this.emailController, required this.passwordController, required this.onBack, required this.onSignup, required this.onLogin, required this.onForgot});
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onBack;
  final VoidCallback onSignup;
  final VoidCallback onLogin;
  final VoidCallback onForgot;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 44),
        Row(children: [_CircleBack(onTap: onBack), const SizedBox(width: 12), const Text('Welcome back', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700))]),
        const SizedBox(height: 32),
        _Input(label: 'Email', hint: 'you@email.com', controller: emailController, keyboardType: TextInputType.emailAddress),
        _Input(label: 'Password', hint: '••••••••', controller: passwordController, obscureText: true),
        Align(alignment: Alignment.centerRight, child: TextButton(onPressed: onForgot, child: const Text('Forgot password?', style: TextStyle(color: AppColors.accent2)))),
        _PrimaryButton(text: 'Sign In', onPressed: onLogin),
        Center(child: TextButton(onPressed: onSignup, child: const Text('Don\'t have an account? Sign up', style: TextStyle(color: AppColors.accent2)))),
      ]),
    );
  }
}

class _SignupScreen extends StatelessWidget {
  const _SignupScreen({required this.nameController, required this.emailController, required this.passwordController, required this.onBack, required this.onLogin, required this.onSignup});
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onBack;
  final VoidCallback onLogin;
  final VoidCallback onSignup;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 44),
        Row(children: [_CircleBack(onTap: onBack), const SizedBox(width: 12), const Text('Create account', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700))]),
        const SizedBox(height: 32),
        _Input(label: 'Full Name', hint: 'Alex Johnson', controller: nameController),
        _Input(label: 'Email', hint: 'you@email.com', controller: emailController, keyboardType: TextInputType.emailAddress),
        _Input(label: 'Password', hint: 'Create a strong password', controller: passwordController, obscureText: true),
        const SizedBox(height: 8),
        _PrimaryButton(text: 'Create Account', onPressed: onSignup),
        Center(child: TextButton(onPressed: onLogin, child: const Text('Already have an account? Sign in', style: TextStyle(color: AppColors.accent2)))),
      ]),
    );
  }
}
