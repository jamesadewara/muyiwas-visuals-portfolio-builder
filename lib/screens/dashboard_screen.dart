import 'package:flutter/material.dart';
import 'package:muyiwas_visuals_portfolio_builder/screens/portfolio_share.dart';
import 'package:provider/provider.dart';
import 'package:muyiwas_visuals_portfolio_builder/providers/auth_provider.dart';
import 'package:muyiwas_visuals_portfolio_builder/providers/portfolio_provider.dart';
import 'package:muyiwas_visuals_portfolio_builder/models/portfolio_model.dart';
import 'package:muyiwas_visuals_portfolio_builder/widgets/portfolio/portfolio_card.dart';
import 'package:muyiwas_visuals_portfolio_builder/config/routes.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final portfolioProvider = Provider.of<PortfolioProvider>(context, listen: false);
    
    if (authProvider.user != null) {
      await portfolioProvider.loadUserPortfolios(authProvider.user!.uid);
    }
  }

  void _navigateToEditor({PortfolioModel? portfolio}) {
    if (portfolio != null) {
      Provider.of<PortfolioProvider>(context, listen: false)
          .loadPortfolio(portfolio.id);
    } else {
      Provider.of<PortfolioProvider>(context, listen: false)
          .clearCurrentPortfolio();
    }
    Navigator.pushNamed(context, AppRoutes.editor);
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final portfolioProvider = Provider.of<PortfolioProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolios'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => authProvider.logout(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToEditor(),
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: _loadData,
        child: _buildBody(portfolioProvider),
      ),
    );
  }

  Widget _buildBody(PortfolioProvider portfolioProvider) {
    if (portfolioProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (portfolioProvider.errorMessage != null) {
      return Center(child: Text(portfolioProvider.errorMessage!));
    }

    if (portfolioProvider.portfolios.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('No portfolios yet'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _navigateToEditor(),
              child: const Text('Create Your First Portfolio'),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: portfolioProvider.portfolios.length,
      itemBuilder: (context, index) {
        final portfolio = portfolioProvider.portfolios[index];
        return PortfolioCard(
          portfolio: portfolio,
          onTap: () => _navigateToEditor(portfolio: portfolio),
          onDelete: () => _confirmDelete(portfolio),
          onShare: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PortfolioShareScreen(portfolio: portfolio),
    ),
  );
},
        );
      },
    );
  }

  Future<void> _confirmDelete(PortfolioModel portfolio) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Portfolio'),
        content: Text('Are you sure you want to delete "${portfolio.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await Provider.of<PortfolioProvider>(context, listen: false)
          .deletePortfolio(portfolio.id);
    }
  }
}