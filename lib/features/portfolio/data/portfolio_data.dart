import 'package:flutter/material.dart';

/// Skill item representation.
class SkillItem {
  final String name;
  final double proficiency; // 0.0 to 1.0
  final String levelTag;
  final IconData icon;

  const SkillItem({
    required this.name,
    required this.proficiency,
    required this.levelTag,
    required this.icon,
  });
}

/// Education history model.
class EducationModel {
  final String degree;
  final String institution;
  final String status;
  final String description;
  final IconData icon;

  const EducationModel({
    required this.degree,
    required this.institution,
    required this.status,
    required this.description,
    required this.icon,
  });
}

/// Course / Learned Technology model.
class CourseModel {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final List<String> keyConcepts;
  final IconData icon;
  final Color themeColor;
  final String backgroundImageUrl;
  final String logoUrl;

  const CourseModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.keyConcepts,
    required this.icon,
    required this.themeColor,
    required this.backgroundImageUrl,
    required this.logoUrl,
  });
}

/// Book model.
class BookModel {
  final String title;
  final String author;
  final String summary;
  final IconData icon;
  final String coverUrl;
  final Color coverColor;

  const BookModel({
    required this.title,
    required this.author,
    required this.summary,
    required this.icon,
    required this.coverUrl,
    required this.coverColor,
  });
}

/// Project model representing showcase items.
class ProjectModel {
  final String id;
  final String title;
  final String subtitle;
  final String shortDescription;
  final String fullDescription;
  final String category;
  final IconData icon;
  final List<String> techStack;
  final String githubUrl;
  final String liveUrl;
  final List<String> features;
  final List<String> architecturePoints;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.shortDescription,
    required this.fullDescription,
    required this.category,
    required this.icon,
    required this.techStack,
    required this.githubUrl,
    required this.liveUrl,
    required this.features,
    required this.architecturePoints,
  });
}

/// Volunteering and Leadership model.
class VolunteeringModel {
  final String role;
  final String organization;
  final String subtitle;
  final String description;
  final IconData icon;

  const VolunteeringModel({
    required this.role,
    required this.organization,
    required this.subtitle,
    required this.description,
    required this.icon,
  });
}

/// Hobby & Interest model.
class HobbyModel {
  final String title;
  final String description;
  final IconData icon;
  final Color accentColor;

  const HobbyModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.accentColor,
  });
}

/// Static data repository for the Portfolio application.
class PortfolioData {
  PortfolioData._();

  static const String developerName = "Mogtaba Saber";
  static const String title = "Software Engineering Student & Flutter Developer";

  // Bio Paragraphs (Exact requested bio text)
  static const String bioParagraph1 =
      "Software Engineering student & Flutter Developer passionate about building clean, high-performance mobile applications.";

  static const String bioParagraph2 =
      "Dedicated to turning academic theory into practical software solutions using Flutter and Dart. I pay close attention to UI/UX details, maintainable architecture, and writing efficient, readable code—backed by a solid foundation in software engineering principles and object-oriented programming.";

  static const String bioParagraph3 =
      "Currently building hands-on mobile projects (including full-featured e-commerce interfaces) and sharpening my engineering skills. Open to Internship and Junior Flutter Developer opportunities to contribute to real-world products and grow within a collaborative tech team.";

  // Contacts & Links
  static const String email = "mogtaba.mohammed.saber@gmail.com";
  static const String githubUrl = "https://github.com";
  static const String linkedinUrl =
      "https://www.linkedin.com/in/mogtaba-saber-135304383";
  static const String whatsappUrl = "https://wa.me/1234567890";
  static const String facebookUrl = "https://facebook.com";
  static const String cvDownloadUrl = "https://example.com/resume.pdf";

  /// Profile picture path
  static const String profileImageUrl = "assets/images/profile.png";

  // Quick stats
  static const int projectsCompleted = 2;
  static const int technologiesLearned = 5;
  static const int booksReadCount = 4;

