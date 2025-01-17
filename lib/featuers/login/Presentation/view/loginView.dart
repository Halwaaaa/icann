import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ican/core/Loction/textApp.dart';
import 'package:ican/core/services/hivenServices.dart';
import 'package:ican/core/utlies/appimage.dart';
import 'package:ican/core/utlies/color.dart';
import 'package:ican/featuers/login/Presentation/controll/loginControll.dart';
import 'package:ican/featuers/login/Presentation/widgets/customscaffold.dart';
import 'package:iconly/iconly.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _formSignInKey = GlobalKey<FormState>();

  bool rememberPassword = true;
  bool isSee = true;

  @override
  Widget build(BuildContext context) {
    final LoginControll loginControll = Get.find();

    loginControll.animationController.reset();
    loginControll.animationController.forward();
    return CustomScaffold(
      child: AnimatedBuilder(
        animation: loginControll.animationController,
        builder: (context, child) => SlideTransition(
          position: loginControll.positoin,
          child: FadeTransition(
            opacity: loginControll.opctiy,
            child: child,
          ),
        ),
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(
                height: 10,
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formSignInKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Text(
                        //   'AL Joud',
                        //   style: TextStyle(
                        //     fontSize: 30.0,
                        //     fontWeight: FontWeight.w900,
                        //     color: AppColor.primary,
                        //   ),
                        // ),
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: CircleAvatar(
                            radius: 30.0,
                            // child: Image.asset("Assest/Images/logo2.png"),
                            backgroundColor: Colors.white,
                            child: Image.asset(AppImageName.logo),
                          ),
                        ),

                        TextFormField(
                          focusNode: loginControll.focusNodeNameUser,
                          controller: loginControll.textNameUser,
                          validator: (value) {
                            return null;

                            // if (value == null || value.isEmpty) {
                            //   return 'Please enter Username';
                            // }
                            // return null;
                          },
                          decoration: InputDecoration(
                            suffixIcon: Image.asset(AppImageName.profile),
                            label: Text(AppText.userName.tr),
                            hintText: AppText.enterUsername.tr,
                            hintStyle: const TextStyle(
                              color: AppColor.primaryAppbar,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1.4, color: AppColor.primaryAppbar
                                    // Default border color
                                    ),
                                borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColor
                                    .primaryAppbar, // Default border color
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: AppColor.primaryAppbar),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        StatefulBuilder(
                          builder: (context, setState) => TextFormField(
                            obscureText: isSee ? false : true,
                            focusNode: loginControll.focusNodePassWord,
                            controller: loginControll.textPassWord,
                            obscuringCharacter: '*',
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter Password';
                            //   }
                            //   return null;
                            // },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSee = !isSee;
                                  });
                                },
                                child: Icon(isSee
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              label: Text(AppText.password.tr),
                              hintText: AppText.enterPassword.tr,
                              hintStyle: const TextStyle(
                                color: AppColor.primaryAppbar,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1.2, color: AppColor.primaryAppbar
                                    // Default border color
                                    ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColor
                                        .primaryAppbar // Default border color
                                    ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: AppColor
                                      .primaryAppbar, // Default border color
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formSignInKey.currentState!.validate() &&
                                  rememberPassword) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(AppText.processingData.tr),
                                  ),
                                );
                                loginControll.login(context);
                              } else if (!rememberPassword) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Please agree to the processing of personal data')),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 21, 62, 133),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                textStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            child: Text(
                              AppText.login.tr,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),

                        const SizedBox(
                          height: 25.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
