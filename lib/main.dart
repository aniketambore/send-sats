import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:send_sats/models/app_state_manager.dart';
import 'package:send_sats/navigation/app_route_parser.dart';
import 'package:send_sats/navigation/app_router.dart';
import 'package:send_sats/services/webln_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _weblnService = WeblnService();
  final _appStateManager = AppStateManager();

  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
      weblnService: _weblnService,
    );
    super.initState();
  }

  final routeParser = AppRouteParser();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => _weblnService)),
        ChangeNotifierProvider(create: ((context) => _appStateManager)),
      ],
      child: MaterialApp.router(
        title: 'Send Sats',
        theme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.orange,
          ),
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headline2: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            headline3: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          scaffoldBackgroundColor: const Color(0xff212332),
        ),
        routeInformationParser: routeParser,
        routerDelegate: _appRouter,
        // home: Router(routerDelegate: _appRouter),
        // home: const InvoiceScreen(),
        //   home: const PaymentScreen(
        //       invoice:
        //           'lnbc1590n1p3ngx45pp5hvmfps6smx4g6w2at84y3dmuppe6v6nczyyaysxjcackjdc6wsgqdq52djkuepqf4jjq5mpw3escqzpgxqyz5vqsp5er5qs5p5nhf4apzvf7yuu20w3j0sykuj7xnj8y98jf6p38rylyzq9qyyssq87dd0uyet4l3jrzwn9rs6a2huz8f5ek59r6ncw9s7jt3cgyku0uymxmk5vkpkk3eysxe92llm2wcax94acpurk0h2x70qsaayj38y8spynrd20'),
      ),
    );
  }
}
