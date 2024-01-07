import 'package:flutter/material.dart';
import 'package:flutter_login/pages/login.dart';
import 'package:flutter_login/pages/services/auth_service.dart';
import 'package:flutter_login/pages/welcome.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<UserAtt?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<UserAtt?> snapshot){
        if (snapshot.connectionState == ConnectionState.active){
          final UserAtt? user = snapshot.data;
          return user == null ? Loginform() : Welcome();
        } else{
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
      );
  }
}
