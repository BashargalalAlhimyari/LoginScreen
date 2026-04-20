import 'package:flutter/material.dart';

class YemenRepublicLogin extends StatefulWidget {
  const YemenRepublicLogin({super.key});

  @override
  _YemenRepublicLoginState createState() => _YemenRepublicLoginState();
}

class _YemenRepublicLoginState extends State<YemenRepublicLogin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFCE1126), Colors.white, Color(0xFF000000)],
              stops: [0.0, 0.5, 1.0],
            ),
          ),
          child: StartLoginWidget(),
        ),
      ),
    );
  }
}

class TextFormWidget extends StatefulWidget {
  final bool isPassword;
  final String label;
  final IconData icon;

  const TextFormWidget({
    super.key,
    required this.isPassword,
    required this.label,
    required this.icon,
  });

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  late bool _currentObscure;

  @override
  void initState() {
    super.initState();
    _currentObscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? _currentObscure : false,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _currentObscure ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () =>
                    setState(() => _currentObscure = !_currentObscure),
              )
            : null,
        suffixIcon: Icon(widget.icon, color: const Color(0xFFCE1126)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFCE1126), width: 2),
        ),
      ),
    );
  }
}

class StartLoginWidget extends StatelessWidget {
  const StartLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 80),
          Hero(
            tag: 'logo',
            child: Container(
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Icon(Icons.star, size: 60, color: Color(0xFFCE1126)),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "نظام المسار الجمهوري",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [Shadow(color: Colors.black45, blurRadius: 5)],
            ),
          ),
          const SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                const Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF000000),
                  ),
                ),
                const SizedBox(height: 30),
                const TextFormWidget(
                  label: "البريد الإلكتروني أو الرقم الوظيفي",
                  icon: Icons.person_outline,
                  isPassword: false,
                ),
                const SizedBox(height: 20),
                const TextFormWidget(
                  label: "كلمة المرور",
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "نسيت كلمة المرور؟",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFCE1126),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "دخول",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            "عاش اليمن حراً أبياً",
            style: TextStyle(color: Colors.white70, letterSpacing: 1.2),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
