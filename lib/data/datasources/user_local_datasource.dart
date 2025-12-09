import 'package:get_it/get_it.dart';
import 'package:prack_10/core/models/user.dart';

class UserLocalDataSource {
  List<User> get users => GetIt.I<List<User>>();
}
