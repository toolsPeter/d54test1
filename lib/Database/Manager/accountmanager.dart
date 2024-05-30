import 'package:d54test1/Database/Databasehelper.dart';
import 'package:d54test1/Database/Data/accountData.dart';

class accountmanager {

  accountmanager.private();

  static final dbhelper = databasehelper.instance;
  static final _table = "account";
  static final accountmanager instance = accountmanager.private();

  void insert(String? nickname, String account, String password) async {
    var data = await accountdata(
            nickname: nickname, account: account, password: password)
        .Tomap();
    dbhelper.insert(_table,data);
  }

  Future<bool> checkaccount(String account) async {
    var acc = await dbhelper.query(_table,account);
    if (acc.length == 0) {
      return true;
    } else {
      return false;
    }
  }
Future<List<Map<String, Object?>>> query(String account)async{
    var _alldata = await dbhelper.query(_table,account);
  return _alldata;
}
}

