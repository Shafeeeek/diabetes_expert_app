import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:lottie/lottie.dart';
import 'package:diabetes_app/screens/quiz_screen.dart';

class WelcomeScreen extends StatefulWidget { 
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    // تغيير الألوان إلى تدرج جديد
    _colorAnimation = ColorTween(
      begin: Color(0xFF1D1E33), // لون بداية جديد
      end: Color(0xFF0A0E21),   // لون نهاية جديد
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onGetStarted() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => QuizScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  _colorAnimation.value!,
                  _colorAnimation.value!.withOpacity(0.9),
                ],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    _buildHeader(),
                    
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 20),
                            _buildAnimatedLogo(),
                            const SizedBox(height: 30),

                            _buildTitleSection(),
                            const SizedBox(height: 15),

                            _buildDescriptionSection(),
                            const SizedBox(height: 40),

                            _buildGetStartedButton(),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),

                    _buildFooter(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1.5,
                ),
              ),
              child: Icon(
                Icons.medical_services,
                color: Colors.white.withOpacity(0.7),
                size: 24,
              ),
            ),
            
            FadeTransition(
              opacity: _opacityAnimation,
              child: Text(
                'خبراء السكري',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedLogo() {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.15),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF00D1FF).withOpacity(0.3), // لون ظل جديد
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Lottie.network(
              'https://assets1.lottiefiles.com/packages/lf20_u4j3xmqa.json',
              width: 120,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.favorite,
                  color: Color(0xFF00D1FF), // لون جديد للقلب
                  size: 50,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.3,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'نظام خبراء السكري',
                  speed: const Duration(milliseconds: 80),
                  textAlign: TextAlign.center,
                ),
              ],
              isRepeatingAnimation: false,
              totalRepeatCount: 1,
            ),
          ),
        ),
        
        SlideTransition(
          position: _slideAnimation,
          child: Container(
            width: 80,
            height: 3,
            margin: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: Color(0xFF00D1FF), // لون الخط الجديد
              borderRadius: BorderRadius.circular(2),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF00D1FF).withOpacity(0.5),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionSection() {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: Column(
        children: [
          Text(
            'أداة التقييم الشخصي لمخاطر الإصابة بمرض السكري',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          
          Wrap(
            spacing: 8,
            runSpacing: 6,
            alignment: WrapAlignment.center,
            children: [
              _buildFeatureChip('تقييم دقيق'),
              _buildFeatureChip('نتائج فورية'),
              _buildFeatureChip('نصائح مخصصة'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureChip(String text) {
    return Chip(
      label: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: Color(0xFF00D1FF).withOpacity(0.2), // لون جديد للشريط
      side: BorderSide.none,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    );
  }

  Widget _buildGetStartedButton() {
    return SlideTransition(
      position: _slideAnimation,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        child: ElevatedButton(
          onPressed: _onGetStarted,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF00D1FF), // لون زر جديد
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 45,
              vertical: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 6,
            shadowColor: Color(0xFF00D1FF).withOpacity(0.3),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'ابدأ التقييم',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: Container(
        padding: const EdgeInsets.only(bottom: 20, top: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAnimatedDot(0),
                const SizedBox(width: 6),
                _buildAnimatedDot(1),
                const SizedBox(width: 6),
                _buildAnimatedDot(2),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              'اكتشف مستوى الخطر في دقائق',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 255, 102, 0).withOpacity(_controller.value > (0.6 + index * 0.1) ? 0.8 : 0.3),
      ),
    );
  }
}