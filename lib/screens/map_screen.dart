part of '../ui.dart';

class _MapScreen extends StatelessWidget {
  const _MapScreen({required this.geofenceOn, required this.notificationsOn, required this.onToggleGeofence, required this.onToggleNotifications});
  final bool geofenceOn;
  final bool notificationsOn;
  final VoidCallback onToggleGeofence;
  final VoidCallback onToggleNotifications;

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.only(bottom: 100), children: [
      const _StatusBar(),
      const Padding(
        padding: EdgeInsets.fromLTRB(20, 8, 20, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Location', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)), Text('Chatswood NSW 2067', style: TextStyle(color: AppColors.text2))]),
      ),
      Container(
        height: 200,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: AppColors.bg3, borderRadius: BorderRadius.circular(18), border: Border.all(color: Colors.white.withOpacity(.06))),
        child: const Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Text('●', style: TextStyle(fontSize: 38, color: AppColors.accent)), SizedBox(height: 8), Text('Chatswood, NSW', style: TextStyle(color: AppColors.text2))])),
      ),
      _ToggleRow(icon: '📍', title: 'Geofencing', sub: 'Auto-detect stores', value: geofenceOn, onTap: onToggleGeofence, color: AppColors.green),
      _ToggleRow(icon: '🔔', title: 'Smart Notifications', sub: 'Alert on store entry only', value: notificationsOn, onTap: onToggleNotifications, color: AppColors.accent2),
      const Padding(padding: EdgeInsets.fromLTRB(16, 16, 16, 12), child: Text('Supported Stores Nearby', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
      const _NearbyRow(icon: '🛒', title: 'Woolworths Chatswood', sub: 'Active geofence · 4 cards compatible', dist: '0m', color: AppColors.green),
      const _NearbyRow(icon: '🏪', title: 'Coles', sub: 'Active geofence · 2 cards compatible', dist: '210m', color: AppColors.red),
      const _NearbyRow(icon: '⛽', title: 'Caltex', sub: 'Active geofence · 1 card compatible', dist: '400m', color: AppColors.amber),
      const _NearbyRow(icon: '💊', title: 'Chemist Warehouse', sub: 'Active geofence · 1 card compatible', dist: '600m', color: AppColors.accent2),
    ]);
  }
}
