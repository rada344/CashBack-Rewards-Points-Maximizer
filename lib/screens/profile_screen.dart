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
      Column(children: [
        Container(width: 80, height: 80, alignment: Alignment.center, decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), gradient: const LinearGradient(colors: [AppColors.accent, AppColors.accent2])), child: Text(initials, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700))),
        const SizedBox(height: 14),
        Text(profile.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),),
        Text(profile.email, style: const TextStyle(color: AppColors.text2)),
      ]),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(children: [
          Expanded(child: _StatBox(value: '$cardCount', label: 'Saved Cards')),
          const SizedBox(width: 10),
          const Expanded(child: _StatBox(value: '1,240', label: 'Total Points')),
        ]),
      ),
      const SizedBox(height: 20),
      _SettingsSection(title: 'Account', rows: [_SettingsRow(icon: '👤', label: 'Edit Profile', color: AppColors.accent2, onTap: onEdit), const _SettingsRow(icon: '🔑', label: 'Change Password', color: AppColors.amber)]),
      const _SettingsSection(title: 'Preferences', rows: [_SettingsRow(icon: '🔔', label: 'Notification Settings', color: AppColors.green), _SettingsRow(icon: '📍', label: 'Location Permissions', color: AppColors.accent2), _SettingsRow(icon: '🔐', label: 'Privacy & Security', color: AppColors.red)]),
      const _SettingsSection(title: 'Support', rows: [_SettingsRow(icon: '❓', label: 'Help & FAQ', color: AppColors.amber), _SettingsRow(icon: '💬', label: 'Contact Support', color: AppColors.green)]),
      Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: OutlinedButton(style: OutlinedButton.styleFrom(foregroundColor: AppColors.red, side: BorderSide(color: AppColors.red.withOpacity(.25)), padding: const EdgeInsets.all(15), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))), onPressed: onLogout, child: const Text('Log Out', style: TextStyle(fontWeight: FontWeight.w700)))),
    ]);
  }
}
