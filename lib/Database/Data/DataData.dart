class Datamanager {
  final String? projectname;
  final String? username;
  final String? password;
  final String? URL;
  final int? favourite;

  Datamanager({this.projectname, this.username, this.password, this.URL, this.favourite});

  Map<String,dynamic> Tomap(){
    return {
      "projectname":projectname,
      "username":username,
      "password":password,
      "URL":URL,
      "favourite":favourite
    };
  }
}
