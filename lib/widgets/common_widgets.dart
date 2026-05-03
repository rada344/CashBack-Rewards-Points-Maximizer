part of '../ui.dart';

class _Logo extends StatelessWidget {
  const _Logo();
  @override
  Widget build(BuildContext context) => Container(width: 140, height: 140, alignment: Alignment.center, decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), gradient: const LinearGradient(colors: [AppColors.accent, AppColors.accent2]), boxShadow: [BoxShadow(color: AppColors.accent.withOpacity(.35), blurRadius: 32, offset: const Offset(0, 8))]), child: const Text('💳', style: TextStyle(fontSize: 130)));
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) => SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: AppColors.accent, foregroundColor: Colors.white, padding: const EdgeInsets.all(16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))), onPressed: onPressed, child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700))));
}

class _GhostButton extends StatelessWidget {
  const _GhostButton({required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) => SizedBox(width: double.infinity, child: OutlinedButton(style: OutlinedButton.styleFrom(foregroundColor: AppColors.text2, side: BorderSide(color: Colors.white.withOpacity(.1)), padding: const EdgeInsets.all(14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))), onPressed: onPressed, child: Text(text)));
}

class _Input extends StatelessWidget {
  const _Input({required this.label, required this.hint, required this.controller, this.obscureText = false, this.keyboardType});
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _FormLabel(label),
      const SizedBox(height: 8),
      TextField(controller: controller, obscureText: obscureText, keyboardType: keyboardType, decoration: InputDecoration(hintText: hint, hintStyle: const TextStyle(color: AppColors.text3), filled: true, fillColor: AppColors.bg3, border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Colors.white.withOpacity(.08))), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Colors.white.withOpacity(.08))), focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColors.accent))))
    ]),
  );
}

class _FormLabel extends StatelessWidget {
  const _FormLabel(this.text);
  final String text;
  @override
  Widget build(BuildContext context) => Text(text.toUpperCase(), style: const TextStyle(fontSize: 12, color: AppColors.text2, fontWeight: FontWeight.w700, letterSpacing: .8));
}

class _CircleBack extends StatelessWidget {
  const _CircleBack({required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => InkWell(onTap: onTap, borderRadius: BorderRadius.circular(18), child: Container(width: 36, height: 36, alignment: Alignment.center, decoration: const BoxDecoration(color: AppColors.bg3, shape: BoxShape.circle), child: const Text('←', style: TextStyle(fontSize: 18, color: AppColors.text2))));
}

class _StatusBar extends StatelessWidget {
  const _StatusBar();
  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.fromLTRB(20, 14, 20, 8), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(TimeOfDay.now().format(context), style: const TextStyle(fontSize: 12, color: AppColors.text2, fontWeight: FontWeight.w600)), const Text('⚡ 87%', style: TextStyle(fontSize: 12, color: AppColors.text2, fontWeight: FontWeight.w600))]));
}

class _Pill extends StatelessWidget {
  const _Pill({required this.icon, required this.text, required this.color});
  final String icon;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: color.withOpacity(.12), border: Border.all(color: color.withOpacity(.25)), borderRadius: BorderRadius.circular(999)), child: Row(mainAxisSize: MainAxisSize.min, children: [Text(icon, style: TextStyle(fontSize: 11, color: color)), const SizedBox(width: 5), Text(text, style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w700))]));
}

class _RecommendationChip extends StatelessWidget {
  const _RecommendationChip();
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: AppColors.bg4, borderRadius: BorderRadius.circular(14)), child: const Row(children: [CircleAvatar(backgroundColor: Color(0x2222C55E), child: Text('🟢')), SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Everyday Rewards Visa', style: TextStyle(fontWeight: FontWeight.w700)), Text('+4x points · 5% cashback today', style: TextStyle(color: AppColors.green, fontSize: 12))])), Text('›', style: TextStyle(fontSize: 24, color: AppColors.text3))]));
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, required this.action, required this.onAction});
  final String title;
  final String action;
  final VoidCallback onAction;
  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.fromLTRB(16, 8, 16, 12), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)), GestureDetector(onTap: onAction, child: Text(action, style: const TextStyle(fontSize: 13, color: AppColors.accent2)))]));
}

class _StoreRow extends StatelessWidget {
  const _StoreRow({required this.icon, required this.name, required this.sub, required this.badge, required this.color, this.onTap});
  final String icon;
  final String name;
  final String sub;
  final String badge;
  final Color color;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => GestureDetector(onTap: onTap, child: Container(margin: const EdgeInsets.fromLTRB(16, 0, 16, 8), padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: AppColors.bg2, borderRadius: BorderRadius.circular(14)), child: Row(children: [_IconBox(icon: icon, color: color), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(name, style: const TextStyle(fontWeight: FontWeight.w600)), Text(sub, style: const TextStyle(color: AppColors.text2, fontSize: 12))])), Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3), decoration: BoxDecoration(color: color.withOpacity(.15), borderRadius: BorderRadius.circular(999)), child: Text(badge, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w700)))])));
}

class _IconBox extends StatelessWidget {
  const _IconBox({required this.icon, required this.color});
  final String icon;
  final Color color;
  @override
  Widget build(BuildContext context) => Container(width: 40, height: 40, alignment: Alignment.center, decoration: BoxDecoration(color: color.withOpacity(.15), borderRadius: BorderRadius.circular(12)), child: Text(icon, style: const TextStyle(fontSize: 20)));
}

