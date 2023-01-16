class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? username;
  final int? verified;
  final String? profilePicture;
  final String? ktp;
  final int? balance;
  final String? cardNumber;
  final String? pin;
  final String? token;

// ? Constructor User
  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.username,
    this.verified,
    this.profilePicture,
    this.ktp,
    this.balance,
    this.cardNumber,
    this.pin,
    this.token,
  });

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['name'] = name;
  //   data['email'] = email;
  //   data['password'] = password;
  //   data['username'] = username;
  //   data['verified'] = verified;
  //   data['profile_picture'] = profilePicture;
  //   data['balance'] = balance;
  //   data['card_number'] = cardNumber;
  //   data['pin'] = pin;
  //   data['token'] = token;
  //   return data;
  // }
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        username: json['username'],
        password: json['password'],
        verified: json['verified'],
        profilePicture: json['profile_picture'],
        ktp: json['ktp'],
        balance: json['balance'],
        cardNumber: json['card_number'],
        pin: json['pin'],
        token: json['token'],
      );

  UserModel copyWith({
    String? username,
    String? name,
    String? email,
    String? pin,
    String? password,
    int? balance,
  }) =>
      UserModel(
        id: id,
        username: username ?? this.username,
        name: name ?? this.name,
        email: email ?? this.email,
        pin: pin ?? this.pin,
        password: password ?? this.password,
        balance: balance ?? this.balance,
        verified: verified,
        profilePicture: profilePicture,
        ktp: ktp,
        cardNumber: cardNumber,
        token: token,
      );
}
