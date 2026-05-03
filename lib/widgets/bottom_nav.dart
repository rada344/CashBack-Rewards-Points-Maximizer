part of '../ui.dart';

class _BottomNav extends StatelessWidget {
  const _BottomNav({required this.currentTab, required this.onTap});
  final AppTab currentTab;
  final ValueChanged<AppTab> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.bg.withOpacity(.96), border: Border(top: BorderSide(color: Colors.white.withOpacity(.06)))),
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 18),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        _NavItem(tab: AppTab.home, current: currentTab, icon: '🏠', label: 'Home', onTap: onTap),
        _NavItem(tab: AppTab.cards, current: currentTab, icon: '💳', label: 'Wallet', onTap: onTap),
        _NavItem(tab: AppTab.map, current: currentTab, icon: '📍', label: 'Map', onTap: onTap),
        _NavItem(tab: AppTab.notifications, current: currentTab, icon: '🔔', label: 'Alerts', onTap: onTap),
        _NavItem(tab: AppTab.profile, current: currentTab, icon: '👤', label: 'Profile', onTap: onTap),
      ]),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.tab, required this.current, required this.icon, required this.label, required this.onTap});
  final AppTab tab;
  final AppTab current;
  final String icon;
  final String label;
  final ValueChanged<AppTab> onTap;

  @override
  Widget build(BuildContext context) {
    final active = tab == current;
    return InkWell(
      onTap: () => onTap(tab),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(icon, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 10, color: active ? AppColors.accent2 : AppColors.text3, fontWeight: FontWeight.w600)),
          const SizedBox(height: 3),
          if (active) Container(width: 4, height: 4, decoration: const BoxDecoration(color: AppColors.accent, shape: BoxShape.circle)),
        ]),
      ),
    );
  }
}
