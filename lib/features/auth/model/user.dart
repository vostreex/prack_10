import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

part 'user.g.dart';

class User = _User with _$User;

abstract class _User with Store {
  @observable
  String id;

  @observable
  String name;

  @observable
  String email;

  @observable
  String password;

  _User({
    required this.name,
    required this.email,
    required this.password,
    String? id,
  }) : id = id ?? const Uuid().v4();
}