  // 1. Education Section Data
  static const List<EducationModel> educationList = [
    EducationModel(
      degree: "B.Sc. in Software Engineering",
      institution: "Nile University",
      status: "Currently Pursuing",
      description:
          "Specializing in Software Engineering principles, Algorithms, Data Structures, Object-Oriented Software Design, and Mobile Application Engineering.",
      icon: Icons.school_rounded,
    ),
    EducationModel(
      degree: "High School Diploma",
      institution: "Abdullah Karim Al-Din Secondary School",
      status: "Graduated",
      description:
          "Completed secondary education with strong focus on Mathematics, Physical Sciences, and Scientific Reasoning.",
      icon: Icons.menu_book_rounded,
    ),
    EducationModel(
      degree: "Primary Education",
      institution: "Al-Tadamon Boys Primary School",
      status: "Graduated",
      description:
          "Foundation in general science, mathematics, and early technology literacy.",
      icon: Icons.history_edu_rounded,
    ),
  ];

  // 2. Courses & Technologies Learned (5 Interactive Hover Cards with Official Brand Logos)
  static const List<CourseModel> courses = [
    CourseModel(
      id: "java",
      title: "Java",
      subtitle: "Core Syntax & OOP Architecture",
      description:
          "Gained a firm grasp on Object-Oriented Programming (OOP), class inheritance, memory management, and structured application logic.",
      keyConcepts: [
        "Core Syntax & Control Flow",
        "OOP Principles (Inheritance, Polymorphism, Encapsulation)",
        "Data Structures & Collections Framework",
        "Multithreading & Exception Handling Basics"
      ],
      icon: Icons.coffee_rounded,
      themeColor: Color(0xFFE76F51),
      backgroundImageUrl:
          "https://images.unsplash.com/photo-1517694712202-14dd9538aa97?q=80&w=800&auto=format&fit=crop",
      logoUrl:
          "https://raw.githubusercontent.com/devicons/devicon/master/icons/java/java-original.png",
    ),
    CourseModel(
      id: "dart",
      title: "Dart",
      subtitle: "Sound Type System & Async Programming",
      description:
          "Mastered Dart language fundamentals, sound null safety, reactive collections, and asynchronous Futures & Streams for reactive apps.",
      keyConcepts: [
        "Sound Type System & Sound Null Safety",
        "Asynchronous Futures, Async/Await & Streams",
        "Functional & Object-Oriented Dart Patterns",
        "Generics, Mixins & Extension Methods"
      ],
      icon: Icons.code_rounded,
      themeColor: Color(0xFF00B4D8),
      backgroundImageUrl:
          "https://images.unsplash.com/photo-1555066931-4365d14bab8c?q=80&w=800&auto=format&fit=crop",
      logoUrl:
          "https://raw.githubusercontent.com/devicons/devicon/master/icons/dart/dart-original.png",
    ),
    CourseModel(
      id: "flutter",
      title: "Flutter",
      subtitle: "Cross-Platform Mobile Engine",
      description:
          "Architected high-performance cross-platform mobile interfaces for iOS and Android with state management, custom painting, and responsive design.",
      keyConcepts: [
        "Stateless & Stateful Widget Composition",
        "Predictable State Management (BLoC & Riverpod)",
        "Responsive & Adaptive UI Layouts",
        "Custom Canvas Graphics & Micro-Animations"
      ],
      icon: Icons.flutter_dash_rounded,
      themeColor: Color(0xFF02569B),
      backgroundImageUrl:
          "https://images.unsplash.com/photo-1512941937669-90a1b58e7e9c?q=80&w=800&auto=format&fit=crop",
      logoUrl:
          "https://raw.githubusercontent.com/devicons/devicon/master/icons/flutter/flutter-original.png",
    ),
    CourseModel(
      id: "firebase",
      title: "Firebase",
      subtitle: "Cloud Backend Services Suite",
      description:
          "Integrated Firebase Cloud backend services for seamless authentication, real-time Firestore database queries, and cloud file storage.",
      keyConcepts: [
        "Firebase Authentication (Email/Password & Social)",
        "Cloud Firestore NoSQL Database Queries",
        "Firebase Cloud Storage & File Uploads",
        "Push Notifications & Analytics Integration"
      ],
      icon: Icons.local_fire_department_rounded,
      themeColor: Color(0xFFFFB703),
      backgroundImageUrl:
          "https://images.unsplash.com/photo-1451187580459-43490279c0fa?q=80&w=800&auto=format&fit=crop",
      logoUrl:
          "https://raw.githubusercontent.com/devicons/devicon/master/icons/firebase/firebase-plain.png",
    ),
    CourseModel(
      id: "hive",
      title: "Hive",
      subtitle: "Ultra-Fast Local NoSQL Storage",
      description:
          "Implemented lightweight local key-value persistence for offline caching, fast query retrieval, and custom object TypeAdapters.",
      keyConcepts: [
        "Local NoSQL Key-Value Box Storage",
        "Custom TypeAdapters for Complex Objects",
        "Fast Offline Data Caching & Persistence",
        "Low Memory Footprint & High Benchmarks"
      ],
      icon: Icons.storage_rounded,
      themeColor: Color(0xFF2A9D8F),
      backgroundImageUrl:
          "https://images.unsplash.com/photo-1558494949-ef010cbdcc31?q=80&w=800&auto=format&fit=crop",
      logoUrl:
          "https://raw.githubusercontent.com/hivedb/hive/master/site/static/img/hive.png",
    ),
  ];

