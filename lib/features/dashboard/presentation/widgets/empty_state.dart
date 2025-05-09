import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final VoidCallback onCreatePressed;

  const EmptyState({super.key, required this.onCreatePressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.folder_open, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          const Text(
            'No portfolios yet',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Create your first portfolio to get started',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: onCreatePressed,
            child: const Text('Create Portfolio'),
          ),
        ],
      ),
    );
  }
}