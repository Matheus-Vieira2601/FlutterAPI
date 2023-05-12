class User{
  int id = 0;
  String name = "";
  String email = "";
  String username  = "";

  User(int id, String name, String username, String email){
    this.id = id;
    this.name = name;
    this.username = username;
    this.email = email;
  }

  User.fromJson(Map json): 
    id = json['id'],
    name = json['name'],
    username = json['username'],
    email = json['email'];
  
  Map toJson(){
    return {'id': id, 'name': name, 'username': username, 'email': email};
  }
}