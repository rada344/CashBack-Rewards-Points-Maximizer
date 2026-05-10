part of '../ui.dart';

class _NotificationsScreen extends StatelessWidget {
  const _NotificationsScreen();

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.only(bottom: 100), children: [
      const _StatusBar(),
      const Padding(
        padding: EdgeInsets.fromLTRB(20, 8, 20, 16),
        child: Text('Notifications', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
      ),
      // NEW: "New" section label matching newer version's section title style
      const Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
        child: Text('NEW', style: TextStyle(color: AppColors.text3, fontSize: 12, fontWeight: FontWeight.w900, letterSpacing: .8)),
      ),
      const Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: _NotificationCard(icon: '💳', title: 'New store detected', sub: "You've entered Woolworths Chatswood. Using Everyday Rewards Visa for best value.", time: 'Today 9:32 AM', color: AppColors.accent2, unread: true)),
      const Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: _NotificationCard(icon: '✅', title: 'Points balance updated', sub: 'Everyday Rewards: +248 pts from Woolworths purchase', time: 'Today 9:18 AM', color: AppColors.green, unread: true)),
      // NEW: "Earlier" section label
      const Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Text('EARLIER', style: TextStyle(color: AppColors.text3, fontSize: 12, fontWeight: FontWeight.w900, letterSpacing: .8)),
      ),
      const Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: _NotificationCard(icon: '⭐', title: 'Special offer available', sub: 'Flybuys 5x points at Coles this weekend only. Save it for Saturday!', time: 'Yesterday 4:00 PM', color: AppColors.amber)),
      const Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: _NotificationCard(icon: '⛽', title: 'Fuel saving alert', sub: 'Caltex nearby. NRMA card saves 12¢/L today — expires midnight.', time: 'Yesterday 2:45 PM', color: AppColors.red)),
      const Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: _NotificationCard(icon: '🏪', title: 'Coles — Flybuys used', sub: 'Flybuys Mastercard used · 3.5x points earned', time: 'Yesterday 2:14 PM', color: AppColors.accent2)),
    ]);
  }
}
