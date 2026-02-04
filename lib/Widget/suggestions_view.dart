import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/Chat Cubit.dart';

class SuggestionsView extends StatelessWidget {
  const SuggestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildSection(Icons.menu_open, "Explain", [
              "Explain Quantum physics",
              "How to learn Flutter?",
            ], context),
            _buildSection(Icons.edit, "Write & edit", [
              "Explain Quantum physics",
              "How to learn Flutter?",
            ], context),
            _buildSection(Icons.translate, "Translate", [
              "Explain Quantum physics",
              "How to learn Flutter?",
            ], context),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    IconData icon,
    String title,
    List<String> items,
    BuildContext context,
  ) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.grey),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        ...items.map((text) => _buildSuggestionItem(context, text)).toList(),
      ],
    );
  }

  Widget _buildSuggestionItem(BuildContext context, String text) {
    return GestureDetector(
      onTap: () => context.read<ChatCubit>().sendMessage(text),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xffF7F7F7),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black12),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
