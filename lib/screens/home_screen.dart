part of '../ui.dart';

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({required this.firstName, required this.goMap, required this.goAlerts});
  final String firstName;
  final VoidCallback goMap;
  final VoidCallback goAlerts;

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.only(bottom: 100), children: [
      const _StatusBar(),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // CHANGED: greeting style matches newer version
          Text('Good morning, $firstName 👋', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
          const SizedBox(height: 2),
          const Text('Your smart wallet is ready', style: TextStyle(color: AppColors.text2)),
          const SizedBox(height: 12),
          const _Pill(
            icon: '●',
            text: 'Woolworths Chatswood detected',
            color: Color.fromARGB(255, 122, 186, 146),
          ),
        ]),
      ),
      // CHANGED: recommendation card now shows score breakdown like newer version
      Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: const LinearGradient(colors: [Color(0xFF1A1A2E), Color(0xFF16213E)]),
          border: Border.all(color: AppColors.accent.withOpacity(.3)),
          boxShadow: [BoxShadow(color: AppColors.accent.withOpacity(.08), blurRadius: 24, offset: const Offset(0, 12))],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
          _Pill(icon: '⚡', text: '⚡ LIVE RECOMMENDATION', color: AppColors.accent2),
          SizedBox(height: 14),
          Text.rich(TextSpan(text: "You're at ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800), children: [TextSpan(text: 'Woolworths', style: TextStyle(color: AppColors.accent2))])),
          SizedBox(height: 4),
          Text('Based on your cards, we recommend using:', style: TextStyle(color: AppColors.text2, fontSize: 13)),
          // NEW: estimated value line matching newer version
          SizedBox(height: 4),
          Text('Estimated usable value: \$4.50', style: TextStyle(color: AppColors.text3, fontSize: 12)),
          SizedBox(height: 16),
          _RecommendationChip(),
        ]),
      ),
      _SectionTitle(title: 'Nearby Stores', action: 'View map', onAction: goMap),
      _StoreRow(icon: '🛒', name: 'Woolworths Chatswood', sub: "You're here · 4x points available", badge: 'Active', color: AppColors.green, onTap: goMap),
      const _StoreRow(icon: '⛽', name: 'Caltex', sub: '120m away · Fuel discount card', badge: 'Nearby', color: AppColors.amber),
      const _StoreRow(icon: '🏥', name: 'Chemist Warehouse', sub: '380m away · Health card eligible', badge: 'Nearby', color: AppColors.accent2),
      _SectionTitle(title: 'Recent Activity', action: 'See all', onAction: goAlerts),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: _NotificationCard(icon: '🏪', title: 'Coles — Card switched', sub: 'Flybuys Mastercard used · 3.5x pts', time: 'Yesterday 2:14 PM', color: AppColors.green),
      ),
    ]);
  }
}
