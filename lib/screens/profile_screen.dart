part of '../ui.dart';

class _ProfileScreen extends StatelessWidget {
  const _ProfileScreen({required this.profile, required this.cardCount, required this.onEdit, required this.onLogout});
  final UserProfile profile;
  final int cardCount;
  final VoidCallback onEdit;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    final initials = profile.name.split(' ').where((e) => e.isNotEmpty).map((e) => e[0]).join().toUpperCase().padRight(2, 'A').substring(0, 2);
    return ListView(padding: const EdgeInsets.only(bottom: 100), children: [
      const _StatusBar(),
      Column(
  children: [
    Container(
      width: 80,
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: const LinearGradient(
          colors: [AppColors.accent, AppColors.accent2],
        ),
      ),
      child: Text(
        initials,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
    const SizedBox(height: 14),
    Text(
      profile.name,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w900,
      ),
    ),
    Text(
      profile.email,
      style: const TextStyle(color: AppColors.text2),
    ),
  ],
),
      const SizedBox(height: 30),
      _ProfileMenuItem(
        icon: Icons.edit,
        title: 'Edit Profile',
        onTap: onEdit,
      ),
      _ProfileMenuItem(
        icon: Icons.credit_card,
        title: 'My Cards',
        subtitle: '$cardCount cards',
        onTap: () {},
      ),
      _ProfileMenuItem(
        icon: Icons.logout,
        title: 'Logout',
        onTap: onLogout,
      ),
    ]);
  }
}

class _ProfileMenuItem extends StatelessWidget {
  const _ProfileMenuItem({
    Key? key,
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.accent),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: subtitle != null ? Text(subtitle!, style: const TextStyle(color: AppColors.text2)) : null,
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      trailing: const Icon(Icons.chevron_right, color: AppColors.text2),
    );
  }
}
