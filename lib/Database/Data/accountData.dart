
class accountdata{
  final int? id;
  final String? nickname;
  final String? account;
  final String? password;
  accountdata({this.id,this.nickname, this.account, this.password});
  Map<String,dynamic>Tomap(){
    return{
      "id":id,
      "nickname":nickname,
      "account":account,
      "password":password
    };
}

}