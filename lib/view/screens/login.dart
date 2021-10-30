import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oauth_with_bloc/bloc/login_cubit/login_cubit.dart';
import 'package:oauth_with_bloc/data/cat_api/cat_api.dart';
import 'package:oauth_with_bloc/data/cat_api/cat_api_repo.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () async {
              print((await TheCatApiRepository().getBreedListByName('sib'))
                  .length);
              // print(CatApi.breedsUri.replace(queryParameters: {
              //   ...CatApi.breedsUri.queryParameters,
              //   "limit": "10",
              //   "page": "1",
              // }));

              // context.read<LoginCubit>().logIn();
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
