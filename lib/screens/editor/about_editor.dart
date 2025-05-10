import 'package:flutter/material.dart';
import 'package:muyiwas_visuals_portfolio_builder/models/portfolio_model.dart';
import 'package:muyiwas_visuals_portfolio_builder/providers/portfolio_provider.dart';
import 'package:muyiwas_visuals_portfolio_builder/widgets/common/custom_text_field.dart';
import 'package:provider/provider.dart';

class AboutEditorScreen extends StatefulWidget {
  final PortfolioModel portfolio;
  const AboutEditorScreen({super.key, required this.portfolio});

  @override
  State<AboutEditorScreen> createState() => _AboutEditorScreenState();
}

class _AboutEditorScreenState extends State<AboutEditorScreen> {
  late PortfolioModel _portfolio;
  final _aboutController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _portfolio = widget.portfolio;
    _aboutController.text = _portfolio.aboutSection.body ?? '';
  }

  @override
  void dispose() {
    _aboutController.dispose();
    super.dispose();
  }

  void _updatePortfolio() {
    var aboutSection = AboutSection(body: _aboutController.text);
    Provider.of<PortfolioProvider>(context, listen: false)
        .updatePortfolio(_portfolio.copyWith(
        aboutSection: aboutSection
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit About Section'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              controller: _aboutController,
              labelText: 'About You',
              maxLines: 8,
              hintText: 'Tell people about yourself, your design philosophy, and experience...',
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                _updatePortfolio();
                Navigator.pop(context);
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}