class PortfolioModel {
  final String id;
  final String userId;
  final String name;
  final bool published;
  final DateTime createdAt;
  final DateTime updatedAt;
  final HeroSection heroSection;
  final AboutSection aboutSection;
  final List<Project> projects;
  final List<Product> products;
  final List<ProcessStep> processSteps;
  final List<ContactMethod> contactMethods;
  final String? behancePortfolioUrl;
  final String? whatsappContactUrl;

  PortfolioModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.published,
    required this.createdAt,
    required this.updatedAt,
    required this.heroSection,
    required this.aboutSection,
    required this.projects,
    required this.products,
    required this.processSteps,
    required this.contactMethods,
    this.behancePortfolioUrl,
    this.whatsappContactUrl,
  });

  PortfolioModel copyWith({
    String? id,
    String? userId,
    String? name,
    bool? published,
    DateTime? createdAt,
    DateTime? updatedAt,
    HeroSection? heroSection,
    AboutSection? aboutSection,
    List<Project>? projects,
    List<Product>? products,
    List<ProcessStep>? processSteps,
    List<ContactMethod>? contactMethods,
    String? behancePortfolioUrl,
    String? whatsappContactUrl,
  }) {
    return PortfolioModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      published: published ?? this.published,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      heroSection: heroSection ?? this.heroSection,
      aboutSection: aboutSection ?? this.aboutSection,
      projects: projects ?? this.projects,
      products: products ?? this.products,
      processSteps: processSteps ?? this.processSteps,
      contactMethods: contactMethods ?? this.contactMethods,
      behancePortfolioUrl: behancePortfolioUrl ?? this.behancePortfolioUrl,
      whatsappContactUrl: whatsappContactUrl ?? this.whatsappContactUrl,
    );
  }

  factory PortfolioModel.fromMap(Map<String, dynamic> data) {
    return PortfolioModel(
      id: data['id'] ?? '',
      userId: data['userId'] ?? '',
      name: data['name'] ?? '',
      published: data['published'] ?? false,
      createdAt: data['createdAt']?.toDate() ?? DateTime.now(),
      updatedAt: data['updatedAt']?.toDate() ?? DateTime.now(),
      heroSection: HeroSection.fromMap(data['heroSection'] ?? {}),
      aboutSection: AboutSection.fromMap(data['aboutSection'] ?? {}),
      projects: List<Project>.from(
          data['projects']?.map((x) => Project.fromMap(x)) ?? []),
      products: List<Product>.from(
          data['products']?.map((x) => Product.fromMap(x)) ?? []),
      processSteps: List<ProcessStep>.from(
          data['processSteps']?.map((x) => ProcessStep.fromMap(x)) ?? []),
      contactMethods: List<ContactMethod>.from(
          data['contactMethods']?.map((x) => ContactMethod.fromMap(x)) ?? []),
      behancePortfolioUrl: data['behancePortfolioUrl'],
      whatsappContactUrl: data['whatsappContactUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'published': published,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'heroSection': heroSection.toMap(),
      'aboutSection': aboutSection.toMap(),
      'projects': projects.map((x) => x.toMap()).toList(),
      'products': products.map((x) => x.toMap()).toList(),
      'processSteps': processSteps.map((x) => x.toMap()).toList(),
      'contactMethods': contactMethods.map((x) => x.toMap()).toList(),
      'behancePortfolioUrl': behancePortfolioUrl,
      'whatsappContactUrl': whatsappContactUrl,
    };
  }
}

class HeroSection {
  final String headline;
  final String body;
  final String profilePictureUrl;

  HeroSection({
    required this.headline,
    required this.body,
    required this.profilePictureUrl,
  });

  HeroSection copyWith({
    String? headline,
    String? body,
    String? profilePictureUrl,
  }) {
    return HeroSection(
      headline: headline ?? this.headline,
      body: body ?? this.body,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
    );
  }

  factory HeroSection.fromMap(Map<String, dynamic> data) {
    return HeroSection(
      headline: data['headline'] ?? '',
      body: data['body'] ?? '',
      profilePictureUrl: data['profilePictureUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'headline': headline,
      'body': body,
      'profilePictureUrl': profilePictureUrl,
    };
  }
}

class AboutSection {
  final String body;
  final String? philosophy;
  final List<String>? skills;
  final String? aboutPictureUrl;

