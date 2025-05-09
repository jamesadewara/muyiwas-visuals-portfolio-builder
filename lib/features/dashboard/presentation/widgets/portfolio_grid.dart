import 'package:flutter/material.dart';
import '../../../../../core/models/portfolio.dart';

class PortfolioGrid extends StatelessWidget {
  final List<PortfolioData> portfolios;
  final Future<void> Function() onRefresh;

  const PortfolioGrid({
    super.key,
    required this.portfolios,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemCount: portfolios.length,
        itemBuilder: (context, index) {
          final portfolio = portfolios[index];
          return PortfolioCard(portfolio: portfolio);
        },
      ),
    );
  }
}