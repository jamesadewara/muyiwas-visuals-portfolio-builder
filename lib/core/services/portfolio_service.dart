import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/portfolio.dart';

class PortfolioService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<PortfolioData>> getUserPortfolios(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('portfolios')
          .where('userId', isEqualTo: userId)
          .get();
      
      return snapshot.docs
          .map((doc) => PortfolioData.fromFirestore(doc))
          .toList();
    } catch (e) {
      throw 'Failed to fetch portfolios: ${e.toString()}';
    }
  }

  Future<PortfolioData> createPortfolio(String userId, String name) async {
    try {
      final defaultPortfolio = PortfolioData.defaultPortfolio(userId, name);
      
      final docRef = await _firestore
          .collection('portfolios')
          .add(defaultPortfolio.toFirestore());
      
      return defaultPortfolio.copyWith(id: docRef.id);
    } catch (e) {
      throw 'Failed to create portfolio: ${e.toString()}';
    }
  }

  Future<void> updatePortfolio(PortfolioData portfolio) async {
    try {
      await _firestore
          .collection('portfolios')
          .doc(portfolio.id)
          .update(portfolio.toFirestore());
    } catch (e) {
      throw 'Failed to update portfolio: ${e.toString()}';
    }
  }

  Future<void> deletePortfolio(String portfolioId) async {
    try {
      await _firestore
          .collection('portfolios')
          .doc(portfolioId)
          .delete();
    } catch (e) {
      throw 'Failed to delete portfolio: ${e.toString()}';
    }
  }

  Future<PortfolioData> duplicatePortfolio(
    String userId, 
    PortfolioData original,
    String newName,
  ) async {
    try {
      final newPortfolio = original.copyWith(
        id: '',
        userId: userId,
        name: newName,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      
      final docRef = await _firestore
          .collection('portfolios')
          .add(newPortfolio.toFirestore());
      
      return newPortfolio.copyWith(id: docRef.id);
    } catch (e) {
      throw 'Failed to duplicate portfolio: ${e.toString()}';
    }
  }
}