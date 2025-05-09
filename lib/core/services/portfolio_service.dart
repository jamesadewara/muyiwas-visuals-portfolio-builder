import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/portfolio.dart';

class PortfolioService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<PortfolioData>> getUserPortfolios(String userId) async {
    final snapshot = await _firestore
        .collection('portfolios')
        .where('userId', isEqualTo: userId)
        .get();
    
    return snapshot.docs.map((doc) => PortfolioData.fromFirestore(doc)).toList();
  }

  Future<String> createPortfolio(String userId, PortfolioData portfolio) async {
    final docRef = await _firestore
        .collection('portfolios')
        .add(portfolio.toFirestore());
    return docRef.id;
  }

  Future<void> updatePortfolio(PortfolioData portfolio) async {
    await _firestore
        .collection('portfolios')
        .doc(portfolio.id)
        .update(portfolio.toFirestore());
  }

  Future<void> deletePortfolio(String portfolioId) async {
    await _firestore.collection('portfolios').doc(portfolioId).delete();
  }
}