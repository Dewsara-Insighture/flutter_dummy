import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/services/api_service.dart';
import 'package:auth0_flutter/auth0_flutter.dart';

class UserProvider extends ChangeNotifier {
  String _searchString = "";
  final _service = ApiService();
  List<User> _userl = [];
  bool isLoading = false;
  late final UserProfile _usrPrf;

  //Getter to access the private property _userl
  List<User> get userl => _userl;

  UserProfile get usrPrf => _usrPrf;

  Iterable<User> get filUserList => _searchString.isEmpty
      ? userl
      : userl.where((user) =>
          user.name.toLowerCase().contains(_searchString.toLowerCase()));

  void saveUserDetails(UserProfile usrPrf) {
    _usrPrf = usrPrf;
    notifyListeners();
  }

  void changeSearchString(String searchString) {
    _searchString = searchString;
    notifyListeners();
  }

  Future getAllUsers() async {
    if (_userl.isEmpty) {
      isLoading = true;
      notifyListeners();

      final response = await _service.getUsers();
      _userl = response!;
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshUsers() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.refreshUsers();
    _userl = response!;
    isLoading = false;
    notifyListeners();
  }
}
