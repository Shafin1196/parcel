import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parcel/auth_screen/auth_widgets/password_change_alert.dart';
import 'package:parcel/constants.dart';
import 'package:parcel/providers/sign_in_provider.dart';

class ResetPassword extends ConsumerWidget {
  ResetPassword({super.key});
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  void resetButton(BuildContext ctx) {
    showDialog(context: ctx, builder: (ctx)=>Alert());
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          height: _screenHeight,
          width: double.infinity,
          child: Column(
            children: [

              text(
                "Reset Password",
                Color(0xff139F25),
                true,
                _screenHeight,
                0.035,
              ),
              SizedBox(height: _screenHeight * .02),
              text(
                "Please set a new password to secure your account and regain access",
                Color(0xff757575),
                false,
                _screenHeight,
                0.035,
              ),
              SizedBox(height: _screenHeight * .04),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _screenHeight * 0.018,
                  ),
                ),
              ),
              SizedBox(height: _screenHeight * 0.005),
              Consumer(
                builder: (context, ref, child) {
                  final _prov = ref.watch(passShow);
                  return TextField(
                    controller: passwordController,
                    obscureText: _prov,
                    decoration: InputDecoration(
                      suffixIcon: _prov
                          ? IconButton(
                              onPressed: () {
                                ref.read(passShow.notifier).state = !_prov;
                              },
                              icon: Icon(
                                Icons.visibility_off_outlined,
                                color: Color(0xff757575),
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                ref.read(passShow.notifier).state = !_prov;
                              },
                              icon: Icon(
                                Icons.visibility_outlined,
                                color: Color(0xff757575),
                              ),
                            ),
                      hint: Text(
                        "Create Password",
                        style: TextStyle(
                          color: Color(0xff757575),
                          fontSize: _screenHeight * .015,
                        ),
                      ),
                      border: outlineBorder(),
                      focusedBorder: outlineBorder(),
                      enabledBorder: outlineBorder(),
                    ),
                  );
                },
              ),
              SizedBox(height: _screenHeight * 0.012),
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text(
                  "Confirm New Password",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _screenHeight * 0.018,
                  ),
                ),
              ),
              SizedBox(height: _screenHeight * 0.005),
              Consumer(
                builder: (context, ref, child) {
                  final _prov = ref.watch(conPassShow);
                  return TextField(
                    controller: confirmController,
                    obscureText: _prov,
                    decoration: InputDecoration(
                      suffixIcon: _prov
                          ? IconButton(
                              onPressed: () {
                                ref.read(conPassShow.notifier).state = !_prov;
                              },
                              icon: Icon(
                                Icons.visibility_off_outlined,
                                color: Color(0xff757575),
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                ref.read(conPassShow.notifier).state = !_prov;
                              },
                              icon: Icon(
                                Icons.visibility_outlined,
                                color: Color(0xff757575),
                              ),
                            ),
                      hint: Text(
                        "Re-enter your new Password",
                        style: TextStyle(
                          color: Color(0xff757575),
                          fontSize: _screenHeight * .015,
                        ),
                      ),
                      border: outlineBorder(),
                      focusedBorder: outlineBorder(),
                      enabledBorder: outlineBorder(),
                    ),
                  );
                },
              ),
              SizedBox(height: _screenHeight * 0.005),
              buttons(
                _screenHeight,
                Color(0xff139F25),
                Colors.white,
                _screenWidth,
                "Save Cahnges",
                () => resetButton(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
