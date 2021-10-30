part of 'cat_breeds_bloc.dart';

enum CatBreedsListStatus {
  inital,
  loadingNewItems,
  error,
  errorLoadingNewItem,

  loaded,
}

class CatBreedsListState extends Equatable {
  const CatBreedsListState({
    this.status = CatBreedsListStatus.inital,
    this.breeds = const [],
    this.error,
    this.hasReachedMax = false,
  });

  final CatBreedsListStatus status;
  final String? error;
  final List<Breed> breeds;
  final bool hasReachedMax;
  @override
  List<Object> get props => [status, breeds, error ?? '', hasReachedMax];

  CatBreedsListState copyWith({
    CatBreedsListStatus? status,
    String? error,
    List<Breed>? breeds,
    bool? hasReachedMax,
  }) {
    return CatBreedsListState(
      status: status ?? this.status,
      error: error ?? this.error,
      breeds: breeds ?? this.breeds,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  bool get stringify => true;
}

enum CatBreedsSearchStatus {
  inital,
  loading,
  loaded,
  error,
}

// class CatBreedsSearchState extends CatBreedsState {
//   const CatBreedsSearchState._({
//     this.status = CatBreedsSearchStatus.inital,
//     this.breeds = const <Breed>[],
//     this.error,
//   });

//   const CatBreedsSearchState.init() : this._();
//   const CatBreedsSearchState.loaded(List<Breed> breeds)
//       : this._(status: CatBreedsSearchStatus.loaded, breeds: breeds);
//   const CatBreedsSearchState.loading()
//       : this._(status: CatBreedsSearchStatus.loading);
//   const CatBreedsSearchState.error(String error)
//       : this._(status: CatBreedsSearchStatus.error, error: error);

//   final CatBreedsSearchStatus status;
//   final List<Breed> breeds;
//   final String? error;
//   @override
//   List<Object> get props => [status, breeds, error!];
// }
