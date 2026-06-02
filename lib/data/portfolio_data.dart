import '../models/certificate_model.dart';
import '../models/project_model.dart';
import '../models/skill_model.dart';
import '../models/testimonial_model.dart';

class PortfolioData {
  static const String name = 'Moe Kyaw Aung';
  static const String role = 'Senior Android Developer';
  static const String tagline = 'Building elegant Android experiences with premium UI and clean architecture.';
  static const String location = 'Tachileik, Myanmar';
  static const String timezone = 'GMT+6:30';

  static const List<SkillModel> skills = [
    SkillModel(name: 'Kotlin', percent: 95, category: 'Android', icon: '🤖'),
    SkillModel(name: 'Jetpack Compose', percent: 92, category: 'Android', icon: '⚡'),
    SkillModel(name: 'Material 3', percent: 90, category: 'Android', icon: '🎨'),
    SkillModel(name: 'MVVM', percent: 94, category: 'Architecture', icon: '🏗️'),
    SkillModel(name: 'Clean Architecture', percent: 91, category: 'Architecture', icon: '🧩'),
    SkillModel(name: 'Coroutines', percent: 89, category: 'Architecture', icon: '🔄'),
    SkillModel(name: 'Firebase', percent: 98, category: 'Backend', icon: '☁️'),
    SkillModel(name: 'REST API', percent: 93, category: 'Backend', icon: '🔌'),
    SkillModel(name: 'Retrofit', percent: 90, category: 'Backend', icon: '📡'),
  ];

  static const List<ProjectModel> projects = [
    ProjectModel(
      title: 'Social Dashboard',
      description: 'Realtime analytics dashboard with clean insights and modern UI.',
      tags: ['Analytics', 'Dashboard', 'Firebase'],
      image: 'assets/images/project_1.png',
      githubUrl: '',
      liveUrl: '',
      category: 'Featured',
    ),
    ProjectModel(
      title: 'PWA App',
      description: 'Offline-first app experience with responsive mobile behavior.',
      tags: ['PWA', 'Offline', 'Responsive'],
      image: 'assets/images/project_2.png',
      githubUrl: '',
      liveUrl: '',
      category: 'Web',
    ),
    ProjectModel(
      title: 'Chat App',
      description: 'Realtime messaging app with strong UI and smooth user flows.',
      tags: ['Chat', 'Realtime', 'Android'],
      image: 'assets/images/project_3.png',
      githubUrl: '',
      liveUrl: '',
      category: 'Mobile',
    ),
  ];

  static const List<CertificateModel> certificates = [
    CertificateModel(
      title: 'Android Master',
      issuer: 'Google Developers Launchpad',
      year: '2024',
      badge: 'Verified',
      url: '',
    ),
    CertificateModel(
      title: 'Kotlin Pro',
      issuer: 'Programming Hub',
      year: '2023',
      badge: 'Verified',
      url: '',
    ),
  ];

  static const List<TestimonialModel> testimonials = [
    TestimonialModel(
      name: 'Client A',
      role: 'Product Manager',
      quote: 'Delivered the Android app on time with excellent polish.',
      avatar: 'assets/images/avatar_1.png',
    ),
    TestimonialModel(
      name: 'Client B',
      role: 'Founder',
      quote: 'Great communication, strong architecture, beautiful UI.',
      avatar: 'assets/images/avatar_2.png',
    ),
  ];
}
