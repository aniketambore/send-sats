import 'package:flutter/material.dart';
import 'package:flutter_webln/flutter_webln.dart';
import 'package:send_sats/models/models.dart';
import 'package:send_sats/utils/utilities.dart';

class WeblnService extends ChangeNotifier {
  String? _invoice;
  bool _invoiceStatus = false;
  SendPayment? _payment;
  bool _paymentStatus = false;

  String? get invoice => _invoice;
  bool get invoiceStatus => _invoiceStatus;
  SendPayment? get payment => _payment;
  bool get paymentStatus => _paymentStatus;

  void _setError(String error) {
    print('[!] WeblnService _setError()');
    Utilities.showToast(error);
    notifyListeners();
  }

  void setInvoice(String invoice) {
    print('[+] WeblnService setInvoice()');
    _invoice = invoice;
    _invoiceStatus = true;
    notifyListeners();
  }

  void _setPaymentStatus(bool status, [SendPayment? payment]) {
    print('[+] WeblnService _setPaymentStatus()');
    _payment = payment;
    _paymentStatus = status;
    notifyListeners();
  }

  Future<void> enable() async {
    print('[+] WeblnService enable()');
    try {
      await FlutterWebln.enable();
    } catch (error) {
      print('[!] Error is $error');
      _setError(error.toString());
    }
  }

  Future<void> getInfo() async {
    print('[+] WeblnService getInfo()');
    try {
      await FlutterWebln.getInfo().then(allowInterop((result) {
        var response = weblnDecode(result);
        final info = GetInfo.fromJson(response);
        final node = Node.fromJson(info.node);
        print(node.alias);
        Utilities.showToast(node.alias);
      }));
    } catch (error) {
      print('[!] Error is $error');
      _setError(error.toString());
    }
  }

  Future<void> makeInvoice(String? amount) async {
    print('[+] WeblnService makeInvoice()');
    final invoice = FlutterWebln.requestInvoiceArgs(
      amount: amount,
      defaultMemo: 'Send Me Sats',
    );
    try {
      await FlutterWebln.makeInvoice(requestInvoiceArgs: invoice)
          .then(allowInterop((result) {
        var response = weblnDecode(result);
        var invoice = MakeInvoice.fromJson(response);
        print(invoice.paymentRequest);
        setInvoice(invoice.paymentRequest);
      }));
    } catch (error) {
      print('[!] Error is $error');
      _setError(error.toString());
    }
  }

  Future<void> sendPayment(String paymentRequest) async {
    print('[+] WeblnService sendPayment()');
    try {
      await FlutterWebln.sendPayment(invoice: paymentRequest)
          .then(allowInterop((result) {
        var response = weblnDecode(result);
        var payment = SendPayment.fromJson(response);
        print(payment.preimage);
        _setPaymentStatus(true, payment);
      }));
    } catch (error) {
      print('[!] Error is $error');
      _setError(error.toString());
      _setPaymentStatus(false);
    }
  }

  void invalidate() {
    _invoiceStatus = false;
    _invoice = null;
  }
}