  // 3. Books Read Data (Exact 4 Books with Universal CORS Cover URLs)
  static const List<BookModel> books = [
    BookModel(
      title: "Discovering Computers 2018: Digital Technology, Data, and Devices",
      author:
          "Misty E. Vermaat, Susan L. Sebok, Steven M. Freund, Jennifer T. Campbell, Mark Frydenberg",
      summary:
          "A comprehensive introduction to modern computing concepts, digital technologies, hardware, software, and how devices interact in a connected world.",
      icon: Icons.computer_rounded,
      coverUrl:
          "https://m.media-amazon.com/images/I/81+m4+hOqFL._AC_UF1000,1000_QL80_.jpg",
      coverColor: Color(0xFFE76F51),
    ),
    BookModel(
      title: "Software Engineering (Tenth Edition)",
      author: "Ian Sommerville",
      summary:
          "A foundational guide covering essential software engineering principles, system modeling, architectural design, agile development, and software testing.",
      icon: Icons.school_rounded,
      coverUrl:
          "https://m.media-amazon.com/images/I/71u9s9m1A5L._AC_UF1000,1000_QL80_.jpg",
      coverColor: Color(0xFF02569B),
    ),
    BookModel(
      title: "Clean Code: A Handbook of Agile Software Craftsmanship",
      author: "Robert C. Martin",
      summary:
          "A practical manual on writing readable, maintainable, and efficient code, emphasizing best practices for naming, functions, formatting, and refactoring.",
      icon: Icons.auto_stories_rounded,
      coverUrl:
          "https://m.media-amazon.com/images/I/41xShlnTZTL._AC_UF1000,1000_QL80_.jpg",
      coverColor: Color(0xFF00B4D8),
    ),
    BookModel(
      title: "Code Simplicity: The Science of Software Development",
      author: "Max Kanat-Alexander",
      summary:
          "Explores the fundamental laws of software design, focusing on reducing complexity and making smart architectural decisions that keep codebases easy to maintain over time.",
      icon: Icons.lightbulb_rounded,
      coverUrl:
          "https://m.media-amazon.com/images/I/513fC3iEhhL._AC_UF1000,1000_QL80_.jpg",
      coverColor: Color(0xFF10B981),
    ),
  ];

  // 4. Skills Data
  static const List<SkillItem> skills = [
    SkillItem(
      name: "Mobile App Development (Android & iOS using Flutter)",
      proficiency: 0.90,
      levelTag: "Advanced",
      icon: Icons.phone_iphone_rounded,
    ),
    SkillItem(
      name: "Programming Languages: Dart & Java",
      proficiency: 0.88,
      levelTag: "Advanced",
      icon: Icons.code_rounded,
    ),
    SkillItem(
      name: "Object-Oriented Programming (OOP)",
      proficiency: 0.92,
      levelTag: "Expert",
      icon: Icons.account_tree_rounded,
    ),
    SkillItem(
      name: "Effective Communication",
      proficiency: 0.95,
      levelTag: "Master",
      icon: Icons.forum_rounded,
    ),
  ];

