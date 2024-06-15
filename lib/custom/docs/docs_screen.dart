import 'package:flutter/material.dart';

class DocsScreen extends StatefulWidget {
  const DocsScreen({super.key});

  @override
  State<DocsScreen> createState() => _DocsScreenState();
}

class _DocsScreenState extends State<DocsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DOCS TEST"),
      ),
      body: const Center(
        child: Row(
          children: [
            Column(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
