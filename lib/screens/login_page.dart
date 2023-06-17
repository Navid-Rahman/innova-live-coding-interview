import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isErrorVisible = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _login() {
    // Validation logic
    if (_usernameController.text == 'navid' &&
        _passwordController.text == '1234') {
      // Perform successful login action
      setState(() {
        _isErrorVisible = false;
      });
    } else {
      // Show error message
      setState(() {
        _isErrorVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String imageAsset =
        _isErrorVisible ? 'icons/login_red.png' : 'icons/login_blue.png';

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15, 15, 8),
                child: Container(
                  width: 300,
                  height: 180,
                  margin: const EdgeInsets.all(12),
                  child: Image.asset(imageAsset),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 8, 15, 8),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(12),
                      child: const Text(
                        'Login details',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(26, 0, 28, 11),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _isErrorVisible
                              ? Colors.red
                              : const Color(0xff887e7e),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextFormField(
                        controller: _usernameController,
                        focusNode: _usernameFocusNode,
                        decoration: const InputDecoration(
                          hintText: 'Username, email & phone number',
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),

                    // Error message for username field
                    if (_isErrorVisible)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        child: const Text(
                          'Please enter a valid email',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),

                    Container(
                      margin: const EdgeInsets.fromLTRB(26, 0, 28, 11),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _isErrorVisible
                              ? Colors.red
                              : const Color(0xff887e7e),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        focusNode: _passwordFocusNode,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),

                    // Error message for password field
                    if (_isErrorVisible)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        child: const Text(
                          'Please enter a valid password',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(26, 0, 28, 11),
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff625c5c),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(26, 10, 28, 11),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xff0b6efe),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextButton(
                        onPressed: _login,
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Or Sign up With',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff555151)),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'icons/Vector.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
