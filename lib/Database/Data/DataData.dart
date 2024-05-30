class Datadata {
  final String? projectname;
  final String? username;
  final String? password;
  final String? URL;
  final int? favourite;
  final int? accountid;

  Datadata({this.projectname, this.username, this.password, this.URL, this.favourite,this.accountid});

  Map<String,dynamic> Tomap(){
    return {
      "projectname":projectname,
      "username":username,
      "password":password,
      "URL":URL,
      "favourite":favourite,
      "accountid":accountid
    };
  }
}