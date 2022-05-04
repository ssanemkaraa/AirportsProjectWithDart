class User {
  final String username;
  final String password;

  User(this.username, this.password);
}

class LoginService {
  static final List<User> _userList = [
    User("test", "1"),
    User("test@netcad.com", "Ntest!*"),
  ];

  static bool isLogin({required String username, required String password}) {
    return _userList
        .any((x) => x.username == username && x.password == password);
  }
}
