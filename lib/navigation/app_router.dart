import 'package:flutter/material.dart';
import 'package:send_sats/models/app_state_manager.dart';
import 'package:send_sats/navigation/app_link.dart';
import 'package:send_sats/navigation/sendsats_pages.dart';
import 'package:send_sats/screens/invoice_screen.dart';
import 'package:send_sats/screens/payment_screen.dart';
import 'package:send_sats/screens/splash_screen.dart';
import 'package:send_sats/services/webln_service.dart';

class AppRouter extends RouterDelegate<AppLink>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;

  final WeblnService weblnService;

  AppRouter({
    required this.appStateManager,
    required this.weblnService,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    weblnService.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    weblnService.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (!appStateManager.isInitialized) SplashScreen.page(),
        if (appStateManager.isInitialized && !weblnService.invoiceStatus)
          InvoiceScreen.page(),
        if (weblnService.invoiceStatus)
          PaymentScreen.page(weblnService.invoice ?? ''),
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    if (route.settings.name == SendSatsPages.paymentPath) {
      weblnService.invalidate();
    }

    return true;
  }

  AppLink getCurrentPath() {
    if (weblnService.invoiceStatus) {
      final invoice = weblnService.invoice;
      return AppLink(location: AppLink.kPaymentPath, invoice: invoice);
    } else {
      return AppLink(location: AppLink.kInvoicePath);
    }
  }

  @override
  AppLink get currentConfiguration => getCurrentPath();

  @override
  Future<void> setNewRoutePath(AppLink configuration) async {
    switch (configuration.location) {
      case AppLink.kPaymentPath:
        final invoice = configuration.invoice;
        if (invoice != null && invoice.length > 190) {
          weblnService.setInvoice(invoice);
        } else {
          weblnService.invalidate();
        }
        break;
      default:
        break;
    }
  }
}
