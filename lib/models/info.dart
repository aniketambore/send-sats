class GetInfo {
  final Map node;

  GetInfo({required this.node});

  factory GetInfo.fromJson(Map json) {
    return GetInfo(node: json['node'] ?? '');
  }
}

class Node {
  String alias;
  String pubkey;
  String color;

  Node({required this.alias, required this.pubkey, required this.color});

  factory Node.fromJson(Map json) {
    return Node(
      alias: json['alias'] ?? '',
      pubkey: json['pubkey'] ?? '',
      color: json['color'] ?? '',
    );
  }
}
