
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String name;
  final String surname;
  final String email;
  final String password;

  const UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.surname,
  });

  toJson() {
    return {
      "nom": name,
      "prenom": surname,
      "email": email,
      "mot de passe": password,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        email: data["email"],
        password: data["mot de passe"],
        name: data["nom"],
        surname: data["prenom"],
        );
  }
}
