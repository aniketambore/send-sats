import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:send_sats/components/card_footer.dart';
import 'package:send_sats/components/custom_button.dart';
import 'package:send_sats/components/custom_text_field.dart';
import 'package:send_sats/components/dark_overlay.dart';
import 'package:send_sats/models/app_state_manager.dart';
import 'package:send_sats/services/webln_service.dart';
import 'package:send_sats/utils/utilities.dart';

class InvoiceCard extends StatefulWidget {
  const InvoiceCard({Key? key}) : super(key: key);

  @override
  State<InvoiceCard> createState() => _InvoiceCardState();
}

class _InvoiceCardState extends State<InvoiceCard> {
  final amountController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weblnService = Provider.of<WeblnService>(context, listen: false);

    final appStateManager =
        Provider.of<AppStateManager>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: NetworkImage(
              'https://i.ibb.co/B4HqXJc/image-2021-09-20-101657.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.purpleAccent.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Stack(
        children: [
          const DarkOverlay(),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                cardHeader(),
                const SizedBox(
                  height: 48,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        'Get an invoice through WebLN',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                        controller: amountController,
                        text: 'Sats',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        buttonText: 'Request Invoice',
                        callback: () => appStateManager.isWallet
                            ? weblnService.makeInvoice(amountController.text)
                            : Utilities.showToast(appStateManager.noWalletMssg),
                        // callback: () =>
                        //     weblnService.makeInvoice(amountController.text),
                        buttonColor: Colors.orange,
                        extendIt: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const CardFooterText()
        ],
      ),
    );
  }

  Widget cardHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.receipt,
          size: 40,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Make Invoice',
          style: Theme.of(context).textTheme.headline1,
        ),
      ],
    );
  }
}
