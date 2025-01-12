// ignore_for_file: body_might_complete_normally_nullable

import 'package:category/core/widgets/validator.dart';
import 'package:category/feature/auth/cubit/auth_cubit.dart';
import 'package:category/feature/auth/cubit/auth_state.dart';
import 'package:category/feature/auth/view/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController profileImageController = TextEditingController();
  final TextEditingController tokenController = TextEditingController();
  bool visible = true;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
    passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSucessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: Colors.brown,
                  content: Text(state.userdata["message"])),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 243, 218, 209),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: ListView(children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                      left: 24.0,
                      bottom: 24.0,
                      right: 24.0,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Register",
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  CustomTextField(
                    controller: nameController,
                    validator: (value) {
                      MyValidators.displayNameValidator(value);
                    },
                    label: "Name",
                    hint: "Enter your name",
                    prefix: Icons.account_circle,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: nationalIdController,
                    validator: (value) {
                      MyValidators.nationalIdValidator(value);
                    },
                    keyboard: TextInputType.number,
                    label: "National ID",
                    hint: "Enter your ID",
                    prefix: Icons.perm_identity_outlined,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: emailController,
                    validator: (value) {
                      MyValidators.phoneValidator(value);
                    },
                    keyboard: TextInputType.emailAddress,
                    label: "Email",
                    hint: "example@gmail.com",
                    prefix: Icons.email,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: phoneController,
                    validator: (value) {
                      MyValidators.phoneValidator(value);
                    },
                    keyboard: TextInputType.phone,
                    label: "Phone Number",
                    hint: "Enter your phone",
                    prefix: Icons.phone,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: genderController,
                    validator: (value) {
                      MyValidators.emailValidator(value);
                    },
                    keyboard: TextInputType.emailAddress,
                    label: "Gender",
                    hint: "Enter Gender",
                    prefix: Icons.person,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    validator: (value) {
                      MyValidators.passwordValidator(value);
                    },
                    keyboard: TextInputType.visiblePassword,
                    obscureText: visible,
                    label: "Password",
                    hint: "Enter a password",
                    prefix: Icons.lock,
                    suffix: IconButton(
                        onPressed: () {
                          visible = !visible;
                          setState(() {});
                        },
                        icon: visible == false
                            ? const Icon(
                                Icons.remove_red_eye,
                              )
                            : const Icon(
                                Icons.visibility_off,
                              )),
                    controller: passwordController,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: tokenController,
                    validator: (value) {
                      MyValidators.tokenValidator(value);
                    },
                    label: "Token",
                    hint: "Enter a token",
                    prefix: Icons.token,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (state is AuthSucessState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor: Colors.brown,
                              content: Text(state.userdata["message"])),
                        );
                      }
                      AuthCubit().postDataCubit(
                        namedata: nameController.text,
                        emaildata: emailController.text,
                        genderdata: genderController.text,
                        nationalIddata: nationalIdController.text,
                        passworddata: passwordController.text,
                        phonedata: phoneController.text,
                        profileImagedata: profileImageController.text,
                        tokendata: tokenController.text,
                      );
                    },
                    child: const Text("Sign Up"),
                  ),
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}



// import 'package:category/feature/auth/cubit/auth_cubit.dart';
// import 'package:category/feature/auth/view/widgets/customtextfield.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Screen1 extends StatefulWidget {
//   const Screen1({super.key});

//   @override
//   State<Screen1> createState() => _Screen1State();
// }

// class _Screen1State extends State<Screen1> {
//   TextEditingController name = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController phone = TextEditingController();
//   TextEditingController nationalId = TextEditingController();
//   TextEditingController gender = TextEditingController();
//   TextEditingController password = TextEditingController();
//   TextEditingController tok = TextEditingController();
//   TextEditingController img = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   @override
//   void initState() {
//     // Initialize any required data here
//     super.initState();
//     email.addListener(() {
      
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BlocProvider(
//         create: (context) => AuthCubit(),
//         child: BlocConsumer<AuthCubit, AuthState>(
//           listener: (context, state) {
//             if (state is AuthSuccess) {
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   backgroundColor: Colors.indigoAccent,
//                   content: Text(state.userData['mesaage'])));
//             }
//             // Handle other states if necessary
//           },
//           builder: (context, state) {
//             return Scaffold(
//               appBar: AppBar(
//                 backgroundColor: Colors.transparent,
//               ),
//               body: Form(
//                 key: _formKey,
//                   child: Column(
//                 children: [
//                   Customtextfield(
//                       controller: name,
//                       perfix: Icons.person,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'please enter your username';
//                         }
//                         return null;
//                       },
//                       textInputType: TextInputType.text,
//                       label: 'Username',
//                       hint: 'enter your username'),
//                   Customtextfield(
//                       controller: email,
//                       perfix: Icons.email,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'please enter your email';
//                         }
//                         return null;
//                       },
//                       textInputType: TextInputType.text,
//                       label: 'Email',
//                       hint: 'enter your email'),
//                   Customtextfield(
//                       controller: phone,
//                       perfix: Icons.person,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'please enter your phone';
//                         }
//                         return null;
//                       },
//                       textInputType: TextInputType.text,
//                       label: 'phone',
//                       hint: 'enter your phone'),
//                   Customtextfield(
//                       controller: nationalId,
//                       perfix: Icons.insert_drive_file,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'please enter your nationalId';
//                         }
//                         return null;
//                       },
//                       textInputType: TextInputType.text,
//                       label: 'nationalId',
//                       hint: 'enter your nationalId'),
//                   Customtextfield(
//                       controller: gender,
//                       perfix: Icons.abc,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'please enter your gender';
//                         }
//                         return null;
//                       },
//                       textInputType: TextInputType.text,
//                       label: 'gender',
//                       hint: 'enter your gender'),
//                   Customtextfield(
//                       controller: password,
//                       perfix: Icons.person,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'please enter your password';
//                         }
//                         return null;
//                       },
//                       textInputType: TextInputType.text,
//                       label: 'password',
//                       hint: 'enter your password'),
//                   Customtextfield(
//                       controller: tok,
//                       perfix: Icons.person,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'please enter your token';
//                         }
//                         return null;
//                       },
//                       textInputType: TextInputType.text,
//                       label: 'token',
//                       hint: 'enter your token'),
//                   Customtextfield(
//                       controller: img,
//                       perfix: Icons.person,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'please enter your profileImage';
//                         }
//                         return null;
//                       },
//                       textInputType: TextInputType.text,
//                       label: 'profileImage',
//                       hint: 'enter your profileImage'),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   ElevatedButton(
//                       onPressed: () {
//                         AuthCubit().postDataCubit(
//                             nameData: name.text,
//                             emailData: email.text,
//                             phoneData: phone.text,
//                             nationalIdData: nationalId.text,
//                             genderData: gender.text,
//                             passwordData: password.text,
//                             tokenData: tok.text,
//                             profileImageData: img.text);
//                       },
//                       child: const Text('Sign Up'))
//                 ],
//               )),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
