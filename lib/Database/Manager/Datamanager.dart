import 'package:d54test1/Database/Databasehelper.dart';
import 'package:d54test1/Database/Data/DataData.dart';

class datamanager {
  datamanager.private();

  static final instance = datamanager.private();
  static final _datatable ="data";
  var dbhelper = databasehelper.instance;

  void insurt(String projectname, String username, String password, String URL,
      int favourite,String date, int accountid) async{
    var Data = Datadata(projectname: projectname,username: username,password: password,URL: URL,favourite: favourite,date: date,accountid:accountid);
    await dbhelper.insert(_datatable,Data.Tomap());
  }
  Future<List<Map<String, dynamic>>> query(String accountid)async{
    var Data = await dbhelper.dataquery(_datatable, accountid);
    return Data;
  }
  Future<List<Map<String, Object?>>> queryview(int id)async{
    var Data = await dbhelper.queryview(_datatable, id);
    return Data;
  }
  void updatefavourite(String id ,bool favourite)async{
    await dbhelper.updatafavourite(id, favourite);
  }
}
