import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/models/portfolio.dart';
import '../../../../core/services/portfolio_service.dart';
import '../widgets/portfolio_grid.dart';
import '../widgets/empty_state.dart';
import '../widgets/portfolio_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Future<List<PortfolioData>> _portfoliosFuture;
  final PortfolioService _portfolioService = PortfolioService();

  @override
  void initState() {
    super.initState();
    _loadPortfolios();
  }

  void _loadPortfolios() {
    final user = Provider.of<AuthService>(context, listen: false).currentUser;
    if (user != null) {
      _portfoliosFuture = _portfolioService.getUserPortfolios(user.uid);
    }
  }

  Future<void> _createNewPortfolio() async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New Portfolio'),
        content: TextField(
          decoration: const InputDecoration(
            labelText: 'Portfolio Name',
            hintText: 'My Creative Portfolio',
          ),
          onSubmitted: (value) => Navigator.pop(context, value),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final controller = context.findAncestorStateOfType<_TextFieldState>()?.controller;
              Navigator.pop(context, controller?.text);
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );

    if (result != null && result.isNotEmpty) {
      try {
        final user = Provider.of<AuthService>(context, listen: false).currentUser;
        if (user != null) {
          await _portfolioService.createPortfolio(user.uid, result);
          _loadPortfolios();
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create portfolio: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolios'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<PortfolioData>>(
        future: _portfoliosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.data == null || snapshot.data!.isEmpty) {
            return EmptyState(onCreatePressed: _createNewPortfolio);
          }
          return PortfolioGrid(
            portfolios: snapshot.data!,
            onRefresh: _loadPortfolios,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewPortfolio,
        child: const Icon(Icons.add),
      ),
    );
  }
}