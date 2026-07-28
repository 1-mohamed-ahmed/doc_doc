import 'package:doc_doc/core/widgets/app_button.dart';
import 'package:doc_doc/core/widgets/app_form_text_field.dart';
import 'package:doc_doc/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:doc_doc/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool obscure = true;
  bool checkVal = false;
  GlobalKey<FormState> globalKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home page")),
      body: Column(
        children: [
          Text("welcome"),
          ElevatedButton(onPressed: () {}, child: Text("logout")),
          SizedBox(height: 30.h),
          Form(
            key: globalKey,

            child: Column(
              children: [
                AppFormTextField(
                  hintText: 'Email',
                  myContrller: emailController,
                  prefixIcon: Icon(Icons.email),
                ),
                SizedBox(height: 20.h),

                AppFormTextField(
                  obscureText: obscure,
                  hintText: 'password',
                  myContrller: passwordController,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    icon: obscure
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),

          ElevatedButton(
            onPressed: () {
              context.read<AuthCubit>().signin(
                emailController.text,
                passwordController.text,
              );
            },
            child: Text("Login"),
          ),

          SizedBox(height: 20.h),

          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is AuthStateLoading) {
                return CircularProgressIndicator();
              } else if (state is AuthStateSuccess) {
                print("====================");
                print(state.data);
                print("====================");
                return Text("Success");
              } else if (state is AuthStateFailure) {
                return Text(state.message);
              } else {
                return Text("another");
              }
            },
          ),
        ],
      ),
    );
  }
}
