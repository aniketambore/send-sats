import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:send_sats/components/card_footer.dart';
import 'package:send_sats/components/circle_image.dart';
import 'package:send_sats/components/custom_button.dart';
import 'package:send_sats/components/custom_qr.dart';
import 'package:send_sats/components/dark_overlay.dart';
import 'package:send_sats/services/webln_service.dart';

class PaymentCard extends StatefulWidget {
  const PaymentCard({Key? key, required this.invoice}) : super(key: key);
  final String invoice;

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: NetworkImage('https://i.ibb.co/qdMdyxT/bitcoin-lightning.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.greenAccent.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Stack(
        children: [
          const DarkOverlay(),
          Column(
            children: [
              cardHeader(),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: CustomQR(qrData: widget.invoice),
          ),
          const CardFooterText()
        ],
      ),
    );
  }

  Widget cardHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleImage(
            imageProvider: NetworkImage(
                'https://robohash.org/${DateTime.now()}.png?set=set5'),
            imageRadius: 28,
          ),
          const SizedBox(
            width: 8,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MergeSemantics(
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Satoshi Nakamoto',
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  'Bitcoin Developer',
                  style: Theme.of(context).textTheme.headline3,
                )
              ],
            ),
          ),
          sendButton(),
        ],
      ),
    );
  }

  Widget sendButton() {
    final weblnService = Provider.of<WeblnService>(context, listen: false);

    return CustomButton(
      buttonText: 'Send',
      callback: () => weblnService.sendPayment(widget.invoice),
      buttonColor: Colors.orange,
    );
  }
}