  AboutSection(
      {required this.body, this.philosophy, this.skills, this.aboutPictureUrl});

  AboutSection copyWith({
    String? body,
    String? philosophy,
    List<String>? skills,
    String? aboutPictureUrl,
  }) {
    return AboutSection(
      body: body ?? this.body,
      philosophy: philosophy ?? this.philosophy,
      skills: skills ?? this.skills,
      aboutPictureUrl: aboutPictureUrl ?? this.aboutPictureUrl,
    );
  }

  factory AboutSection.fromMap(Map<String, dynamic> data) {
    return AboutSection(
      body: data['body'] ?? '',
      philosophy: data['philosophy'] ?? '',
      skills: List<String>.from(data['skills'] ?? []),
      aboutPictureUrl: data['aboutPictureUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'body': body,
      'philosophy': philosophy,
      'skills': skills,
      'aboutPictureUrl': aboutPictureUrl,
    };
  }
}

class Project {
  final String id;
  final String title;
  final String description;
  final String image;
  final List<String> tags;
  final String link;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.tags,
    required this.link,
  });

  Project copyWith({
    String? id,
    String? title,
    String? description,
    String? image,
    List<String>? tags,
    String? link,
  }) {
    return Project(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      tags: tags ?? this.tags,
      link: link ?? this.link,
    );
  }

  factory Project.fromMap(Map<String, dynamic> data) {
    return Project(
      id: data['id']?.toString() ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      image: data['image'] ?? '',
      tags: List<String>.from(data['tags'] ?? []),
      link: data['link'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'tags': tags,
      'link': link,
    };
  }
}

class Product {
  final String id;
  final List<String> subtitles;
  final String body;
  final List<String> images;
  final String link;
  final String alt;

  Product({
    required this.id,
    required this.subtitles,
    required this.body,
    required this.images,
    required this.link,
    required this.alt,
  });

  Product copyWith({
    String? id,
    List<String>? subtitles,
    String? body,
    List<String>? images,
    String? link,
    String? alt,
  }) {
    return Product(
      id: id ?? this.id,
      subtitles: subtitles ?? this.subtitles,
      body: body ?? this.body,
      images: images ?? this.images,
      link: link ?? this.link,
      alt: alt ?? this.alt,
    );
  }

  factory Product.fromMap(Map<String, dynamic> data) {
    return Product(
      id: data['id']?.toString() ?? '',
      subtitles: List<String>.from(data['subtitles'] ?? []),
      body: data['body'] ?? '',
      images: List<String>.from(data['images'] ?? []),
      link: data['link'] ?? '',
      alt: data['alt'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subtitles': subtitles,
      'body': body,
      'images': images,
      'link': link,
      'alt': alt,
    };
  }
}

class ProcessStep {
  final String number;
  final String title;
  final String description;

  ProcessStep({
    required this.number,
    required this.title,
    required this.description,
  });

  ProcessStep copyWith({
    String? number,
    String? title,
    String? description,
  }) {
    return ProcessStep(
      number: number ?? this.number,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  factory ProcessStep.fromMap(Map<String, dynamic> data) {
    return ProcessStep(
      number: data['number']?.toString() ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'title': title,
      'description': description,
    };
  }
}

class ContactMethod {
  final String platform;
  final String link;
  final String icon;

  ContactMethod({
    required this.platform,
    required this.link,
    required this.icon,
  });

  ContactMethod copyWith({
    String? platform,
    String? link,
    String? icon,
  }) {
    return ContactMethod(
      platform: platform ?? this.platform,
      link: link ?? this.link,
      icon: icon ?? this.icon,
    );
  }

  factory ContactMethod.fromMap(Map<String, dynamic> data) {
    return ContactMethod(
      platform: data['platform'] ?? '',
      link: data['link'] ?? '',
      icon: data['icon'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'platform': platform,
      'link': link,
      'icon': icon,
    };
  }
}
