//
// class AuthRepository {
//   final _http = Http.instance;
//
//
// }
//
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class UserRepository {
//   final String apiUrl = "https://jsonplaceholder.typicode.com/users";
//
//   Future<List<User>> fetchUsers() async {
//     final response = await http.get(Uri.parse(apiUrl));
//
//     if (response.statusCode == 200) {
//       List<dynamic> json = jsonDecode(response.body);
//       return json.map((data) => User.fromJson(data)).toList();
//     } else {
//       throw Exception('Failed to load users');
//     }
//   }
// }
//
// class User {
//   final int id;
//   final String name;
//   final String email;
//
//   User({required this.id, required this.name, required this.email});
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//     );
//   }
// }
