import 'package:flutter/material.dart';

class AppDropdown<T> extends StatelessWidget {
  const AppDropdown({
    super.key,
    this.heading,
    required this.value,
    required this.items,
    required this.onChanged,
    this.underline,
    this.isExpanded = false,
    this.dropdownIcon,
  });

  final String? heading;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?) onChanged;
  final Widget? dropdownIcon;
  final Widget? underline;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      underline: underline,
      value: value,
      icon: dropdownIcon ??
          const Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
      items: items,
      isExpanded: isExpanded,
      onChanged: onChanged,
      borderRadius: BorderRadius.circular(8),
      dropdownColor: Colors.white,
    );
  }
}
