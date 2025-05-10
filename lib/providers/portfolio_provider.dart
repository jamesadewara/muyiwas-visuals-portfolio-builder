import 'package:flutter/material.dart';
import 'package:muyiwas_visuals_portfolio_builder/models/portfolio_model.dart';
import 'package:muyiwas_visuals_portfolio_builder/services/database_service.dart';

class PortfolioProvider with ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();
  List<PortfolioModel> _portfolios = [];
  PortfolioModel? _currentPortfolio;
  bool _isLoading = false;
  String? _errorMessage;

  List<PortfolioModel> get portfolios => _portfolios;
  PortfolioModel? get currentPortfolio => _currentPortfolio;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Default portfolio data
  PortfolioModel get _defaultPortfolio => PortfolioModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: '',
        name: 'My Portfolio',
        published: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        heroSection: HeroSection(
          headline: "Excellence. Creativity. Confidence.",
          body: "I'm Oluwamuyiwa, a Brand & Advertising Designer dedicated to transforming ideas into compelling visual narratives. Let's collaborate to bring your brand's story to life.",
          profilePictureUrl: "https://img.freepik.com/free-photo/casual-young-african-man-smiling-isolated-white_93675-128895.jpg",
        ),
        aboutSection: AboutSection(
          body: "I'm Oluwamuyiwa, a dedicated Brand & Advertising Designer with a keen eye for detail and a passion for visual storytelling. My mission is to create designs that not only look good but also communicate effectively, helping brands connect with their audience meaningfully.",
          philosophy: "I'm driven by excellence, fueled by creativity, and deliver with confidence. I believe every project is a canvas for crafting visuals that captivate and connect, fusing bold creativity with strategic precision to transform visions into reality with impact and flair.",
          skills: [
            "Brand Strategy",
            "Visual Identity",
            "Social Media Design",
            "Print Design",
            "Advertising",
            "Typography",
            "Color Theory",
            "UI/UX Principles"
          ],
          aboutPictureUrl: "https://img.freepik.com/free-photo/casual-young-african-man-smiling-isolated-white_93675-128895.jpg",
        ),
        projects: [
          Project(
            id: '1',
            title: "Girls, Guts, Grits and Glowry",
            description: "Girls, Guts, Grit & Glowry celebrates feminine strength and elegance. Chic merch, stunning event aesthetics, and seamless experiences blend boldness with beauty, ambition with artistry.",
            image: "https://mir-s3-cdn-cf.behance.net/projects/max_808_webp/886093220081815.Y3JvcCwxMTUwLDkwMCwxNDUsMA.png",
            tags: ["Branding", "Design"],
            link: "https://www.behance.net/gallery/220081815/Girls-Guts-Grit-Glowry-Grace-Glory-Visuals-",
          ),
        ],
        products: [
          Product(
            id: '1',
            subtitles: [
              "Level Up Your Design Game!",
              "Save Time with ready-to-edit PSDs",
              "Learn Pro Techniques from layered, organized files",
              "Get Inspired by bold, versatile designs",
              "Create Stunning Visuals for any project",
            ],
            body: "From vibrant club flyers to elegant church events and dynamic social media graphics.",
            images: [
              "https://mir-s3-cdn-cf.behance.net/projects/max_808_webp/886093220081815.Y3JvcCwxMTUwLDkwMCwxNDUsMA.png",
              "https://drive.google.com/file/d/1H3KXEk8lehLr1MMedGc2Hn6UGUz4Gw3A/view?usp=sharing",
            ],
            link: "https://selar.com/1quk78",
            alt: "Grab the Package Now!",
          ),
        ],
        processSteps: [
          ProcessStep(
            number: "01",
            title: "Discovery",
            description: "We discuss your vision, values, and goals for your brand, social campaign, or event.",
          ),
          ProcessStep(
            number: "02",
            title: "Strategy",
            description: "I create a strategy to target your audience, from logos to social posts and event flyers.",
          ),
        ],
        contactMethods: [
          ContactMethod(
            platform: "LinkedIn",
            link: "https://ng.linkedin.com/in/e-a-oluwamuyiwa-8892422a7",
            icon: "linkedin",
          ),
          ContactMethod(
            platform: "Instagram",
            link: "https://www.instagram.com/designs.by.myk/",
            icon: "instagram",
          ),
        ],
        behancePortfolioUrl: "https://www.behance.net/designermyk",
        whatsappContactUrl: "wa.me/2348165229470?text=Hello%20Oluwamuyiwa,%20I'm%20[Your%20Name].%20I'd%20love%20to%20schedule%20a%20meeting%20to%20discuss%20my%20brand.%20When%20are%20you%20available?",
      );

  Future<void> loadUserPortfolios(String userId) async {
    try {
      _isLoading = true;
      notifyListeners();

      _databaseService.getUserPortfolios(userId).listen((portfolios) {
        _portfolios = portfolios;
        if (_portfolios.isEmpty) {
          // Create default portfolio if user has none
          createPortfolio(_defaultPortfolio.copyWith(userId: userId));
        }
        notifyListeners();
      });
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createPortfolio(PortfolioModel portfolio) async {
    try {
      _isLoading = true;
      notifyListeners();

      // Ensure portfolio has required fields
      final portfolioToCreate = portfolio.id.isEmpty
          ? _defaultPortfolio.copyWith(
              userId: portfolio.userId,
              name: portfolio.name.isNotEmpty ? portfolio.name : 'My Portfolio',
            )
          : portfolio;

      await _databaseService.createPortfolio(portfolioToCreate);
      _portfolios.add(portfolioToCreate);
      _currentPortfolio = portfolioToCreate;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updatePortfolio(PortfolioModel portfolio) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _databaseService.updatePortfolio(portfolio);
      final index = _portfolios.indexWhere((p) => p.id == portfolio.id);
      if (index != -1) {
        _portfolios[index] = portfolio;
      }
      _currentPortfolio = portfolio;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deletePortfolio(String portfolioId) async {
    try {
      _isLoading = true;
      notifyListeners();

      await _databaseService.deletePortfolio(portfolioId);
      _portfolios.removeWhere((p) => p.id == portfolioId);
      if (_currentPortfolio?.id == portfolioId) {
        _currentPortfolio = null;
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadPortfolio(String portfolioId) async {
    try {
      _isLoading = true;
      notifyListeners();

      _currentPortfolio = await _databaseService.getPortfolio(portfolioId);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearCurrentPortfolio() {
    _currentPortfolio = null;
    notifyListeners();
  }
}