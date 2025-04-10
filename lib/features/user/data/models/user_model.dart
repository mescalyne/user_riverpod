class UserResponse {
  UserResponse({
    required this.users,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      users:
          json['users'] == null
              ? []
              : List<User>.from(
                (json['users'] as List).map(
                  (x) => User.fromJson(x as Map<String, dynamic>),
                ),
              ),
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
    );
  }

  final List<User> users;
  final int? total;
  final int? skip;
  final int? limit;

  UserResponse copyWith({
    List<User>? users,
    int? total,
    int? skip,
    int? limit,
  }) {
    return UserResponse(
      users: users ?? this.users,
      total: total ?? this.total,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
    );
  }

  @override
  String toString() {
    return '$users, $total, $skip, $limit, ';
  }
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,

    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
    required this.crypto,
    required this.role,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      maidenName: json['maidenName'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      birthDate: json['birthDate'] as String,
      image: json['image'] as String,
      ip: json['ip'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      macAddress: json['macAddress'] as String,
      university: json['university'] as String,
      bank: Bank.fromJson(json['bank'] as Map<String, dynamic>),
      company: Company.fromJson(json['company'] as Map<String, dynamic>),
      ein: json['ein'] as String,
      ssn: json['ssn'] as String,
      userAgent: json['userAgent'] as String,
      crypto: Crypto.fromJson(json['crypto'] as Map<String, dynamic>),
      role: json['role'] as String,
    );
  }

  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final String gender;
  final String email;
  final String phone;
  final String username;
  final String password;
  final String birthDate;
  final String image;
  final String ip;
  final Address address;
  final String macAddress;
  final String university;
  final Bank bank;
  final Company company;
  final String ein;
  final String ssn;
  final String userAgent;
  final Crypto crypto;
  final String role;

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? maidenName,
    int? age,
    String? gender,
    String? email,
    String? phone,
    String? username,
    String? password,
    String? birthDate,
    String? image,
    String? ip,
    Address? address,
    String? macAddress,
    String? university,
    Bank? bank,
    Company? company,
    String? ein,
    String? ssn,
    String? userAgent,
    Crypto? crypto,
    String? role,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      maidenName: maidenName ?? this.maidenName,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      username: username ?? this.username,
      password: password ?? this.password,
      birthDate: birthDate ?? this.birthDate,
      image: image ?? this.image,
      ip: ip ?? this.ip,
      address: address ?? this.address,
      macAddress: macAddress ?? this.macAddress,
      university: university ?? this.university,
      bank: bank ?? this.bank,
      company: company ?? this.company,
      ein: ein ?? this.ein,
      ssn: ssn ?? this.ssn,
      userAgent: userAgent ?? this.userAgent,
      crypto: crypto ?? this.crypto,
      role: role ?? this.role,
    );
  }

  @override
  String toString() {
    return '$id, $firstName, $lastName, $maidenName, $age, $gender, $email, '
        '$phone, $username, $password, $birthDate, $image, $ip, $address, '
        '$macAddress, $university, $bank, $company, $ein, $ssn, $userAgent, '
        '$crypto, $role, ';
  }
}

class Address {
  Address({
    required this.address,
    required this.city,
    required this.state,
    required this.stateCode,
    required this.postalCode,
    required this.coordinates,
    required this.country,
  });
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      address: json['address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      stateCode: json['stateCode'] as String,
      postalCode: json['postalCode'] as String,
      coordinates:
          json['coordinates'] == null
              ? null
              : Coordinates.fromJson(
                json['coordinates'] as Map<String, dynamic>,
              ),
      country: json['country'] as String,
    );
  }

  final String address;
  final String city;
  final String state;
  final String stateCode;
  final String postalCode;
  final Coordinates? coordinates;
  final String country;

  Address copyWith({
    String? address,
    String? city,
    String? state,
    String? stateCode,
    String? postalCode,
    Coordinates? coordinates,
    String? country,
  }) {
    return Address(
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      stateCode: stateCode ?? this.stateCode,
      postalCode: postalCode ?? this.postalCode,
      coordinates: coordinates ?? this.coordinates,
      country: country ?? this.country,
    );
  }

  @override
  String toString() {
    return '$address, $city, $state, $stateCode, $postalCode, $country';
  }
}

class Coordinates {
  Coordinates({required this.lat, required this.lng});
  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      lat: json['lat'] as double?,
      lng: json['lng'] as double?,
    );
  }

  final double? lat;
  final double? lng;

  Coordinates copyWith({double? lat, double? lng}) {
    return Coordinates(lat: lat ?? this.lat, lng: lng ?? this.lng);
  }

  @override
  String toString() {
    return '$lat, $lng, ';
  }
}

class Bank {
  Bank({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });
  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      cardExpire: json['cardExpire'] as String?,
      cardNumber: json['cardNumber'] as String?,
      cardType: json['cardType'] as String?,
      currency: json['currency'] as String?,
      iban: json['iban'] as String?,
    );
  }

  final String? cardExpire;
  final String? cardNumber;
  final String? cardType;
  final String? currency;
  final String? iban;

  Bank copyWith({
    String? cardExpire,
    String? cardNumber,
    String? cardType,
    String? currency,
    String? iban,
  }) {
    return Bank(
      cardExpire: cardExpire ?? this.cardExpire,
      cardNumber: cardNumber ?? this.cardNumber,
      cardType: cardType ?? this.cardType,
      currency: currency ?? this.currency,
      iban: iban ?? this.iban,
    );
  }

  @override
  String toString() {
    return '$cardExpire, $cardNumber, $cardType, $currency, $iban, ';
  }
}

class Company {
  Company({
    required this.department,
    required this.name,
    required this.title,
    required this.address,
  });
  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      department: json['department'] as String?,
      name: json['name'] as String?,
      title: json['title'] as String?,
      address:
          json['address'] == null
              ? null
              : Address.fromJson(json['address'] as Map<String, dynamic>),
    );
  }

  final String? department;
  final String? name;
  final String? title;
  final Address? address;

  Company copyWith({
    String? department,
    String? name,
    String? title,
    Address? address,
  }) {
    return Company(
      department: department ?? this.department,
      name: name ?? this.name,
      title: title ?? this.title,
      address: address ?? this.address,
    );
  }

  @override
  String toString() {
    return '$department, $name, $title, $address';
  }
}

class Crypto {
  Crypto({required this.coin, required this.wallet, required this.network});
  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      coin: json['coin'] as String?,
      wallet: json['wallet'] as String?,
      network: json['network'] as String?,
    );
  }

  final String? coin;
  final String? wallet;
  final String? network;

  Crypto copyWith({String? coin, String? wallet, String? network}) {
    return Crypto(
      coin: coin ?? this.coin,
      wallet: wallet ?? this.wallet,
      network: network ?? this.network,
    );
  }

  @override
  String toString() {
    return '$coin, $wallet, $network, ';
  }
}
