import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../data/diseases_data.dart';
import '../themes/app_theme.dart';
import '../widgets/animated_widgets.dart';
import 'disease_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onThemeToggle;

  const HomeScreen({Key? key, required this.onThemeToggle}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  bool _menuOpen = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: _buildHeader(),
      drawer: _buildDrawer(),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildHeroSection(),
            _buildStatsSection(),
            _buildDiseaseCategories(),
            _buildDiseasesList(),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
      floatingActionButton: _buildFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  PreferredSizeWidget _buildHeader() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppTheme.accent, AppTheme.purple],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'PP',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PoultryPro',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'Eng. Mohamed Ali',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const FaIcon(FontAwesomeIcons.moon, size: 18),
          onPressed: widget.onThemeToggle,
        ),
      ],
    );
  }

  Widget _buildHeroSection() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.accent.withOpacity(0.1),
            AppTheme.purple.withOpacity(0.1),
          ],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.accent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: AppTheme.accent.withOpacity(0.3),
              ),
            ),
            child: Text(
              '🔬 دليل شامل متكامل',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.accent,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .scale(delay: 100.ms),
          const SizedBox(height: 16),
          Text(
            'PoultryPro Egypt',
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideUp(delay: 100.ms),
          const SizedBox(height: 8),
          Text(
            'دليل شامل عن أمراض الدواجن والتحصين المتقدم في مصر',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideUp(delay: 200.ms),
        ],
      ),
    );
  }

  Widget _buildStatsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: [
          StatCard(
            value: '${diseasesData.length}+',
            label: 'أمراض',
            icon: Icons.virus_lock,
            color: AppTheme.danger,
            delayMs: 100,
          ),
          StatCard(
            value: '${vaccineSchedule.length}+',
            label: 'لقاحات',
            icon: Icons.vaccines,
            color: AppTheme.accent,
            delayMs: 200,
          ),
          StatCard(
            value: '100%',
            label: 'عربي',
            icon: Icons.language,
            color: AppTheme.purple,
            delayMs: 300,
          ),
          StatCard(
            value: 'v2.0',
            label: 'احدث نسخة',
            icon: Icons.update,
            color: AppTheme.gold,
            delayMs: 400,
          ),
        ],
      ),
    );
  }

  Widget _buildDiseaseCategories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            _categoryChip('الجميع', true, 0),
            _categoryChip('الفيروسية', false, 100),
            _categoryChip('الحادة', false, 200),
            _categoryChip('المزمنة', false, 300),
          ],
        ),
      ),
    );
  }

  Widget _categoryChip(String label, bool isActive, int delayMs) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isActive
              ? AppTheme.accent
              : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isActive
                ? AppTheme.accent
                : Colors.white.withOpacity(0.1),
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isActive ? Colors.black : Colors.white,
                fontWeight: FontWeight.w700,
              ),
        ),
      )
          .animate(delay: Duration(milliseconds: delayMs))
          .fadeIn()
          .scale(),
    );
  }

  Widget _buildDiseasesList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        textDirection: TextDirection.rtl,
        children: [
          const SectionTitle(
            title: 'الأمراض الرئيسية',
            icon: Icons.health_and_safety,
          ),
          ...List.generate(
            diseasesData.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildDiseaseCard(
                diseasesData[index],
                index,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiseaseCard(dynamic disease, int index) {
    return AnimatedCard(
      delayMs: (index * 50),
      borderColor: disease.color,
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                DiseaseDetailScreen(disease: disease),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOutCubic,
                )),
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              disease.color.withOpacity(0.05),
              disease.color.withOpacity(0.02),
            ],
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: disease.color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  disease.emoji,
                  style: const TextStyle(fontSize: 32),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    disease.arabicName,
                    style:
                        Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    disease.scientificName,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: disease.color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                disease.severity,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: disease.color,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 30,
            spreadRadius: 5,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: const FaIcon(FontAwesomeIcons.house),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: const FaIcon(FontAwesomeIcons.vial),
              label: 'اللقاحات',
            ),
            BottomNavigationBarItem(
              icon: const FaIcon(FontAwesomeIcons.shield),
              label: 'الأمان',
            ),
            BottomNavigationBarItem(
              icon: const FaIcon(FontAwesomeIcons.user),
              label: 'عني',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutCubic,
        );
      },
      backgroundColor: AppTheme.accent,
      child: const FaIcon(FontAwesomeIcons.chevronUp, color: Colors.black),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppTheme.accent, AppTheme.purple],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'PP',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(
                          'PoultryPro Egypt',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          'v2.0',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  children: const [
                    // Menu items will be added here
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
