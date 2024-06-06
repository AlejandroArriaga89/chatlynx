import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final void Function()? onTap;

  RegisterScreen({
    super.key,
    this.onTap,
  });

  void register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "¡Crea una cuenta ahora!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextField(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              hintText: "Contraseña",
              obscureText: true,
              controller: _passwordController,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              hintText: "Confirmar contraseña",
              obscureText: true,
              controller: _confirmPasswordController,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomButton(
              text: 'Registrarse',
              onTap: register,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '¿Ya tiene una cienta?  ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Inicia sesión',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
