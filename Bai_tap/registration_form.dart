import 'package:flutter/material.dart';

class MyBT1 extends StatelessWidget {
  const MyBT1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {

  var fkey = GlobalKey<FormState>();

  var txtName = TextEditingController();
  var txtUsername = TextEditingController();
  var txtEmail = TextEditingController();
  var txtPhone = TextEditingController();
  var txtPassword = TextEditingController();
  var txtConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Đăng ký tài khoản"),
      ),
      body: Form(
        key: fkey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: txtName,
                decoration: InputDecoration(
                  icon: Icon(Icons.account_balance),
                  hintText: "Your name",
                  labelText: "Your name(*)"
                ),
                validator: (value)
                {
                  if(value == null || value.isEmpty)
                  {
                    return "Vui lòng nhập tên của bạn!";
                  }
                  else
                    {
                      RegExp nameRegExp = RegExp(r'^[a-z A-Z,.\-]+$');
                      if(!nameRegExp.hasMatch(value))
                        return "Tên chỉ chứa các ký tự từ a-Z";
                    }
                },
              ),
              TextFormField(
                controller: txtUsername,
                decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: "Username",
                    labelText: "Username(*)"
                ),
                validator: (value)
                {
                  if(value == null || value.isEmpty)
                  {
                    return "Vui lòng nhập Username!";
                  }
                  else
                  {
                    if(value.length < 6 || value.length > 12)
                      return "Username phải có độ dài từ 6 đến 12 ký tự";
                  }
                },
              ),
              TextFormField(
                controller: txtEmail,
                decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: "Email",
                    labelText: "Email(*)"
                ),
                validator: (value)
                {
                  if(value == null || value.isEmpty)
                  {
                    return "Vui lòng nhập Email!";
                  }
                  else
                    {
                      bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                      if(emailValid == false)
                        return "Email không hợp lệ";
                    }
                },
              ),
              TextFormField(
                controller: txtPhone,
                decoration: InputDecoration(
                    icon: Icon(Icons.phone),
                    hintText: "Phone numbers",
                    labelText: "Phone numbers(*)"
                ),
                validator: (value)
                {
                  if(value == null || value.isEmpty)
                  {
                    return "Vui lòng nhập Phone!";
                  }
                  else
                    {
                      String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                      RegExp regExp = new RegExp(pattern);
                      if (!regExp.hasMatch(value))
                      {
                        return 'Số điện thoại không hợp lệ!';
                      }
                    }
                },
              ),
              TextFormField(
                controller: txtPassword,
                decoration: InputDecoration(
                    icon: Icon(Icons.password),
                    hintText: "Password",
                    labelText: "Password(*)"
                ),
                validator: (value)
                {
                  if(value == null || value.isEmpty)
                  {
                    return "Vui lòng nhập Password!";
                  }
                  else
                    {
                      if(value.length < 6 || value.length > 12)
                        return "Mật khẩu phải có độ dài từ 6 đến 12 ký tự";
                    }
                },
              ),
              TextFormField(
                controller: txtConfirmPassword,
                decoration: InputDecoration(
                    icon: Icon(Icons.password),
                    hintText: "Confirm password",
                    labelText: "Confirm password(*)"
                ),
                validator: (value)
                {
                  if(value == null || value.isEmpty)
                  {
                    return "Vui lòng nhập lại Password!";
                  }
                  else
                    {
                      if (value != txtPassword.text)
                      {
                        return 'Nhập lại mật khẩu không hợp lệ!';
                      }
                    }
                },
              ),
              ElevatedButton(
                  onPressed: ()
                  {
                    if(fkey.currentState!.validate())
                      {
                        var name = txtName.text;
                        var username = txtUsername.text;
                        var email = txtEmail.text;
                        var phone = txtPhone.text;
                        var password = txtPassword.text;
                        var confirmpassword = txtConfirmPassword.text;
                        showDialog(
                            context: context,
                            builder: (context)
                            {
                              return AlertDialog(
                                title: Text("Đăng ký thành công!"),
                                content: Text("Chào mừng $name"),
                              );
                            }
                        );
                        print("All OK, pass");
                      }
                    else
                      print("Not pass");
                  },
                  child: Text("Đăng ký"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