  // 5. Featured Projects Data
  static const List<ProjectModel> projects = [
    ProjectModel(
      id: "aura",
      title: "Aura (Perfume E-Commerce App)",
      subtitle: "Sleek Mobile Retail Shopping Platform",
      shortDescription:
          "A modern mobile e-commerce application for a perfume store featuring a sleek product catalog, custom product views, and a smooth shopping experience.",
      fullDescription:
          "Aura is an elegant mobile e-commerce application crafted for perfume retailers. Built with Flutter, it features a sleek product catalog, detailed product view sheets, persistent shopping cart management, dynamic category filter tags, and smooth page transitions.",
      category: "E-Commerce Mobile",
      icon: Icons.shopping_bag_rounded,
      techStack: ["Flutter", "Dart", "BLoC", "Clean Arch", "Hive Cache"],
      githubUrl: "https://github.com",
      liveUrl: "https://example.com/aura",
      features: [
        "Sleek fragrance product catalog with high-resolution graphics",
        "Interactive shopping cart with real-time price & tax calculations",
        "Category filters & dynamic search query debouncing",
        "Smooth page routing with clean glassmorphism UI cards",
      ],
      architecturePoints: [
        "Clean Architecture layer separation (Domain, Data, Presentation)",
        "BLoC state management for predictable reactivity and isolated logic",
        "Offline-first Hive caching database for cart persistence",
      ],
    ),
    ProjectModel(
      id: "darak",
      title: "Darak (Real Estate Mobile App)",
      subtitle: "Comprehensive Property Browsing Engine",
      shortDescription:
          "A comprehensive real estate platform designed for browsing properties, filtering listings, and connecting buyers with property owners.",
      fullDescription:
          "Darak simplifies the property hunting journey by allowing users to explore real estate listings, apply parameter filters (price range, rooms, location), view high-res property image galleries, and contact owners or agents directly.",
      category: "Real Estate Mobile",
      icon: Icons.home_rounded,
      techStack: ["Flutter", "Dart", "Firebase", "REST APIs", "Responsive UI"],
      githubUrl: "https://github.com",
      liveUrl: "https://example.com/darak",
      features: [
        "Comprehensive real estate directory with category tags",
        "Advanced filter parameters for budget, location, and amenity types",
        "Interactive property image gallery with swipe carousel",
        "Direct inquiry actions connecting buyers with owners",
      ],
      architecturePoints: [
        "Repository pattern with Firebase Firestore backend queries",
        "Responsive adaptive layout for seamless mobile experience",
        "Optimized image caching and lazy loading lists",
      ],
    ),
  ];

  // 6. Volunteering & Leadership Data
  static const VolunteeringModel volunteering = VolunteeringModel(
    role: "Vice President",
    organization: "DigiDan Initiative",
    subtitle: "Bridging the Digital Gap for Sudanese Community Organizations",
    description:
        "A non-profit youth volunteer initiative dedicated to bridging the digital gap for small Sudanese community organizations and initiatives. We design and build professional websites and portfolios for free to help them transition into the digital space, enhance their credibility, and expand their reach across Sudan.",
    icon: Icons.volunteer_activism_rounded,
  );

  // 7. Hobbies & Interests Data
  static const List<HobbyModel> hobbies = [
    HobbyModel(
      title: "Listening to Podcasts",
      description:
          "Tuning into tech podcasts, software engineering discussions, and personal growth talks.",
      icon: Icons.podcasts_rounded,
      accentColor: Color(0xFFE76F51),
    ),
    HobbyModel(
      title: "Reading Books",
      description:
          "Exploring foundational computer science literature, software craftsmanship, and algorithm guides.",
      icon: Icons.auto_stories_rounded,
      accentColor: Color(0xFF00B4D8),
    ),
    HobbyModel(
      title: "Programming & Coding",
      description:
          "Building hands-on mobile applications, experimenting with Flutter packages, and writing clean code.",
      icon: Icons.terminal_rounded,
      accentColor: Color(0xFF02569B),
    ),
    HobbyModel(
      title: "Trying New Things",
      description:
          "Continuously exploring new tools, UI design paradigms, and emerging tech stacks.",
      icon: Icons.explore_rounded,
      accentColor: Color(0xFFFFB703),
    ),
    HobbyModel(
      title: "Volunteering Work",
      description:
          "Contributing time and tech skills to empower non-profits and community initiatives.",
      icon: Icons.volunteer_activism_rounded,
      accentColor: Color(0xFF10B981),
    ),
  ];
}
