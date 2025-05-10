import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:muyiwas_visuals_portfolio_builder/models/portfolio_model.dart';

class PortfolioCard extends StatelessWidget {
  final PortfolioModel portfolio;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final VoidCallback onShare;

  const PortfolioCard({
    super.key,
    required this.portfolio,
    required this.onTap,
    required this.onDelete,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: portfolio.heroSection.profilePictureUrl != null
                      ? Image.network(
                          portfolio.heroSection.profilePictureUrl,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          color: Colors.grey[200],
                          child: const Center(
                            child: Icon(Icons.image, size: 50),
                          ),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    portfolio.heroSection.headline,
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: Text(
                    'Last updated: ${DateFormat.yMd().format(portfolio.updatedAt)}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
              ),
            ),
             Positioned(
    top: 8,
    right: 48,
    child: IconButton(
      icon: const Icon(Icons.share, color: Colors.blue),
      onPressed: onShare,
    ),
  ),
          ],
        ),
      ),
    );
  }
}