import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/models/portfolio.dart';
import '../../../../core/services/portfolio_service.dart';
import '../widgets/editor_panel.dart';
import '../widgets/preview_panel.dart';

class EditorScreen extends StatefulWidget {
  final PortfolioData portfolio;

  const EditorScreen({super.key, required this.portfolio});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  late PortfolioData _currentPortfolio;
  final _portfolioService = PortfolioService();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _currentPortfolio = widget.portfolio;
  }

  Future<void> _savePortfolio() async {
    setState(() => _isSaving = true);
    try {
      await _portfolioService.updatePortfolio(_currentPortfolio);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Portfolio saved successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save portfolio: $e')),
      );
    } finally {
      setState(() => _isSaving = false);
    }
  }

  void _updateHeroSection(HeroSection heroSection) {
    setState(() {
      _currentPortfolio = _currentPortfolio.copyWith(
        heroSection: heroSection,
        updatedAt: DateTime.now(),
      );
    });
  }

  void _updateAboutSection(AboutSection aboutSection) {
    setState(() {
      _currentPortfolio = _currentPortfolio.copyWith(
        aboutSection: aboutSection,
        updatedAt: DateTime.now(),
      );
    });
  }

  void _updateProjects(List<Project> projects) {
    setState(() {
      _currentPortfolio = _currentPortfolio.copyWith(
        projects: projects,
        updatedAt: DateTime.now(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_currentPortfolio.name),
          actions: [
            IconButton(
              icon: const Icon(Icons.visibility),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PreviewScreen(portfolio: _currentPortfolio),
                  ),
                );
              },
            ),
            IconButton(
              icon: _isSaving 
                  ? const CircularProgressIndicator()
                  : const Icon(Icons.save),
              onPressed: _isSaving ? null : _savePortfolio,
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.edit), text: 'Edit'),
              Tab(icon: Icon(Icons.preview), text: 'Preview'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            EditorPanel(
              portfolio: _currentPortfolio,
              onHeroSectionChanged: _updateHeroSection,
              onAboutSectionChanged: _updateAboutSection,
              onProjectsChanged: _updateProjects,
            ),
            PreviewPanel(portfolio: _currentPortfolio),
          ],
        ),
      ),
    );
  }
}