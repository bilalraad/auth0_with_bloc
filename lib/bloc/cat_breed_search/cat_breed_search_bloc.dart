import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:oauth_with_bloc/data/cat_api/cat_api_repo.dart';
import 'package:oauth_with_bloc/data/models/breed.dart';

part 'cat_breed_search_event.dart';
part 'cat_breed_search_state.dart';

class CatBreedSearchBloc
    extends Bloc<CatBreedSearchEvent, CatBreedSearchState> {
  final TheCatApiRepository _catApiRepository;

  CatBreedSearchBloc(this._catApiRepository)
      : super(const CatBreedSearchState()) {
    on<BreedSearchTextChanged>(
      _onBreedSearchTextChanged,
      transformer: restartable(),
    );
  }

  void _onBreedSearchTextChanged(
      BreedSearchTextChanged event, Emitter<CatBreedSearchState> emit) async {
    final breedName = event.name;

    if (breedName.isEmpty) {
      return emit(state.copyWith(status: CatBreedsSearchStatus.inital));
    }

    emit(state.copyWith(status: CatBreedsSearchStatus.loading));
    try {
      final breed = await _catApiRepository.getBreedListByName(breedName);
      emit(state.copyWith(status: CatBreedsSearchStatus.loaded, breeds: breed));
    } catch (e) {
      emit(state.copyWith(
          status: CatBreedsSearchStatus.error, error: e.toString()));
    }
  }
}
