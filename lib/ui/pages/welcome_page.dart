import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:sea_mobile/ui/pages/auth/login_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  WelcomePageState createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: screenWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              Lottie.asset(
                'assets/welcome_animation.json',
                width: 350,
                height: 350,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 30),
              AnimatedOpacity(
                duration: const Duration(seconds: 2),
                opacity: _opacity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const Text(
                        "Welcome to Vietnam Sea",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Your journey starts here.",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: screenWidth * 0.5,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 600),
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const LoginPage(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  const begin = Offset(1.0, 0.0);
                                  const end = Offset.zero;
                                  const curve = Curves.easeInOut;

                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));
                                  var fadeTween =
                                      Tween<double>(begin: 0.5, end: 1.0);

                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: FadeTransition(
                                      opacity: animation.drive(fadeTween),
                                      child: child,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                          icon: const Icon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.white,
                            size: 22,
                          ),
                          label: const Text(
                            "Get Started",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
