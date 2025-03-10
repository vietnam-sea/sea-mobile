import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sea_mobile/ui/pages/auth/login_page.dart';
import 'package:sea_mobile/ui/pages/welcome_page.dart';
import 'package:sea_mobile/storage/share_storage.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  bool isFirstRun = await ShareStorage.get<bool>('isFirstRun') ?? true;
  if (isFirstRun) {
    await ShareStorage.set<bool>('isFirstRun', false);
  }
  runApp(MyApp(isFirstRun: isFirstRun));
}

class MyApp extends StatelessWidget {
  final bool isFirstRun;
  const MyApp({super.key, required this.isFirstRun});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vietnam Sea',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isFirstRun ? WelcomePage() : LoginPage(),
    );
  }
}
