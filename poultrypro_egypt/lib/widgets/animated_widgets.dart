import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../themes/app_theme.dart';

class AnimatedCard extends StatefulWidget {
  final Widget child;
  final Color? borderColor;
  final VoidCallback? onTap;
  final Duration duration;
  final int delayMs;

  const AnimatedCard({
    Key? key,
    required this.child,
    this.borderColor,
    this.onTap,
    this.duration = const Duration(milliseconds: 600),
    this.delayMs = 0,
  }) : super(key: key);

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Transform.scale(
          scale: _isHovered ? 1.02 : 1.0,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _isHovered
                    ? (widget.borderColor ?? AppTheme.accent)
                    : Colors.grey.withOpacity(0.2),
                width: 1.5,
              ),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: AppTheme.accent.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 2,
                      )
                    ]
                  : [],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: widget.child,
            ),
          ).animate(delay: Duration(milliseconds: widget.delayMs)).fadeIn(),
        ),
      ),
    );
  }
}

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  const GlassCard({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.onTap,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 0,
            )
          ],
          backdropFilter: null,
        ),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color color;
  final int delayMs;

  const StatCard({
    Key? key,
    required this.value,
    required this.label,
    required this.icon,
    required this.color,
    this.delayMs = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 28),
          ).animate(delay: Duration(milliseconds: delayMs)).scale(),
          const SizedBox(height: 12),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w900,
                ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey.withOpacity(0.7),
                ),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color? iconColor;

  const SectionTitle({
    Key? key,
    required this.title,
    this.icon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          if (icon != null) ...[
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppTheme.accent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor ?? AppTheme.accent),
            ),
            const SizedBox(width: 12),
          ],
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
          ),
        ],
      ),
    );
  }
}
