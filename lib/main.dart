
import 'package:taskwave/providers/task_provider.dart';
import 'package:taskwave/providers/user_provider.dart';
import 'package:taskwave/repositories/task_repository.dart';
import 'package:taskwave/repositories/user_repository.dart';
import 'package:taskwave/screens/splash/splash_screen.dart';
import 'package:taskwave/services/task_service.dart';
import 'package:taskwave/services/user_service.dart';
import 'config/routes/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authService = AuthService();
  final authRepository = AuthRepository(authService: authService);
  final userRepository = UserRepository(userService: UserService());
  final taskRepository = TaskRepository(taskService: TaskService());

  final authProvider = AuthProvider(authRepository: authRepository);
  await authProvider.loadAccessToken(); // Cargar el token de acceso al inicio

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>.value(value: authProvider),
        ChangeNotifierProvider(create: (_) => UserProvider(userRepository: userRepository)),
        ChangeNotifierProvider(create: (_) => TaskProvider(taskRepository: taskRepository)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute:  AppRoutes.splash,
          routes: {
            AppRoutes.splash: (context) => SplashScreen(),
            AppRoutes.login: (context) => const LoginScreen(),
            AppRoutes.home: (context) => HomeScreen(),
            AppRoutes.register: (context) => RegisterScreen(),
          },
        
        );
      },
    );
  }
}
