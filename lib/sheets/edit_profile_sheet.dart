part of '../ui.dart';

class _EditProfileSheet extends StatefulWidget {
  const _EditProfileSheet({required this.profile, required this.onSave});
  final UserProfile profile;
  final void Function(String, String) onSave;

  @override
  State<_EditProfileSheet> createState() => _EditProfileSheetState();
}

class _EditProfileSheetState extends State<_EditProfileSheet> {
  late final TextEditingController name = TextEditingController(text: widget.profile.name);
  late final TextEditingController email = TextEditingController(text: widget.profile.email);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24, right: 24, top: 20, bottom: MediaQuery.of(context).viewInsets.bottom + 32),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        const _ModalHandle(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Edit Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)), IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))]),
        _Input(label: 'Full Name', hint: 'Alex Johnson', controller: name),
        _Input(label: 'Email', hint: 'alex@email.com', controller: email),
        _PrimaryButton(text: 'Save Changes', onPressed: () {
          widget.onSave(name.text.trim().isEmpty ? widget.profile.name : name.text.trim(), email.text.trim().isEmpty ? widget.profile.email : email.text.trim());
          Navigator.pop(context);
        }),
      ]),
    );
  }
}
