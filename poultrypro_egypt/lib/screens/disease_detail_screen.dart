import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/disease_model.dart';
import '../themes/app_theme.dart';
import '../widgets/animated_widgets.dart';

class DiseaseDetailScreen extends StatefulWidget {
  final Disease disease;

  const DiseaseDetailScreen({Key? key, required this.disease})
      : super(key: key);

  @override
  State<DiseaseDetailScreen> createState() => _DiseaseDetailScreenState();
}

class _DiseaseDetailScreenState extends State<DiseaseDetailScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildHeader(),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            widget.disease.color.withOpacity(0.3),
            widget.disease.color.withOpacity(0.1),
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: widget.disease.color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: widget.disease.color.withOpacity(0.5),
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  widget.disease.emoji,
                  style: const TextStyle(fontSize: 60),
                ),
              ),
            )
                .animate()
                .scale(delay: 100.ms)
                .fadeIn(),
            const SizedBox(height: 20),
            Text(
              widget.disease.arabicName,
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: widget.disease.color,
                    fontWeight: FontWeight.w900,
                  ),
              textAlign: TextAlign.center,
            )
                .animate()
                .fadeIn(delay: 100.ms)
                .slideUp(),
            const SizedBox(height: 8),
            Text(
              widget.disease.scientificName,
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            )
                .animate()
                .fadeIn(delay: 200.ms)
                .slideUp(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        textDirection: TextDirection.rtl,
        children: [
          const SizedBox(height: 24),
          _buildInfoBox(),
          const SizedBox(height: 24),
          SectionTitle(
            title: 'الأعراض',
            icon: Icons.warning_amber,
            iconColor: AppTheme.danger,
          ),
          _buildSymptomsList(),
          const SizedBox(height: 24),
          SectionTitle(
            title: 'المسببات',
            icon: Icons.bug_report,
            iconColor: AppTheme.warning,
          ),
          _buildCausesList(),
          const SizedBox(height: 24),
          SectionTitle(
            title: 'الوقاية',
            icon: Icons.shield_rounded,
            iconColor: AppTheme.accent,
          ),
          _buildPreventionList(),
          const SizedBox(height: 24),
          SectionTitle(
            title: 'العلاج',
            icon: Icons.medicine,
            iconColor: AppTheme.info,
          ),
          _buildTreatmentList(),
          const SizedBox(height: 24),
          _buildSeverityBox(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildInfoBox() {
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              const FaIcon(
                FontAwesomeIcons.dna,
                color: AppTheme.purple,
                size: 20,
              ),
              const SizedBox(width: 12),
              Text(
                'معلومات العامة',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildInfoRow('العائلة', widget.disease.family),
          const SizedBox(height: 12),
          _buildInfoRow('الجينوم', widget.disease.genome),
          const SizedBox(height: 12),
          Text(
            widget.disease.description,
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(delay: 300.ms)
        .slideUp();
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          value,
          textDirection: TextDirection.rtl,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
      ],
    );
  }

  Widget _buildSymptomsList() {
    return Column(
      children: List.generate(
        widget.disease.symptoms.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildListItem(
            widget.disease.symptoms[index],
            AppTheme.danger,
            index,
          ),
        ),
      ),
    );
  }

  Widget _buildCausesList() {
    return Column(
      children: List.generate(
        widget.disease.causes.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildListItem(
            widget.disease.causes[index],
            AppTheme.warning,
            index,
          ),
        ),
      ),
    );
  }

  Widget _buildPreventionList() {
    return Column(
      children: List.generate(
        widget.disease.prevention.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildListItem(
            widget.disease.prevention[index],
            AppTheme.accent,
            index,
          ),
        ),
      ),
    );
  }

  Widget _buildTreatmentList() {
    return Column(
      children: List.generate(
        widget.disease.treatment.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildListItem(
            widget.disease.treatment[index],
            AppTheme.info,
            index,
          ),
        ),
      ),
    );
  }

  Widget _buildListItem(String text, Color color, int index) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        border: Border(
          right: BorderSide(
            color: color,
            width: 3,
          ),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(14),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    )
        .animate(delay: Duration(milliseconds: index * 30))
        .slideInRight()
        .fadeIn();
  }

  Widget _buildSeverityBox() {
    final severityColor = _getSeverityColor(widget.disease.severity);
    final severityIcon = _getSeverityIcon(widget.disease.severity);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            severityColor.withOpacity(0.2),
            severityColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: severityColor.withOpacity(0.3),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: severityColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              severityIcon,
              color: severityColor,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  'درجة الخطورة',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.disease.severity,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: severityColor,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(delay: 400.ms)
        .scale();
  }

  Color _getSeverityColor(String severity) {
    switch (severity) {
      case 'Critical':
        return AppTheme.danger;
      case 'High':
        return AppTheme.warning;
      case 'Medium':
        return AppTheme.info;
      default:
        return AppTheme.accent;
    }
  }

  IconData _getSeverityIcon(String severity) {
    switch (severity) {
      case 'Critical':
        return Icons.priority_high;
      case 'High':
        return Icons.warning;
      case 'Medium':
        return Icons.info;
      default:
        return Icons.check_circle;
    }
  }
}
