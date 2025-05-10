import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:muyiwas_visuals_portfolio_builder/models/portfolio_model.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Portfolio operations
  Future<void> createPortfolio(PortfolioModel portfolio) async {
    try {
      await _firestore
          .collection('portfolios')
          .doc(portfolio.id)
          .set(portfolio.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatePortfolio(PortfolioModel portfolio) async {
    try {
      await _firestore
          .collection('portfolios')
          .doc(portfolio.id)
          .update(portfolio.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deletePortfolio(String portfolioId) async {
    try {
      await _firestore.collection('portfolios').doc(portfolioId).delete();
    } catch (e) {
      rethrow;
    }
  }

  Stream<List<PortfolioModel>> getUserPortfolios(String userId) {
    return _firestore
        .collection('portfolios')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => PortfolioModel.fromMap(doc.data()))
            .toList());
  }

  Future<PortfolioModel?> getPortfolio(String portfolioId) async {
    try {
      DocumentSnapshot doc = await _firestore
          .collection('portfolios')
          .doc(portfolioId)
          .get();
      if (doc.exists) {
        return PortfolioModel.fromMap(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}