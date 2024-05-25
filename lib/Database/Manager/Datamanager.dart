import 'package:d54test1/Database/Databasehelper.dart';
import 'package:d54test1/Database/Data/DataData.dart';

class datamanager {
  datamanager.private();

  static final instance = datamanager.private();
  static final _datatable ="data";
  var dbhelper = databasehelper.instance;

  void insurt(String projectname, String username, String password, String URL,
      int favourite, int accountid) async{
    var Data = Datadata(projectname: projectname,username: username,password: password,URL: URL,favourite: favourite,accountid:accountid);
    await dbhelper.insert(_datatable,Data.Tomap());
  }
  void query(String projectname)async{
    var Data = await dbhelper.dataquery(_datatable, projectname);
    Data.forEach((element) {
      print(element);
    });
  }
}
