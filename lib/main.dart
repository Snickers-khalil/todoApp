import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/providers/shared_utility_provider.dart';
import 'package:todo_app/providers/storage_provider.dart';
import 'package:todo_app/providers/theme_provider.dart';
import 'package:todo_app/ui/pages/home_page.dart';
import 'package:todo_app/ui/pages/login_page.dart';
import 'package:todo_app/utils/storage.dart';
import 'package:todo_app/utils/styles/task_app_theme.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences.setMockInitialValues({});
  final SharedPreferences sharedPreferences =
  await SharedPreferences.getInstance();
  final storage = LocalStorage();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        storageProvider.overrideWithValue(storage),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, _) {
        final bool isDark = ref.watch(isDarkProvider).getTheme();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: isDark ? TaskAppTheme.dark() : TaskAppTheme.light(),
          home: SignInView(),
          // home: firebaseUser != null? Home():SignInView());
          // routes: {
          //   '/': (context) => SignInView(),
          //   '/home': (context) => const Home(),
          // },
        );
      },
    );
  }
}
