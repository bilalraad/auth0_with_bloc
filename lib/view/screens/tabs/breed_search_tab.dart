import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oauth_with_bloc/bloc/cat_breed_search/cat_breed_search_bloc.dart';
import 'package:oauth_with_bloc/data/cat_api/cat_api_repo.dart';
import 'package:provider/provider.dart';

import 'breeds_tab/widgets/breed_info_card.dart';

class BreedSearchTab extends StatelessWidget {
  const BreedSearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'e.g. american shorthair',
                  labelText: 'Search'),
              onChanged: (val) => context
                  .read<CatBreedSearchBloc>()
                  .add(BreedSearchTextChanged(name: val)),
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.amber),
            BlocBuilder<CatBreedSearchBloc, CatBreedSearchState>(
              builder: (context, state) {
                switch (state.status) {
                  case CatBreedsSearchStatus.error:
                    return const Center(child: Text('failed to fetch breeds'));
                  case CatBreedsSearchStatus.inital:
                    return const Center();
                  default:
                    if (state.breeds.isEmpty) {
                      return const Center(
                          child: Text(
                              'Couldn\'t find any breed with that name :('));
                    }
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return BreedInfoCard(breed: state.breeds[index]);
                        },
                        itemCount: state.breeds.length,
                      ),
                    );
                }
              },
            )
          ],
        ),
      );
    });
  }
}
