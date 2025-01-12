import 'package:category/feature/auth/cubit/auth_cubit.dart';
import 'package:category/feature/auth/view/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController nationalId = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController tok = TextEditingController();
  TextEditingController img = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // Initialize any required data here
    super.initState();
    email.addListener(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.indigoAccent,
                  content: Text(state.userData['mesaage'])));
            }
            // Handle other states if necessary
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
              ),
              body: Form(
                key: _formKey,
                  child: Column(
                children: [
                  Customtextfield(
                      controller: name,
                      perfix: Icons.person,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your username';
                        }
                        return null;
                      },
                      textInputType: TextInputType.text,
                      label: 'Username',
                      hint: 'enter your username'),
                  Customtextfield(
                      controller: email,
                      perfix: Icons.email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your email';
                        }
                        return null;
                      },
                      textInputType: TextInputType.text,
                      label: 'Email',
                      hint: 'enter your email'),
                  Customtextfield(
                      controller: phone,
                      perfix: Icons.person,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your phone';
                        }
                        return null;
                      },
                      textInputType: TextInputType.text,
                      label: 'phone',
                      hint: 'enter your phone'),
                  Customtextfield(
                      controller: nationalId,
                      perfix: Icons.insert_drive_file,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your nationalId';
                        }
                        return null;
                      },
                      textInputType: TextInputType.text,
                      label: 'nationalId',
                      hint: 'enter your nationalId'),
                  Customtextfield(
                      controller: gender,
                      perfix: Icons.abc,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your gender';
                        }
                        return null;
                      },
                      textInputType: TextInputType.text,
                      label: 'gender',
                      hint: 'enter your gender'),
                  Customtextfield(
                      controller: password,
                      perfix: Icons.person,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your password';
                        }
                        return null;
                      },
                      textInputType: TextInputType.text,
                      label: 'password',
                      hint: 'enter your password'),
                  Customtextfield(
                      controller: tok,
                      perfix: Icons.person,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your token';
                        }
                        return null;
                      },
                      textInputType: TextInputType.text,
                      label: 'token',
                      hint: 'enter your token'),
                  Customtextfield(
                      controller: img,
                      perfix: Icons.person,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your profileImage';
                        }
                        return null;
                      },
                      textInputType: TextInputType.text,
                      label: 'profileImage',
                      hint: 'enter your profileImage'),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        AuthCubit().postDataCubit(
                            nameData: name.text,
                            emailData: email.text,
                            phoneData: phone.text,
                            nationalIdData: nationalId.text,
                            genderData: gender.text,
                            passwordData: password.text,
                            tokenData: tok.text,
                            profileImageData: img.text);
                      },
                      child: const Text('Sign Up'))
                ],
              )),
            );
          },
        ),
      ),
    );
  }
}
