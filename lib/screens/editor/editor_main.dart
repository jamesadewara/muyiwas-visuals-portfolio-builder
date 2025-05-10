import 'package:flutter/material.dart';
import 'package:muyiwas_visuals_portfolio_builder/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:muyiwas_visuals_portfolio_builder/providers/portfolio_provider.dart';
import 'package:muyiwas_visuals_portfolio_builder/models/portfolio_model.dart';
import 'package:muyiwas_visuals_portfolio_builder/widgets/common/gradient_button.dart';
import 'hero_editor.dart';
import 'about_editor.dart';
import 'projects_editor.dart';
import 'process_editor.dart';
import 'contact_editor.dart';

class EditorMainScreen extends StatefulWidget {
  const EditorMainScreen({super.key});

  @override
  State<EditorMainScreen> createState() => _EditorMainScreenState();
}

class _EditorMainScreenState extends State<EditorMainScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  late PortfolioModel _portfolio;

  @override
  void initState() {
    super.initState();
    final portfolioProvider = Provider.of<PortfolioProvider>(context, listen: false);
    _portfolio = portfolioProvider.currentPortfolio ?? PortfolioModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: Provider.of<AuthProvider>(context, listen: false).user!.uid,
      name: 'New Portfolio',
      published: false,
      heroSection: HeroSection(
        headline: '',
        body: '',
        profilePictureUrl: '',
      ),
      aboutSection: AboutSection(
        body: '',
        philosophy: '',
        skills: [],
        aboutPictureUrl: '',
      ),
      products: [],
      projects: [],
      processSteps: [],
      contactMethods: [],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    _titleController.text = _portfolio.name;
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _savePortfolio() async {
    if (!_formKey.currentState!.validate()) return;

    final portfolioProvider = Provider.of<PortfolioProvider>(context, listen: false);
    _portfolio = _portfolio.copyWith(
      name: _titleController.text,
      updatedAt: DateTime.now(),
    );

    if (portfolioProvider.currentPortfolio == null) {
      await portfolioProvider.createPortfolio(_portfolio);
    } else {
      await portfolioProvider.updatePortfolio(_portfolio);
    }

    if (mounted) {
      Navigator.pop(context);
    }
  }

  void _navigateToEditor(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    ).then((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final portfolioProvider = Provider.of<PortfolioProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio Editor'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _savePortfolio,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Portfolio Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                _buildSection(
                  title: 'Hero Section',
                  onTap: () => _navigateToEditor(HeroEditorScreen(portfolio: _portfolio)),
                ),
                const SizedBox(height: 16),
                _buildSection(
                  title: 'About Section',
                  onTap: () => _navigateToEditor(AboutEditorScreen(portfolio: _portfolio)),
                ),
                const SizedBox(height: 16),
                _buildSection(
                  title: 'Projects',
                  onTap: () => _navigateToEditor(ProjectsEditorScreen(portfolio: _portfolio)),
                ),
                const SizedBox(height: 16),
                _buildSection(
                  title: 'Process',
                  onTap: () => _navigateToEditor(ProcessEditorScreen(portfolio: _portfolio)),
                ),
                const SizedBox(height: 16),
                _buildSection(
                  title: 'Contact',
                  onTap: () => _navigateToEditor(ContactEditorScreen(portfolio: _portfolio)),
                ),
                const SizedBox(height: 24),
                GradientButton(
                  onPressed: _savePortfolio,
                  child: portfolioProvider.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Save Portfolio'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required VoidCallback onTap}) {
    return Card(
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}