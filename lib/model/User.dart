import 'package:flutter/cupertino.dart';

class User {
  String fullName;
  String emailAddress;
  String phoneNumber;
  String nameOnAccount;
  String bvn;
  String bankAccount;
  String accountNumber;
  String accountType;

  User(
      {@required String fullName,
      @required String emailAddress,
      @required String phoneNumber,
      @required String nameOnAccount,
      @required String bvn,
      @required String bankAccount,
      @required String accountNumber,
      @required String accountType});
}
