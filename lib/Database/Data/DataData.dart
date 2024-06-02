class Datadata {
  final int? id;
  final String? projectname;
  final String? username;
  final String? password;
  final String? URL;
  final int? favourite;
  final String? date;
  final int? accountid;

  Datadata({this.id,this.projectname, this.username, this.password, this.URL, this.favourite,this.date,this.accountid});

  Map<String,dynamic> Tomap(){
    return {
      "id":id,
      "projectname":projectname,
      "username":username,
      "password":password,
      "URL":URL,
      "favourite":favourite,
      "date":date,
      "accountid":accountid
    };
  }
}
