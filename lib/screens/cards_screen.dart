part of '../ui.dart';

class _CardsScreen extends StatelessWidget {
  const _CardsScreen({required this.cards, required this.onAdd, required this.onDetail});
  final List<RewardCard> cards;
  final VoidCallback onAdd;
  final ValueChanged<int> onDetail;

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.only(bottom: 100), children: [
      const _StatusBar(),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('My Wallet', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
          const SizedBox(height: 4),
          Text('${cards.length} reward cards', style: const TextStyle(color: AppColors.text2)),
          const SizedBox(height: 10),
   
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.accent.withOpacity(.10),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.accent.withOpacity(.20)),
      ),
      child: const Row(children: [
        Icon(Icons.stars_rounded, color: AppColors.accent2, size: 18),
        SizedBox(width: 8),
        Text('Total points across all cards: ', style: TextStyle(color: AppColors.text2, fontSize: 13)),
        Text('1,240 pts', style: TextStyle(color: AppColors.accent2, fontWeight: FontWeight.w800, fontSize: 13)),
      ]),
    ),
  ]),
),
      for (int i = 0; i < cards.length; i++) _WalletCard(card: cards[i], onTap: () => onDetail(i)),
      GestureDetector(
        onTap: onAdd,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(color: AppColors.bg3, borderRadius: BorderRadius.circular(22), border: Border.all(color: Colors.white.withOpacity(.12), width: 1.5)),
          child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text('＋', style: TextStyle(fontSize: 22, color: AppColors.text3)), SizedBox(width: 12), Text('Add new reward card', style: TextStyle(color: AppColors.text2, fontWeight: FontWeight.w600))]),
        ),
      ),
    ]);
  }
}
