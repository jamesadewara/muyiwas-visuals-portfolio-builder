class PortfolioData {
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
  final String behancePortfolioUrl;
  final String whatsappContactUrl;

  PortfolioData({
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
    required this.behancePortfolioUrl,
    required this.whatsappContactUrl,
  });

  factory PortfolioData.defaultPortfolio(String userId, String name) {
    return PortfolioData(
      id: '',
      userId: userId,
      name: name,
      published: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      heroSection: HeroSection(
        headline: 'Excellence. Creativity. Confidence.',
        body: "I'm Oluwamuyiwa, a Brand & Advertising Designer dedicated to transforming ideas into compelling visual narratives. Let's collaborate to bring your brand's story to life.",
        profilePictureUrl: 'https://img.freepik.com/free-photo/casual-young-african-man-smiling-isolated-white_93675-128895.jpg',
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
        aboutPictureUrl: 'https://img.freepik.com/free-photo/casual-young-african-man-smiling-isolated-white_93675-128895.jpg',
      ),
      projects: [
        Project(
          id: 1,
          title: "Girls, Guts, Grits and Glowry",
          description: "Girls, Guts, Grit & Glowry celebrates feminine strength and elegance. Chic merch, stunning event aesthetics, and seamless experiences blend boldness with beauty, ambition with artistry.",
          image: "https://mir-s3-cdn-cf.behance.net/projects/max_808_webp/886093220081815.Y3JvcCwxMTUwLDkwMCwxNDUsMA.png",
          tags: ["Branding", "Design"],
          link: "https://www.behance.net/gallery/220081815/Girls-Guts-Grit-Glowry-Grace-Glory-Visuals-"
        ),
        Project(  
            id: 2,
            title: "The Rhino Project",
            description: "The Rhino Project showcases vibrant, user-centric designs to promote Virtual Card features, blending bold visuals with clear functionality.",
            image: "https://mir-s3-cdn-cf.behance.net/projects/max_808_webp/16b031209309221.Y3JvcCwzOTk5LDMxMjgsMCwzOTY.png",
            tags: ["Branding", "Storytelling"],
            link: "https://www.behance.net/gallery/209309221/The-Rhino-Project"

        ),
        Project(
            id: 3,
            title: "Social Media Designs for Gauver App",
            description: "Gauver’s social media designs embrace minimalist creativity; clean lines, bold colors, and intuitive visuals that captivate and communicate effortlessly.",
            image: "https://mir-s3-cdn-cf.behance.net/projects/max_808_webp/2a2489209374431.Y3JvcCwzOTk5LDMxMjgsMCwzOTY.jpg",
            tags: ["Social Media", "UI Design"],
            link: "https://www.behance.net/gallery/207412649/Social-Media-designs-For-Gauver-App"
        ),
        Project(
            id: 4,
            title: "Church Event Designs",
            description: "Church Event Designs radiate warmth and inspiration, combining elegant typography and serene visuals to create inviting, impactful promotions.",
            image: "https://mir-s3-cdn-cf.behance.net/project_modules/disp/b2cdf4192601881.66d7131940a9a.png",
            tags: ["Event", "Print"],
            link: "https://www.behance.net/gallery/192601881/Church-Event-Designs"
        ),
        Project(
            id: 5,
            title: "Social Media Designs for CyberPhorm",
            description: "CyberPhorm’s social media designs fuse futuristic aesthetics with bold messaging, crafted to engage and inspire tech-savvy audiences.",
            image: "https://mir-s3-cdn-cf.behance.net/project_modules/disp/6c44b5192653061.65df20c8a3a10.png",
            tags: ["Social Media", "Digital"],
            link: "https://www.behance.net/gallery/192653061/Social-Media-Designs-For-CyberPhorm"
        ),
        Project(
            id: 6,
            title: "The Red Project - TWAA Designs",
            description: "The Red Project for TWAA delivers striking social media visuals—vibrant, bold, and culturally resonant, designed to spark engagement.",
            image: "https://mir-s3-cdn-cf.behance.net/project_modules/disp/7adebb188817505.65a193d47d5ee.png",
            tags: ["Social Media", "Digital"],
            link: "https://www.behance.net/gallery/188817505/Social-Media-Designs-For-TWAA"
        )
      
      ],
      products: [
        Product(
          id: 1,
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
          description: "We discuss your vision, values, and goals for your brand, social campaign, or event."
        ),
        ProcessStep(
            number: "02",
            title: "Strategy",
            description: "I create a strategy to target your audience, from logos to social posts and event flyers."
        ),
        ProcessStep(
            number: "03",
            title: "Design",
            description: "Stunning visuals; logos, social graphics, event designs, crafted to captivate and connect."
        ),
        ProcessStep(
            number: "04",
            title: "Delivery",
            description: "Get polished assets and guidelines for consistent impact across all platforms."
        )
      ],
      contactMethods: [
        ContactMethod(
          platform: "LinkedIn",
          link: "https://ng.linkedin.com/in/e-a-oluwamuyiwa-8892422a7",
          icon: """
            <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                strokeWidth="2"
                strokeLinecap="round"
                strokeLinejoin="round"
                className="w-6 h-6"
            >
                <path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z" />
                <rect width="4" height="12" x="2" y="9" />
                <circle cx="4" cy="4" r="2" />
            </svg>
            """
        ),
        ContactMethod(
            platform: "Instagram",
            link: "https://www.instagram.com/designs.by.myk/",
            icon: """
            <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                strokeWidth="2"
                strokeLinecap="round"
                strokeLinejoin="round"
                className="w-6 h-6"
            >
                <rect width="20" height="20" x="2" y="2" rx="5" ry="5" />
                <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z" />
                <line x1="17.5" x2="17.51" y1="6.5" y2="6.5" />
            </svg>
        """),
        ContactMethod(
            platform: "WhatsApp",
            link: `wa.me/2348165229470?text=Hello%20Oluwamuyiwa,%20I'm%20[Your%20Name].%20I'd%20love%20to%20schedule%20a%20meeting%20to%20discuss%20my%20brand.%20When%20are%20you%20available?`,
            icon: """
                <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    strokeWidth="2"
                    strokeLinecap="round"
                    strokeLinejoin="round"
                    className="w-6 h-6"
                >
                    <path d="M3 21l1.65-3.8a9 9 0 1 1 3.4 2.9L3 21" />
                    <path d="M9 10a.5.5 0 0 0 1 0V9a.5.5 0 0 0-1 0v1Z" />
                    <path d="M14 10a.5.5 0 0 0 1 0V9a.5.5 0 0 0-1 0v1Z" />
                    <path d="M9.5 13.5c.5 1 1.5 1 2.5 1s2-.5 2.5-1.5" />
                </svg>
            """
        )
      ],
      behancePortfolioUrl: "https://www.behance.net/designermyk",
      whatsappContactUrl: "wa.me/2348165229470?text=Hello%20Oluwamuyiwa,%20I'm%20[Your%20Name].%20I'd%20love%20to%20schedule%20a%20meeting%20to%20discuss%20my%20brand.%20When%20are%20you%20available?",
    );
  }

  factory PortfolioData.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return PortfolioData(
      id: doc.id,
      userId: data['userId'],
      name: data['name'],
      published: data['published'],
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
      heroSection: HeroSection.fromMap(data['heroSection']),
      aboutSection: AboutSection.fromMap(data['aboutSection']),
      projects: (data['projects'] as List).map((e) => Project.fromMap(e)).toList(),
      products: (data['products'] as List).map((e) => Product.fromMap(e)).toList(),
      processSteps: (data['processSteps'] as List).map((e) => ProcessStep.fromMap(e)).toList(),
      contactMethods: (data['contactMethods'] as List).map((e) => ContactMethod.fromMap(e)).toList(),
      behancePortfolioUrl: data['behancePortfolioUrl'],
      whatsappContactUrl: data['whatsappContactUrl'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'name': name,
      'published': published,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'heroSection': heroSection.toMap(),
      'aboutSection': aboutSection.toMap(),
      'projects': projects.map((e) => e.toMap()).toList(),
      'products': products.map((e) => e.toMap()).toList(),
      'processSteps': processSteps.map((e) => e.toMap()).toList(),
      'contactMethods': contactMethods.map((e) => e.toMap()).toList(),
      'behancePortfolioUrl': behancePortfolioUrl,
      'whatsappContactUrl': whatsappContactUrl,
    };
  }

  PortfolioData copyWith({
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
    return PortfolioData(
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

  factory HeroSection.fromMap(Map<String, dynamic> map) {
    return HeroSection(
      headline: map['headline'],
      body: map['body'],
      profilePictureUrl: map['profilePictureUrl'],
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
  final String philosophy;
  final List<String> skills;
  final String aboutPictureUrl;

  AboutSection({
    required this.body,
    required this.philosophy,
    required this.skills,
    required this.aboutPictureUrl,
  });

  factory AboutSection.fromMap(Map<String, dynamic> map) {
    return AboutSection(
      body: map['body'],
      philosophy: map['philosophy'],
      skills: List<String>.from(map['skills']),
      aboutPictureUrl: map['aboutPictureUrl'],
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
  final int id;
  final String title;
  final String description;
  final String image;
  final String[] tags;
  final String link;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.tags,
    required this.link,
  });

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      image: map['image'],
      tags: map['tags'],
      link: map['link'],
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
  final int id;
  final String[] subtitles;
  final String body;
  final String[] images;
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

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      subtitles: map['subtitles'],
      body: map['body'],
      images: map['images'],
      link: map['link'],
      alt: map['alt'],
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

  factory ProcessStep.fromMap(Map<String, dynamic> map) {
    return ProcessStep(
      number: map['number'],
      title: map['title'],
      description: map['description'],
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

  factory ContactMethod.fromMap(Map<String, dynamic> map) {
    return ContactMethod(
      platform: map['platform'],
      link: map['link'],
      icon: map['icon'],
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