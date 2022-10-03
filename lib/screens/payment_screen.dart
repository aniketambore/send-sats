import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:send_sats/navigation/sendsats_pages.dart';
import 'package:send_sats/services/webln_service.dart';
import '../components/components.dart';

class PaymentScreen extends StatefulWidget {
  static MaterialPage page(String invoice) {
    return MaterialPage(
      name: SendSatsPages.paymentPath,
      key: ValueKey(SendSatsPages.paymentPath),
      child: PaymentScreen(invoice: invoice),
    );
  }

  const PaymentScreen({Key? key, required this.invoice}) : super(key: key);
  final String invoice;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late ConfettiController _controllerTopCenter;
  late AudioPlayer _player;

  void _initializeConfetti() async {
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _player = AudioPlayer();
    await _player.setAsset('assets/audio/payment.wav');
  }

  @override
  void initState() {
    _initializeConfetti();
    super.initState();
  }

  @override
  void dispose() {
    _controllerTopCenter.dispose();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          Responsive(
            child: PaymentCard(
              invoice: widget.invoice,
            ),
          ),
          buildConfetti(pi / 1),
          buildConfetti(pi / 4),
        ],
      ),
    );
  }

  Widget buildConfetti(double blastDirection) {
    return Consumer<WeblnService>(builder: (context, weblnService, child) {
      if (weblnService.paymentStatus) {
        _controllerTopCenter.play();
        _player.play();
        return Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _controllerTopCenter,
            blastDirection: blastDirection,
            maxBlastForce: 5,
            minBlastForce: 2,
            emissionFrequency: 0.05,
            gravity: 1,
            shouldLoop: false,
            maximumSize: const Size(30, 30),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
