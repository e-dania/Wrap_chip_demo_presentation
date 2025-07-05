import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wrap & Chip Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wrap and Chip Widget Demo'),
          backgroundColor: Colors.teal,
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: WrapChipExample(),
        ),
      ),
    );
  }
}

class WrapChipExample extends StatefulWidget {
  const WrapChipExample({super.key});

  @override
  State<WrapChipExample> createState() => _WrapChipExampleState();
}

class _WrapChipExampleState extends State<WrapChipExample> {
  final List<String> techStack = [
    'Flutter',
    'Dart',
    'Firebase',
    'Figma',
    'Git',
    'REST API',
    'UI/UX',
    'Python',
    'TensorFlow'
  ];

  final List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '💡 Wrap with Chips:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10.0,
          runSpacing: 12.0,
          alignment: WrapAlignment.start,
          children: techStack.map((tech) {
            final isSelected = selected.contains(tech);
            return ChoiceChip(
              label: Text(tech),
              selected: isSelected,
              selectedColor: Colors.teal[200],
              backgroundColor: Colors.grey[200],
              onSelected: (bool selectedState) {
                setState(() {
                  if (selectedState) {
                    selected.add(tech);
                  } else {
                    selected.remove(tech);
                  }
                });
              },
              avatar: isSelected
                  ? const Icon(Icons.check_circle, color: Colors.white, size: 18)
                  : const Icon(Icons.circle_outlined, size: 18),
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 30),
        const Text(
          '✅ Selected:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Wrap(
          spacing: 8,
          children: selected
              .map((item) => Chip(
                    label: Text(item),
                    deleteIcon: const Icon(Icons.close),
                    onDeleted: () {
                      setState(() {
                        selected.remove(item);
                      });
                    },
                    backgroundColor: Colors.teal[300],
                    labelStyle: const TextStyle(color: Colors.white),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
