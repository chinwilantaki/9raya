import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Dialog for adding custom family traditions
class AddCustomTraditionDialog extends StatefulWidget {
  final Function(Map<String, dynamic>) onAdd;

  const AddCustomTraditionDialog({super.key, required this.onAdd});

  @override
  State<AddCustomTraditionDialog> createState() =>
      _AddCustomTraditionDialogState();
}

class _AddCustomTraditionDialogState extends State<AddCustomTraditionDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.onAdd({
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'name': _nameController.text,
        'description': _descriptionController.text,
        'isCompleted': false,
      });
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      title: Text('Add Custom Tradition', style: theme.textTheme.titleLarge),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Tradition Name',
                  hintText: 'Enter tradition name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a tradition name';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 2.h),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter tradition description',
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(onPressed: _submitForm, child: const Text('Add')),
      ],
    );
  }
}
