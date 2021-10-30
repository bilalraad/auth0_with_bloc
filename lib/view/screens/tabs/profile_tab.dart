import 'package:flutter/material.dart';
import 'package:oauth_with_bloc/bloc/auth_bloc/auth_bloc.dart';
import 'package:oauth_with_bloc/bloc/login_cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthBloc>().state.user;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 4.0),
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(user.picture ?? ''),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Text('Name: ${user.name}'),
          const SizedBox(height: 40.0),
          ElevatedButton(
            onPressed: () {
              context.read<LoginCubit>().logOut();
            },
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }
}
