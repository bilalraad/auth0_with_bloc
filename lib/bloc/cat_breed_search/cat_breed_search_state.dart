part of 'cat_breed_search_bloc.dart';

enum CatBreedsSearchStatus {
  inital,
  loading,
  loaded,
  error,
}

class CatBreedSearchState extends Equatable {
  const CatBreedSearchState({
    this.status = CatBreedsSearchStatus.inital,
    this.breeds = const <Breed>[],
    this.error,
  });

  final CatBreedsSearchStatus status;
  final List<Breed> breeds;
  final String? error;
  @override
  List<Object> get props => [status, breeds, error ?? ''];

  CatBreedSearchState copyWith({
    CatBreedsSearchStatus? status,
    List<Breed>? breeds,
    String? error,
  }) {
    return CatBreedSearchState(
      status: status ?? this.status,
      breeds: breeds ?? this.breeds,
      error: error ?? this.error,
    );
  }
}
