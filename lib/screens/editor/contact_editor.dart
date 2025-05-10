import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:muyiwas_visuals_portfolio_builder/models/portfolio_model.dart';
import 'package:muyiwas_visuals_portfolio_builder/providers/portfolio_provider.dart';
import 'package:muyiwas_visuals_portfolio_builder/widgets/common/custom_text_field.dart';

class ContactEditorScreen extends StatefulWidget {
  final PortfolioModel portfolio;
  const ContactEditorScreen({super.key, required this.portfolio});

  @override
  State<ContactEditorScreen> createState() => _ContactEditorScreenState();
}

class _ContactEditorScreenState extends State<ContactEditorScreen> {
  late PortfolioModel _portfolio;
  final _behanceController = TextEditingController();
  final _whatsappController = TextEditingController();
  final _linkedInController = TextEditingController();
  final _instagramController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _portfolio = widget.portfolio;
    
    // Initialize controllers with existing values
    final behance = _portfolio.contactMethods.firstWhere(
      (method) => method.platform == 'Behance',
      orElse: () => ContactMethod(platform: 'Behance', link: '', icon: ''),
    );
    final whatsapp = _portfolio.contactMethods.firstWhere(
      (method) => method.platform == 'WhatsApp',
      orElse: () => ContactMethod(platform: 'WhatsApp', link: '', icon: ''),
    );
    final linkedIn = _portfolio.contactMethods.firstWhere(
      (method) => method.platform == 'LinkedIn',
      orElse: () => ContactMethod(platform: 'LinkedIn', link: '', icon: ''),
    );
    final instagram = _portfolio.contactMethods.firstWhere(
      (method) => method.platform == 'Instagram',
      orElse: () => ContactMethod(platform: 'Instagram', link: '', icon: ''),
    );

    _behanceController.text = behance.link;
    _whatsappController.text = whatsapp.link;
    _linkedInController.text = linkedIn.link;
    _instagramController.text = instagram.link;
  }

  @override
  void dispose() {
    _behanceController.dispose();
    _whatsappController.dispose();
    _linkedInController.dispose();
    _instagramController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    // Create updated contact methods list
    final updatedContactMethods = [
      ContactMethod(
        platform: 'Behance',
        link: _behanceController.text.trim(),
        icon: 'behance',
      ),
      ContactMethod(
        platform: 'WhatsApp',
        link: _whatsappController.text.trim(),
        icon: 'whatsapp',
      ),
      ContactMethod(
        platform: 'LinkedIn',
        link: _linkedInController.text.trim(),
        icon: 'linkedin',
      ),
      ContactMethod(
        platform: 'Instagram',
        link: _instagramController.text.trim(),
        icon: 'instagram',
      ),
    ];

    Provider.of<PortfolioProvider>(context, listen: false).updatePortfolio(
      _portfolio.copyWith(
        contactMethods: updatedContactMethods,
        behancePortfolioUrl: _behanceController.text.trim(),
        whatsappContactUrl: _whatsappController.text.trim(),
        updatedAt: DateTime.now(),
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Contact Information'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveChanges,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Portfolio Links',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _behanceController,
              labelText: 'Behance Portfolio URL',
              prefixText: 'behance.net/',
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _whatsappController,
              labelText: 'WhatsApp Contact URL',
              prefixText: 'wa.me/',
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              'Social Media Links',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _linkedInController,
              labelText: 'LinkedIn Profile URL',
              prefixText: 'linkedin.com/in/',
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _instagramController,
              labelText: 'Instagram Profile URL',
              prefixText: 'instagram.com/',
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _saveChanges,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Save Contact Information'),
            ),
          ],
        ),
      ),
    );
  }
}