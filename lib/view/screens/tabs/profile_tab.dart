import 'package:flutter/material.dart';
import 'package:oauth_with_bloc/bloc/login_cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            context.read<LoginCubit>().logOut();
          },
          child: const Text('logOut'),
        ),
      ],
    );
  }
}
