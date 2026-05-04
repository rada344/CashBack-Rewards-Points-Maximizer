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
          Text('Welcome, $firstName 👋', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
          const SizedBox(height: 2),
          const Text('Your wallet is ready', style: TextStyle(color: AppColors.text2)),
          const SizedBox(height: 12),
          const _Pill(icon: '●', text: 'Woolworths Chatswood detected', color: Color.fromARGB(255, 7, 112, 108)255, 122, 186, 146)255, 4, 24, 12)),
        ]),
      ),
      Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: const LinearGradient(colors: [Color(0xFF1A1A2E), Color(0xFF16213E)]),
          border: Border.all(color: AppColors.accent.withOpacity(.3)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
          _Pill(icon: '⚡', text: 'Best Card Now', color: AppColors.accent2),
          SizedBox(height: 14),
          Text.rich(TextSpan(text: "You're at ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700), children: [TextSpan(text: 'Woolworths', style: TextStyle(color: AppColors.accent2))])),
          SizedBox(height: 4),
          Text('Based on your cards, we recommend using:', style: TextStyle(color: AppColors.text2, fontSize: 13)),
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
