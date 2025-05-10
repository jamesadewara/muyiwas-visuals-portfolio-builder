import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muyiwas_visuals_portfolio_builder/utils/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:muyiwas_visuals_portfolio_builder/models/portfolio_model.dart';

class PortfolioShareScreen extends StatelessWidget {
  final PortfolioModel portfolio;
  const PortfolioShareScreen({super.key, required this.portfolio});
  String get _portfolioUrl => '${AppConstants.portfolioBaseUrl}${portfolio.id}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Portfolio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    QrImageView(
                      data: _portfolioUrl,
                      version: QrVersions.auto,
                      size: 200,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      portfolio.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _portfolioUrl,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.share),
                  label: const Text('Share Link'),
                  onPressed: () {
                    Share.share(
                      'Check out my portfolio: $_portfolioUrl',
                      subject: '${portfolio.name} Portfolio',
                    );
                  },
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  icon: const Icon(Icons.content_copy),
                  label: const Text('Copy Link'),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: _portfolioUrl));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Link copied to clipboard')),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}