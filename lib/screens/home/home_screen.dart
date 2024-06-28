import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskwave/config/routes/imports.dart';
import 'package:taskwave/providers/task_provider.dart';
import 'package:taskwave/providers/user_provider.dart';
import 'package:taskwave/widgets/card_indicator.dart';
import 'package:taskwave/widgets/header_nav.dart';
import 'package:taskwave/widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    await userProvider.fetchUserDetails();
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    await taskProvider.fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.userProfile;

    final taskProvider = Provider.of<TaskProvider>(context);
    final tasks = taskProvider.tasks;

    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 60),
          HeaderNav(user: user),
          const SizedBox(
            height: 30,
          ),
          const CardIndicator(color1: Colors.blue, color2: Colors.orange),
          const SizedBox(height: 20),
          CardIndicator(color1: Colors.blue[200], color2: Colors.red[300]),

          const SizedBox(height: 20),
          tasks == null
              ? const Center(child: CircularProgressIndicator())
              : tasks.isEmpty
                  ? const Center(child: Text('No tasks available'))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return TaskCard(task: tasks[index]);
                      },
                    ),
          // TaskCard(),
          // ElevatedButton(
          //     onPressed: () async {
          //       Provider.of<AuthProvider>(context, listen: false)
          //           .logout();
          //       Navigator.pushReplacementNamed(
          //           context, AppRoutes.login);
          //     },
          //     child: Text('Logout'))
        ],
      ),
    ))
        // : const Center(
        //     child: CircularProgressIndicator(
        //       color: Color.fromRGBO(255, 143, 143, 1),
        //     ),
        //   )
        );
  }
}
