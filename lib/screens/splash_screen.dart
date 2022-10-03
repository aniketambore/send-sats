import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:send_sats/models/app_state_manager.dart';
import 'package:send_sats/navigation/sendsats_pages.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: SendSatsPages.splashPath,
      key: ValueKey(SendSatsPages.splashPath),
      child: const SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(
            image: AssetImage('assets/lightning_loading.gif'),
          ),
          Text('Checking WebLN capabilities...'),
        ],
      )),
    );
  }
}
