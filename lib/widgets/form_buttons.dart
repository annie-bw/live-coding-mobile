import 'package:flutter/material.dart';

class FormButtons extends StatelessWidget {
  final bool Function() isFormComplete;
  final VoidCallback onClear;

  const FormButtons({super.key, required this.isFormComplete, required this.onClear});

  void _submit(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isFormComplete()
            ? 'Submitted successful 😆😆😆'
            : 'Please complete all fields'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () => _submit(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreen[100],
            foregroundColor: Colors.black,
            side: const BorderSide(color: Colors.green),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text('Submit'),
        ),
        ElevatedButton(
          onPressed: onClear,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text('Clear'),
        ),
      ],
    );
  }
}
