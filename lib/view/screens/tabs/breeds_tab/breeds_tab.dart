import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oauth_with_bloc/bloc/cat_breeds_list/cat_breeds_bloc.dart';

import 'widgets/breed_info_card.dart';

class BreedTab extends StatefulWidget {
  const BreedTab({Key? key}) : super(key: key);

  @override
  State<BreedTab> createState() => _BreedTabState();
}

class _BreedTabState extends State<BreedTab> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatBreedsListBloc, CatBreedsListState>(
      buildWhen: (previous, current) => current.status != previous.status,
      builder: (context, state) {
        switch (state.status) {
          case CatBreedsListStatus.error:
            return Center(
                child: Column(
              children: [
                const Text('failed to fetch breeds'),
                TextButton(
                    onPressed: () =>
                        context.read<CatBreedsListBloc>().add(LoadBreeds()),
                    child: const Text('Try Again'))
              ],
            ));
          case CatBreedsListStatus.inital:
            return const Center(child: CircularProgressIndicator.adaptive());
          default:
            if (state.breeds.isEmpty) {
              return const Center(child: Text('No breeds to load :('));
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return BreedInfoCard(breed: state.breeds[index]);
                    },
                    itemCount: state.breeds.length,
                    controller: _scrollController,
                  ),
                ),
                if (state.status == CatBreedsListStatus.loadingNewItems)
                  const CircularProgressIndicator.adaptive(),
                if (state.status == CatBreedsListStatus.errorLoadingNewItem)
                  Column(
                    children: [
                      const Text('Error loading new items'),
                      TextButton(
                          onPressed: () {
                            context
                                .read<CatBreedsListBloc>()
                                .add(LoadNewBreeds());
                          },
                          child: const Text('Try Again'))
                    ],
                  ),
              ],
            );
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<CatBreedsListBloc>().add(LoadNewBreeds());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
