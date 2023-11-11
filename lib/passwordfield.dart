import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final VoidCallback onTap;

  PasswordField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
    required this.onTap,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        prefix: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Icon(
            Icons.lock,
            color: _isFocused ? Colors.green : Colors.white,
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: widget.onTap,
          child: Icon(
            widget.obscureText ? Icons.visibility_off : Icons.visibility,
            color: _isFocused ? Colors.green : Colors.white,
          ),
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: _isFocused ? Colors.green : Colors.white,
        ),
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _isFocused = true;
        });
      },
      onFieldSubmitted: (value) {
        setState(() {
          _isFocused = false;
        });
      },
      onChanged: (value) {
        // Add any additional logic when the text changes
      },
    );
  }
}
