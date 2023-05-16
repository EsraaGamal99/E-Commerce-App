class LoginModel
{
  bool status;
  String message;
  UserData data;

  LoginModel.FromJson(Map<String,dynamic>Json)
  {
    status = Json['status'];
    message = Json['message'];
    data = Json['data'] == null ? null :  UserData.FromJson(Json['data']) ;
  }
}

class UserData
{
  int id;
  String name;
  String email;
  String phone;
  String image;
  int points;
  int credit;
  String token;

  UserData.FromJson(Map<String,dynamic>Json)
  {
    id = Json['id'];
    name = Json['name'];
    email = Json['email'];
    phone = Json['phone'];
    image = Json['image'];
    points = Json['points'];
    credit = Json['credit'];
    token = Json['token'];

  }


}