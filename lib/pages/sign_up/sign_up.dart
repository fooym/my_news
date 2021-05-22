import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_news/common/widgets/app.dart';
import 'package:my_news/common/widgets/button.dart';
import 'package:my_news/common/widgets/input.dart';
import 'package:my_news/common/widgets/toast.dart';

import '../../common/utils/screen.dart';
import '../../common/utils/screen.dart';
import '../../common/utils/screen.dart';
import '../../common/utils/screen.dart';
import '../../common/utils/screen.dart';
import '../../common/utils/screen.dart';
import '../../common/utils/screen.dart';
import '../../common/utils/utils.dart';
import '../../common/utils/utils.dart';
import '../../common/values/colors.dart';
import '../../common/values/values.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // logo
  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(50)),
      child: Text(
        "Sign up",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: duSetFontSize(24),
          height: 1,
        ),
      ),
    );
  }

  // 注册表单
  Widget _buildInputForm() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(49)),
      width: duSetWidth(295),
      child: Column(
        children: [
          inputTextEdit(
              controller: _fullNameController,
              hintText: "Full Name",
              marginTop: 0),
          inputTextEdit(
              controller: _emailController, hintText: "Email", marginTop: 15),
          inputTextEdit(
              controller: _passwordController,
              hintText: "Password",
              marginTop: 15,
              isPassword: true),
          Container(
            margin: EdgeInsets.only(top: duSetHeight(15)),
            child: btnFlatButtonWidget(
                onPressed: () {
                  if (!duCheckStringLength(_fullNameController.value.text, 5)) {
                    toastInfo(msg: '用户名不能小于5位');
                    return;
                  }
                  if (!duIsEmail(_emailController.value.text)) {
                    toastInfo(msg: '请正确输入邮件');
                    return;
                  }
                  if (!duCheckStringLength(_passwordController.value.text, 6)) {
                    toastInfo(msg: '密码不能小于6位');
                    return;
                  }
                  Navigator.pop(context);
                },
                width: 295,
                title: "Create an account"),
          ),
          Container(
            margin: EdgeInsets.only(top: duSetHeight(20)),
            child: Text(
              "By signing up you agree to our",
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: duSetFontSize(16),
                  height: 1),
            ),
          )
        ],
      ),
    );
  }

  // 第三方
  Widget _buildThirdPartyLogin() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(bottom: duSetHeight(40)),
      child: Column(
        children: [
          Container(
            child: Text(
              "Or sign in with social networks",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: duSetFontSize(16),
                  height: 1),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: duSetHeight(20)),
            child: Row(
              children: [
                btnFlatButtonBorderOnlyWidget(
                    onPressed: () {}, iconFileName: "twitter"),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                    onPressed: () {}, iconFileName: "google"),
                Spacer(),
                btnFlatButtonBorderOnlyWidget(
                    onPressed: () {}, iconFileName: "facebook"),
              ],
            ),
          )
        ],
      ),
    );
  }

  // 有账号
  Widget _buildHaveAccountButton() {
    return Container(
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: btnFlatButtonWidget(
          onPressed: () {
            Navigator.pop(context);
          },
          title: "I have an account",
          width: 295,
          gbColor: AppColors.secondaryElement,
          fontColor: AppColors.primaryText),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: transparentAppBar(context: context, actions: [
        IconButton(
            icon: Icon(
              Icons.info_outline,
              color: AppColors.primaryText,
            ),
            onPressed: () {
              toastInfo(msg: "这是注册页面");
            }),
      ]),
      body: Center(
        child: Column(
          children: [
            Divider(height: 1),
            _buildLogo(),
            _buildInputForm(),
            Spacer(),
            _buildThirdPartyLogin(),
            _buildHaveAccountButton(),
          ],
        ),
      ),
    );
  }
}
