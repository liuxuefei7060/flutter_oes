import 'package:flutter_oes/pages/login/auth_info_entity.dart';
import 'package:flutter_oes/pages/login/login_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "AuthInfoEntity") {
      return AuthInfoEntity.fromJson(json) as T;
    } else if (T.toString() == "LoginEntity") {
      return LoginEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}