import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  // String dropdownValue = 'Choose your size';
  String dropdownValue = 'Four';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
          // value: dropdownValue,
          // icon: Icon(Icons.arrow_drop_down_outlined),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          style: TextStyle(color: Colors.grey),
          items: const [DropdownMenuItem(value: 'one', child: Text('one'))]),
    );
  }
}
