class AppLink {
  static const kInvoicePath = '/make-invoice';
  static const kPaymentPath = '/send-payment';

  static const String kInvoiceParam = 'invoice';

  String? location;
  String? invoice;

  AppLink({
    this.location,
    this.invoice,
  });

  static AppLink fromLocation(String? location) {
    // hello!world => hello%21world
    location = Uri.decodeFull(location ?? '');

    final uri = Uri.parse(location);
    final params = uri.queryParameters;

    final invoice = params[AppLink.kInvoiceParam];

    final link = AppLink(location: uri.path, invoice: invoice);

    return link;
  }

  String toLocation() {
    String addKeyValPair({required String key, String? value}) =>
        value == null ? '' : '$key=$value&';

    switch (location) {
      case kInvoicePath:
        return kInvoicePath;
      case kPaymentPath:
        var loc = '$kPaymentPath?';
        loc += addKeyValPair(key: kInvoiceParam, value: invoice);
        return Uri.encodeFull(loc);
      default:
        return kInvoicePath;
    }
  }
}
