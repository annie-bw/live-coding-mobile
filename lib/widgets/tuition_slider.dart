import 'package:flutter/material.dart';

class TuitionSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const TuitionSlider({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Tuition', style: TextStyle(fontWeight: FontWeight.bold)),
        Slider(
          value: value,
          min: 0,
          max: 100,
          divisions: 10,
          label: value.round().toString(),
          activeColor: Colors.lightGreen,
          thumbColor: Colors.grey[700],
          onChanged: onChanged,
        ),
      ],
    );
  }
}
