import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:online_team_management/controller/sign_up_controller.dart';
import 'package:online_team_management/util/extension.dart';
import 'package:online_team_management/view/home_view/home_view.dart';
import 'package:online_team_management/widget/submit_button.dart';
import 'package:provider/provider.dart';

class SignupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(parent: ClampingScrollPhysics()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            height: context.dynamicHeight(1),
            width: context.dynamicWidth(1),
            child: Form(
              key:
                  Provider.of<SignUpController>(context, listen: false).formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(
                    flex: 8,
                  ),
                  Expanded(
                    flex: 6,
                    child: FittedBox(
                      child: Text(
                        "Register",
                        style: context.themeData.textTheme.title
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Divider(
                      thickness: 4,
                      color: context.themeData.buttonColor,
                      endIndent: 280,
                    ),
                  ),
                  Expanded(
                    flex: 11,
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            style: context.themeData.textTheme.subtitle1
                                .copyWith(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.7)),
                            text:
                                "Please register to you account to contunie with Online Team Management Tool."),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 12,
                    child: TextFormField(
                        decoration: new InputDecoration(
                          hintText: "First Name",
                        ),
                        validator: (value) => Provider.of<SignUpController>(
                                context,
                                listen: false)
                            .firstNameValidator(),
                        onChanged: (String value) {
                          Provider.of<SignUpController>(context, listen: false)
                              .firstName = value;
                        }),
                  ),
                  Expanded(
                    flex: 12,
                    child: TextFormField(
                        decoration: new InputDecoration(
                          hintText: "Last Name",
                        ),
                        validator: (value) => Provider.of<SignUpController>(
                                context,
                                listen: false)
                            .lastNameValidator(),
                        onChanged: (String value) {
                          Provider.of<SignUpController>(context, listen: false)
                              .lastName = value;
                        }),
                  ),
                  Expanded(
                    flex: 12,
                    child: TextFormField(
                        decoration: new InputDecoration(
                          hintText: "Email Address",
                        ),
                        validator: (value) => Provider.of<SignUpController>(
                                context,
                                listen: false)
                            .emailValidator(),
                        onChanged: (String value) {
                          Provider.of<SignUpController>(context, listen: false)
                              .email = value;
                        }),
                  ),
                  Expanded(
                    flex: 12,
                    child: TextFormField(
                        decoration: new InputDecoration(
                          hintText: "Password",
                        ),
                        validator: (value) => Provider.of<SignUpController>(
                                context,
                                listen: false)
                            .passwordValidator(),
                        onChanged: (String value) {
                          Provider.of<SignUpController>(context, listen: false)
                              .password = value;
                        }),
                  ),
                  Expanded(
                      flex: 12,
                      child: TextFormField(
                          decoration: new InputDecoration(
                            hintText: "Confirm Password",
                          ),
                          validator: (value) => Provider.of<SignUpController>(
                                  context,
                                  listen: false)
                              .confirmPasswordValidator(),
                          onChanged: (String value) {
                            Provider.of<SignUpController>(context,
                                    listen: false)
                                .confirmPassword = value;
                          })),
                  Expanded(
                      flex: 14,
                      child: Center(
                          child: SubmitButton(
                        colors: [
                          context.themeData.buttonColor,
                          context.themeData.buttonColor
                        ],
                        child: Text(
                          "Sign Up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: context.dynamicWidth(0.035)),
                        ),
                        onTap: () async {
                          bool result = await Provider.of<SignUpController>(
                                  context,
                                  listen: false)
                              .signUp();
                          if (result) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => HomeView(),
                              ),
                            );
                          } else {
                            Flushbar(
                              backgroundColor: Colors.red,
                              title: "Oops..",
                              message: "Invalid Sign Up",
                              duration: Duration(seconds: 3),
                            )..show(context);
                          }
                        } /*_submitButtonOnTap(context)*/,
                      ))),
                  Expanded(
                    flex: 10,
                    child: Center(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => Navigator.of(context).pop(),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Already have an account\n",
                                style: context.themeData.textTheme.bodyText1
                                    .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "LOGIN",
                                style: context.themeData.textTheme.bodyText1
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: context.themeData.buttonColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
/*
  _submitButtonOnTap(BuildContext context) {
    bool isValidate =
        Provider.of<SignupProcess>(context, listen: false).validateSignUp();
    if (isValidate) {
      Navigator.pushReplacement(context, SlideRoute(page: SignupDetailView()));
    }
  }*/
}
