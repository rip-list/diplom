import 'package:flutter/material.dart';

class NullWidget extends StatefulWidget {
  const NullWidget({super.key});

  @override
  State<NullWidget> createState() => _NullWidgetState();
}

class _NullWidgetState extends State<NullWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
