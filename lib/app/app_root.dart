part of '../ui.dart';

class CardSmartApp extends StatelessWidget {
  const CardSmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CardSmart',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.bg,
        fontFamily: 'Roboto',
        colorScheme: const ColorScheme.dark(primary: AppColors.accent),
      ),
      home: const AppRoot(),
    );
  }
}

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  AuthScreen authScreen = AuthScreen.splash;
  AppTab currentTab = AppTab.home;
  bool loggedIn = false;
  bool geofenceOn = true;
  bool notificationsOn = true;

  final loginEmail = TextEditingController();
  final loginPassword = TextEditingController();
  final signupName = TextEditingController();
  final signupEmail = TextEditingController();
  final signupPassword = TextEditingController();

  UserProfile profile = UserProfile(name: 'Alex Johnson', email: 'alex@email.com');

  late final List<RewardCard> cards = [
    RewardCard(
      name: 'Everyday Rewards Visa',
      number: '4412',
      category: 'Groceries · Retail',
      benefit: '4x points · 5% cashback',
      gradient: const LinearGradient(colors: [Color(0xFF1A7A4A), Color(0xFF22C55E)]),
      icon: '🛒',
      stores: ['Woolworths', 'BWS'],
      points: 850,
    ),
    RewardCard(
      name: 'Flybuys Mastercard',
      number: '8821',
      category: 'Groceries · Fuel',
      benefit: '3.5x points',
      gradient: const LinearGradient(colors: [Color(0xFF7C3AED), Color(0xFFA78BFA)]),
      icon: '⭐',
      stores: ['Coles', 'Kmart', 'Target'],
      points: 250,
    ),
    RewardCard(
      name: 'NRMA Fuel Discount',
      number: '2293',
      category: 'Fuel · Transport',
      benefit: '12¢/L discount',
      gradient: const LinearGradient(colors: [Color(0xFFB45309), Color(0xFFF59E0B)]),
      icon: '⛽',
      stores: ['Caltex', 'BP'],
      points: 140,
    ),
  ];

  @override
  void dispose() {
    loginEmail.dispose();
    loginPassword.dispose();
    signupName.dispose();
    signupEmail.dispose();
    signupPassword.dispose();
    super.dispose();
  }

  void enterApp({String? name, String? email}) {
    setState(() {
      if (name != null && name.trim().isNotEmpty) profile.name = name.trim();
      if (email != null && email.trim().isNotEmpty) profile.email = email.trim();
      loggedIn = true;
      currentTab = AppTab.home;
    });
  }

  void logout() {
    setState(() {
      loggedIn = false;
      authScreen = AuthScreen.splash;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: loggedIn ? _buildMainApp() : _buildAuth(),
          ),
        ),
      ),
      bottomNavigationBar: loggedIn ? _BottomNav(currentTab: currentTab, onTap: (tab) => setState(() => currentTab = tab)) : null,
    );
  }

  Widget _buildAuth() {
    switch (authScreen) {
      case AuthScreen.login:
        return _LoginScreen(
          emailController: loginEmail,
          passwordController: loginPassword,
          onBack: () => setState(() => authScreen = AuthScreen.splash),
          onSignup: () => setState(() => authScreen = AuthScreen.signup),
          onLogin: () => enterApp(email: loginEmail.text.isEmpty ? 'alex@email.com' : loginEmail.text),
          onForgot: _showForgotPassword,
        );
      case AuthScreen.signup:
        return _SignupScreen(
          nameController: signupName,
          emailController: signupEmail,
          passwordController: signupPassword,
          onBack: () => setState(() => authScreen = AuthScreen.splash),
          onLogin: () => setState(() => authScreen = AuthScreen.login),
          onSignup: () => enterApp(
            name: signupName.text.isEmpty ? 'Alex Johnson' : signupName.text,
            email: signupEmail.text.isEmpty ? 'alex@email.com' : signupEmail.text,
          ),
        );
      case AuthScreen.splash:
        return _SplashScreen(
          onLogin: () => setState(() => authScreen = AuthScreen.login),
          onSignup: () => setState(() => authScreen = AuthScreen.signup),
        );
    }
  }

  Widget _buildMainApp() {
    switch (currentTab) {
      case AppTab.home:
        return _HomeScreen(firstName: profile.name.split(' ').first, goMap: () => setState(() => currentTab = AppTab.map), goAlerts: () => setState(() => currentTab = AppTab.notifications));
      case AppTab.cards:
        return _CardsScreen(cards: cards, onAdd: _showAddCard, onDetail: _showCardDetail);
      case AppTab.map:
        return _MapScreen(
          geofenceOn: geofenceOn,
          notificationsOn: notificationsOn,
          onToggleGeofence: () => setState(() => geofenceOn = !geofenceOn),
          onToggleNotifications: () => setState(() => notificationsOn = !notificationsOn),
        );
      case AppTab.notifications:
        return const _NotificationsScreen();
      case AppTab.profile:
        return _ProfileScreen(profile: profile, cardCount: cards.length, onEdit: _showEditProfile, onLogout: logout);
    }
  }

  void _showCardDetail(int index) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.bg2,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
      builder: (_) {
        final card = cards[index];
        return _CardDetailSheet(
          card: card,
          onDelete: () {
            setState(() => cards.removeAt(index));
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void _showAddCard() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.bg2,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
      builder: (_) => _AddCardSheet(onAdd: (card) => setState(() => cards.add(card))),
    );
  }

  void _showEditProfile() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.bg2,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
      builder: (_) => _EditProfileSheet(
        profile: profile,
        onSave: (name, email) => setState(() {
          profile.name = name;
          profile.email = email;
        }),
      ),
    );
  }

  void _showForgotPassword() {
    final controller = TextEditingController();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.bg2,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
      builder: (_) => Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 20, bottom: MediaQuery.of(context).viewInsets.bottom + 32),
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          const _ModalHandle(),
          const Text('Reset Password', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          const Text('Enter your email address and we will send you a link to reset your password.', style: TextStyle(color: AppColors.text2)),
          const SizedBox(height: 18),
          _Input(label: 'Email', hint: 'you@email.com', controller: controller),
          _PrimaryButton(text: 'Send Reset Link', onPressed: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Reset link sent! Check your email.')));
          }),
        ]),
      ),
    );
  }
}
