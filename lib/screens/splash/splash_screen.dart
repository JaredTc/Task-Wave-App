

import 'package:flutter/material.dart';
import 'package:taskwave/config/routes/imports.dart';
import 'package:taskwave/config/ui/assets.dart';
import 'package:taskwave/providers/auth_provider.dart';
import 'dart:async';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtener el proveedor de autenticación
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    // Temporizador para pasar al login después de 3 segundos
    Timer(Duration(seconds: 3), () {
      // Verificar si el usuario está logueado
      if (authProvider.isLogged) {
        // Navegar a la pantalla de inicio
        Navigator.of(context).pushReplacementNamed(AppRoutes.home);
      } else {
        // Navegar a la pantalla de login
        Navigator.of(context).pushReplacementNamed(AppRoutes.login);
      }
    });

    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('${AppAssets.logo}'),
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}