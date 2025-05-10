import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:muyiwas_visuals_portfolio_builder/models/portfolio_model.dart';
import 'package:muyiwas_visuals_portfolio_builder/providers/portfolio_provider.dart';
import 'package:muyiwas_visuals_portfolio_builder/widgets/common/custom_text_field.dart';

class HeroEditorScreen extends StatefulWidget {
  final PortfolioModel portfolio;
  const HeroEditorScreen({super.key, required this.portfolio});

  @override
  State<HeroEditorScreen> createState() => _HeroEditorScreenState();
}

class _HeroEditorScreenState extends State<HeroEditorScreen> {
  late PortfolioModel _portfolio;

  @override
  void initState() {
    super.initState();
    _portfolio = widget.portfolio;
  }

  void _updatePortfolio() {
    Provider.of<PortfolioProvider>(context, listen: false)
        .updatePortfolio(_portfolio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Hero Section'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                image: _portfolio.heroSection.profilePictureUrl != null
                    ? DecorationImage(
                        image: FileImage(
                            File(_portfolio.heroSection.profilePictureUrl!)),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: _portfolio.heroSection.profilePictureUrl == null
                  ? const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add_photo_alternate, size: 48),
                          Text('Add Hero Image'),
                        ],
                      ),
                    )
                  : null,
            ),
            const SizedBox(height: 24),
            CustomTextField(
              labelText: 'Hero Title',
              initialValue: _portfolio.heroSection.headline,
              onChanged: (value) {
                setState(() {
                  var heroSection =
                      _portfolio.heroSection.copyWith(headline: value);
                  _portfolio = _portfolio.copyWith(heroSection: heroSection);
                });
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              labelText: 'Subtitle (Optional)',
              initialValue: _portfolio.heroSection.body,
              onChanged: (value) {
                setState(() {
                  var heroSection =
                      _portfolio.heroSection.copyWith(body: value);
                  _portfolio = _portfolio.copyWith(heroSection: heroSection);
                });
              },
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
