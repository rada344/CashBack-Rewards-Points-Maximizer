part of '../ui.dart';

class _AddCardSheet extends StatefulWidget {
  const _AddCardSheet({required this.onAdd});
  final ValueChanged<RewardCard> onAdd;

  @override
  State<_AddCardSheet> createState() => _AddCardSheetState();
}

class _AddCardSheetState extends State<_AddCardSheet> {
  final name = TextEditingController();
  final number = TextEditingController();
  final benefit = TextEditingController();
  int selectedCategory = 0;
  int selectedColor = 0;
  final categories = ['🛒 Groceries', '⛽ Fuel', '💊 Health', '✈️ Travel', '🍔 Dining', '🛍️ Retail'];
  final gradients = const [
    LinearGradient(colors: [Color(0xFF1A7A4A), Color(0xFF22C55E)]),
    LinearGradient(colors: [Color(0xFF7C3AED), Color(0xFFA78BFA)]),
    LinearGradient(colors: [Color(0xFFB45309), Color(0xFFF59E0B)]),
    LinearGradient(colors: [Color(0xFF1D4ED8), Color(0xFF60A5FA)]),
    LinearGradient(colors: [Color(0xFFBE185D), Color(0xFFF472B6)]),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24, right: 24, top: 20, bottom: MediaQuery.of(context).viewInsets.bottom + 28),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
          const _ModalHandle(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Add Card', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)), IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))]),
          _Input(label: 'Card Name', hint: 'e.g. Everyday Rewards Visa', controller: name),
          _Input(label: 'Card Number (last 4 digits)', hint: '1234', controller: number, keyboardType: TextInputType.number),
          _Input(label: 'Benefit', hint: 'e.g. 4x points, 5% cashback', controller: benefit),
          const _FormLabel('Category'),
          Wrap(spacing: 8, runSpacing: 8, children: [for (int i = 0; i < categories.length; i++) ChoiceChip(label: Text(categories[i]), selected: selectedCategory == i, onSelected: (_) => setState(() => selectedCategory = i), selectedColor: AppColors.accent.withOpacity(.22), backgroundColor: AppColors.bg4, labelStyle: TextStyle(color: selectedCategory == i ? AppColors.accent2 : AppColors.text))]),
          const SizedBox(height: 18),
          const _FormLabel('Card Color'),
          Row(children: [for (int i = 0; i < gradients.length; i++) GestureDetector(onTap: () => setState(() => selectedColor = i), child: Container(width: 34, height: 34, margin: const EdgeInsets.only(right: 10), decoration: BoxDecoration(shape: BoxShape.circle, gradient: gradients[i], border: Border.all(color: selectedColor == i ? Colors.white : Colors.transparent, width: 2))))]),
          const SizedBox(height: 20),
          _PrimaryButton(text: 'Add to Wallet', onPressed: () {
            if (name.text.trim().isEmpty) return;
            widget.onAdd(RewardCard(name: name.text.trim(), number: number.text.trim().padLeft(4, '0').substring(number.text.trim().padLeft(4, '0').length - 4), category: categories[selectedCategory], benefit: benefit.text.trim().isEmpty ? 'Reward points' : benefit.text.trim(), gradient: gradients[selectedColor], icon: '💳', stores: const [], points: 0));
            Navigator.pop(context);
          }),
        ]),
      ),
    );
  }
}
