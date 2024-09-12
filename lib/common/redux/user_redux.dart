import 'package:flutter_learning/models/index.dart';
import 'package:redux/redux.dart';


// 用户相关的Redux

/// redux 的 combineReducers, 通过 TypedReducer 将 UpdateUserAction 与 reducers 关联起来
final userReducer = combineReducers<User?>([
  TypedReducer<User?, UpdateUserAction>(_updateLoaded).call,
]);

/// 如果有 UpdateUserAction 发起一个请求时,就会调用到 _updateLoaded, _updateLoaded 这里接受一个新的userInfo，并返回
User? _updateLoaded(User? user, action) {
  user = action.userInfo;
  return user;
}

class UpdateUserAction {
  final User? userInfo;

  UpdateUserAction(this.userInfo);
}