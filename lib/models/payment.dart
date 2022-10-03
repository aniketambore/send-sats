class SendPayment {
  String preimage;
  String paymentHash;
  Map route;

  SendPayment(
      {required this.preimage, required this.paymentHash, required this.route});

  factory SendPayment.fromJson(Map json) {
    return SendPayment(
      preimage: json['preimage'] ?? '',
      paymentHash: json['paymentHash'] ?? '',
      route: json['route'] ?? {},
    );
  }
}
