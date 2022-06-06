class Customer {
  int id;
  String firstname;
  String lastname;
  String username;
  String email;
  String phonenumber;
  String password;

  Customer(
      {this.id = 0,
      this.firstname = '',
      this.lastname = '',
      this.username = '',
      this.email = '',
      this.phonenumber = '',
      this.password = ''});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      username: json['username'],
      email: json['email'],
      phonenumber: json['phonenumber'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'firstname': firstname,
      'lastname': lastname,
      'username': username,
      'email': email,
      'phonenumber': phonenumber,
      'password': password,
    };
  }

  Map<String, dynamic> toLoginJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'username': username,
      'email': email,
      'phonenumber': phonenumber,
      'password': password,
    };
  }
}
