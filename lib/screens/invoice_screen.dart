import 'package:flutter/material.dart';
import 'package:send_sats/navigation/sendsats_pages.dart';
import '../components/components.dart';

class InvoiceScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: SendSatsPages.invoicePath,
      key: ValueKey(SendSatsPages.invoicePath),
      child: const InvoiceScreen(),
    );
  }

  const InvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Responsive(
        child: InvoiceCard(),
      ),
    );
  }
}
