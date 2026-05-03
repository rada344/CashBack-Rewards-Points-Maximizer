part of '../ui.dart';

class _CardDetailSheet extends StatelessWidget {
  const _CardDetailSheet({required this.card, required this.onDelete});
  final RewardCard card;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        const _ModalHandle(),
        Text(card.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        Text(card.category, style: const TextStyle(color: AppColors.text2)),
        const SizedBox(height: 18),
        _DetailRow(label: 'Card number', value: '•••• •••• •••• ${card.number}'),
        _DetailRow(label: 'Benefit', value: card.benefit, valueColor: AppColors.green),
        _DetailRow(label: 'Points balance', value: '${card.points} pts'),
        _DetailRow(label: 'Supported stores', value: card.stores.isEmpty ? 'None' : card.stores.join(', ')),
        _DetailRow(label: 'Category', value: card.category),
        const SizedBox(height: 16),
        OutlinedButton(style: OutlinedButton.styleFrom(foregroundColor: AppColors.red, side: BorderSide(color: AppColors.red.withOpacity(.25)), minimumSize: const Size(double.infinity, 48), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))), onPressed: onDelete, child: const Text('Remove Card', style: TextStyle(fontWeight: FontWeight.w700))),
      ]),
    );
  }
}
