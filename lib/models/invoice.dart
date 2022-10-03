class MakeInvoice {
  final String paymentRequest;
  final String rHash;

  MakeInvoice({required this.paymentRequest, required this.rHash});

  factory MakeInvoice.fromJson(Map json) {
    return MakeInvoice(
      paymentRequest: json['paymentRequest'] ?? '',
      rHash: json['rHash'] ?? '',
    );
  }
}
