class TransactionTypeModel {
  final int? id;
  final String? name;
  final String? code;
  final String? thumbnail;
  final String? action;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  TransactionTypeModel({
    this.id,
    this.name,
    this.code,
    this.thumbnail,
    this.action,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory TransactionTypeModel.fromJson(Map<String, dynamic> json) =>
      TransactionTypeModel(
        id: json['id'],
        name: json['name'],
        code: json['code'],
        thumbnail: json['thumbnail'],
        action: json['action'],
        status: json['status'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
      );
}
