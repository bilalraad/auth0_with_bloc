part of 'cat_breeds_bloc.dart';

abstract class CatBreedsListEvent extends Equatable {
  const CatBreedsListEvent();

  @override
  List<Object> get props => [];
}

class LoadBreeds extends CatBreedsListEvent {}

class LoadNewBreeds extends CatBreedsListEvent {}

class BreedSearchTextChanged extends CatBreedsListEvent {
  final String name;
  const BreedSearchTextChanged({required this.name});
  @override
  List<Object> get props => [name];
}
