class UserModel {
  final String name, id, email;
  final List orders, favourites;

  UserModel({
    required this.id,
    required this.orders,
    required this.favourites,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return UserModel(
      id: json['id'],
      favourites: json['favourites'],
      orders: json['orders'],
      name: json['name'],
      email: json['email'],
    );
  }
  Map<String, dynamic> toJson(UserModel userModel) {
    return {
      'id': userModel.id,
      'name': userModel.name,
      'email': userModel.email,
      'orders': userModel.orders,
      'favourites': userModel.favourites,
    };
  }
}