class _WalletCard extends StatelessWidget {
  const _WalletCard({required this.card, required this.onTap});
  final RewardCard card;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => GestureDetector(onTap: onTap, child: Container(margin: const EdgeInsets.fromLTRB(16, 0, 16, 12), padding: const EdgeInsets.all(22), height: 150, decoration: BoxDecoration(gradient: card.gradient, borderRadius: BorderRadius.circular(22)), child: Stack(children: [Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Container(width: 36, height: 26, decoration: BoxDecoration(color: Colors.white.withOpacity(.25), borderRadius: BorderRadius.circular(6))), const Spacer(), Text('•••• •••• •••• ${card.number}', style: const TextStyle(letterSpacing: 2, color: Colors.white70)), const SizedBox(height: 8), Text(card.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700)), Text(card.category, style: const TextStyle(color: Colors.white60, fontSize: 12))]), Positioned(top: 0, right: 0, child: Text(card.icon, style: const TextStyle(fontSize: 28))), Positioned(right: 0, bottom: 0, child: Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4), decoration: BoxDecoration(color: Colors.black.withOpacity(.25), borderRadius: BorderRadius.circular(999)), child: Text(card.benefit, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700))))])));
}

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({required this.icon, required this.title, required this.sub, required this.time, required this.color, this.unread = false});
  final String icon;
  final String title;
  final String sub;
  final String time;
  final Color color;
  final bool unread;
  @override
  Widget build(BuildContext context) => Container(margin: const EdgeInsets.only(bottom: 10), padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: AppColors.bg2, borderRadius: BorderRadius.circular(16)), child: Stack(children: [Row(crossAxisAlignment: CrossAxisAlignment.start, children: [_IconBox(icon: icon, color: color), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w700)), const SizedBox(height: 3), Text(sub, style: const TextStyle(color: AppColors.text2, fontSize: 13, height: 1.4)), const SizedBox(height: 4), Text(time, style: const TextStyle(color: AppColors.text3, fontSize: 11))]))]), if (unread) const Positioned(right: 0, top: 0, child: CircleAvatar(radius: 4, backgroundColor: AppColors.accent))]));
}

class _ToggleRow extends StatelessWidget {
  const _ToggleRow({required this.icon, required this.title, required this.sub, required this.value, required this.onTap, required this.color});
  final String icon;
  final String title;
  final String sub;
  final bool value;
  final VoidCallback onTap;
  final Color color;
  @override
  Widget build(BuildContext context) => Container(margin: const EdgeInsets.fromLTRB(16, 0, 16, 12), padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: AppColors.bg3, borderRadius: BorderRadius.circular(14)), child: Row(children: [_IconBox(icon: icon, color: color), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w600)), Text(sub, style: const TextStyle(color: AppColors.text2, fontSize: 12))])), Switch(value: value, activeColor: AppColors.green, onChanged: (_) => onTap())]));
}

class _NearbyRow extends StatelessWidget {
  const _NearbyRow({required this.icon, required this.title, required this.sub, required this.dist, required this.color});
  final String icon;
  final String title;
  final String sub;
  final String dist;
  final Color color;
  @override
  Widget build(BuildContext context) => Container(margin: const EdgeInsets.fromLTRB(16, 0, 16, 8), padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: AppColors.bg2, borderRadius: BorderRadius.circular(16)), child: Row(children: [_IconBox(icon: icon, color: color), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w600)), Text(sub, style: const TextStyle(color: AppColors.text2, fontSize: 12))])), Text(dist, style: const TextStyle(color: AppColors.text2, fontSize: 12))]));
}

class _StatBox extends StatelessWidget {
  const _StatBox({required this.value, required this.label});
  final String value;
  final String label;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: AppColors.bg2, borderRadius: BorderRadius.circular(14)), child: Column(children: [Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)), Text(label, style: const TextStyle(color: AppColors.text2, fontSize: 12))]));
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection({required this.title, required this.rows});
  final String title;
  final List<Widget> rows;
  @override
  Widget build(BuildContext context) => Padding(padding: const EdgeInsets.fromLTRB(16, 0, 16, 20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Padding(padding: const EdgeInsets.only(left: 4, bottom: 10), child: Text(title.toUpperCase(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.text3, letterSpacing: .8))), ClipRRect(borderRadius: BorderRadius.circular(14), child: Column(children: rows))]));
}

class _SettingsRow extends StatelessWidget {
  const _SettingsRow({required this.icon, required this.label, required this.color, this.onTap});
  final String icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => InkWell(onTap: onTap, child: Container(color: AppColors.bg2, padding: const EdgeInsets.all(14), child: Row(children: [_IconBox(icon: icon, color: color), const SizedBox(width: 12), Expanded(child: Text(label)), const Text('›', style: TextStyle(fontSize: 22, color: AppColors.text3))])));
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value, this.valueColor});
  final String label;
  final String value;
  final Color? valueColor;
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(vertical: 12), decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(.05)))), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label, style: const TextStyle(color: AppColors.text2, fontSize: 13)), Flexible(child: Text(value, textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.w600, color: valueColor)))]));
}

class _ModalHandle extends StatelessWidget {
  const _ModalHandle();
  @override
  Widget build(BuildContext context) => Center(child: Container(width: 36, height: 4, margin: const EdgeInsets.only(bottom: 20), decoration: BoxDecoration(color: AppColors.bg4, borderRadius: BorderRadius.circular(2))));
}
