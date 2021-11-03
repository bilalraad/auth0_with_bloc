import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:oauth_with_bloc/data/cat_api/cat_api_repo.dart';
import 'package:oauth_with_bloc/data/models/breed.dart';

part 'cat_breeds_event.dart';
part 'cat_breeds_state.dart';

class CatBreedsListBloc extends Bloc<CatBreedsListEvent, CatBreedsListState> {
  final TheCatApiRepository _catApiRepository;
  int _page = 0;
  int max = 66;

  CatBreedsListBloc(this._catApiRepository)
      : super(const CatBreedsListState()) {
    on<LoadBreeds>((event, emit) async {
      try {
        final breeds = await _catApiRepository.getBreedsList(_page);
        emit(
            state.copyWith(status: CatBreedsListStatus.loaded, breeds: breeds));
      } catch (e) {
        print(e);
        state.copyWith(status: CatBreedsListStatus.error, error: e.toString());
      }

      _page++;
    });

    on<LoadNewBreeds>((event, emit) async {
      try {
        print(state.breeds.length.toString() + 'state');
        print(_page.toString() + 'page');
        if (state.breeds.length <= max) {
          print('object');
          emit(state.copyWith(status: CatBreedsListStatus.loadingNewItems));
          final breeds = await _catApiRepository.getBreedsList(_page);
          print(breeds.length.toString() + "api");
          print(breeds.first.toString() + state.breeds[0].toString() + 'mix');
          emit(state.copyWith(
              status: CatBreedsListStatus.loaded,
              breeds: List.of(state.breeds)..addAll(breeds)));
          _page++;
        } else {
          emit(state.copyWith(
              status: CatBreedsListStatus.loaded, breeds: state.breeds));
        }
      } catch (e, s) {
        print(e);
        print(s);
        emit(state.copyWith(
            status: CatBreedsListStatus.errorLoadingNewItem,
            error: e.toString()));
      }
    }, transformer: droppable());
  }
}
