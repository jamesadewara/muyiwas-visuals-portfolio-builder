import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:muyiwas_visuals_portfolio_builder/models/portfolio_model.dart';
import 'package:muyiwas_visuals_portfolio_builder/providers/portfolio_provider.dart';
import 'package:muyiwas_visuals_portfolio_builder/widgets/common/custom_text_field.dart';

class ProcessEditorScreen extends StatefulWidget {
  final PortfolioModel portfolio;
  const ProcessEditorScreen({super.key, required this.portfolio});

  @override
  State<ProcessEditorScreen> createState() => _ProcessEditorScreenState();
}

class _ProcessEditorScreenState extends State<ProcessEditorScreen> {
  late PortfolioModel _portfolio;

  @override
  void initState() {
    super.initState();
    _portfolio = widget.portfolio;
  }

  void _addProcessStep() {
    setState(() {
      _portfolio = _portfolio.copyWith(
        processSteps: [
          ..._portfolio.processSteps,
          ProcessStep(
          number: DateTime.now().millisecondsSinceEpoch.toString(),
            title: 'New Step',
            description: 'Describe this step in your process',
          ),
        ],
      );
    });
  }

  void _removeProcessStep(int index) {
    setState(() {
      final updatedSteps = List<ProcessStep>.from(_portfolio.processSteps);
      updatedSteps.removeAt(index);
      _portfolio = _portfolio.copyWith(processSteps: updatedSteps);
    });
  }

  void _updateProcessStep(int index, ProcessStep updatedStep) {
    setState(() {
      final updatedSteps = List<ProcessStep>.from(_portfolio.processSteps);
      updatedSteps[index] = updatedStep;
      _portfolio = _portfolio.copyWith(processSteps: updatedSteps);
    });
  }

  void _saveChanges() {
    Provider.of<PortfolioProvider>(context, listen: false).updatePortfolio(
      _portfolio.copyWith(updatedAt: DateTime.now()),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Process Steps'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveChanges,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProcessStep,
        child: const Icon(Icons.add),
      ),
      body: ReorderableListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _portfolio.processSteps.length,
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (oldIndex < newIndex) newIndex--;
            final step = _portfolio.processSteps.removeAt(oldIndex);
            _portfolio.processSteps.insert(newIndex, step);
           
          });
        },
        itemBuilder: (context, index) {
          final step = _portfolio.processSteps[index];
          return Card(
            key: ValueKey(step.number),
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.drag_handle),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Step ${index + 1}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeProcessStep(index),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    initialValue: step.title,
                    labelText: 'Step Title',
                    onChanged: (value) {
                      _updateProcessStep(
                        index,
                        step.copyWith(title: value),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    initialValue: step.description,
                    labelText: 'Step Description',
                    maxLines: 3,
                    onChanged: (value) {
                      _updateProcessStep(
                        index,
                        step.copyWith(description: value),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}