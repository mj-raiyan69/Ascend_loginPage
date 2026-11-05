import 'package:flutter/material.dart';
import 'package:login_project/widgets/custom_inputfield.dart';
import 'app_theme.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  // Toggle between Login (true) and Register (false)
  bool isLoginMode = true;

  // Text controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Basic Regex patterns
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final RegExp passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{6,}$');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isLoginMode ? 'Login successful!' : 'Account created successfully!',
          ),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // SECTION 1: HEADER & TITLE
                    _buildHeaderSection(),
                    const SizedBox(height: 32),

                    // SECTION 2: INPUT FIELDS
                    _buildInputFieldsSection(),
                    const SizedBox(height: 24),

                    // SECTION 3: SUBMIT BUTTON
                    _buildSubmitButtonSection(),
                    const SizedBox(height: 16),

                    // SECTION 4: SWITCH MODE FOOTER
                    _buildSwitchModeSection(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================
  // SECTION 1: HEADER
  // ==========================================
  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ASCEND', style: AppTheme.titleStyle),
        const SizedBox(height: 8),
        Text(
          isLoginMode
              ? 'Welcome back! Please enter your details.'
              : 'Create an account to start your journey.',
          style: const TextStyle(
            fontSize: 14,
            color: AppTheme.textGrey,
          ),
        ),
      ],
    );
  }

  // ==========================================
  // SECTION 2: INPUT FIELDS
  // ==========================================
  Widget _buildInputFieldsSection() {
    return Column(
      children: [
        // Name Field (Only shown in Register mode)
        if (!isLoginMode) ...[
          CustomInputField(
            controller: _nameController,
            labelText: 'Full Name',
            icon: Icons.person_outline,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
        ],

        // Email Field
        CustomInputField(
          controller: _emailController,
          labelText: 'Email Address',
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please enter your email';
            }
            if (!emailRegex.hasMatch(value)) {
              return 'Please enter a valid email address';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),

        // Password Field
        CustomInputField(
          controller: _passwordController,
          labelText: 'Password',
          icon: Icons.lock_outline,
          isPassword: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (!passwordRegex.hasMatch(value)) {
              return 'Password must be 6+ chars with letters & numbers';
            }
            return null;
          },
        ),

        // Confirm Password Field (Only shown in Register mode)
        if (!isLoginMode) ...[
          const SizedBox(height: 16),
          CustomInputField(
            controller: _confirmPasswordController,
            labelText: 'Confirm Password',
            icon: Icons.lock_reset_outlined,
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != _passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
        ],
      ],
    );
  }

  // ==========================================
  // SECTION 3: SUBMIT BUTTON
  // ==========================================
  Widget _buildSubmitButtonSection() {
    return ElevatedButton(
      onPressed: _submitForm,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.gold,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        isLoginMode ? 'LOGIN' : 'REGISTER',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
        ),
      ),
    );
  }

  // ==========================================
  // SECTION 4: SWITCH MODE FOOTER
  // ==========================================
  Widget _buildSwitchModeSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLoginMode ? "Don't have an account? " : "Already have an account? ",
          style: const TextStyle(color: AppTheme.textGrey, fontSize: 13),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isLoginMode = !isLoginMode;
              _formKey.currentState?.reset();
              _nameController.clear();
              _emailController.clear();
              _passwordController.clear();
              _confirmPasswordController.clear();
            });
          },
          child: Text(
            isLoginMode ? 'Register' : 'Login',
            style: const TextStyle(
              color: AppTheme.gold,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}