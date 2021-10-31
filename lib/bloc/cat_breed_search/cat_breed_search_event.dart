part of 'cat_breed_search_bloc.dart';

abstract class CatBreedSearchEvent extends Equatable {
  const CatBreedSearchEvent();

  @override
  List<Object> get props => [];
}

class BreedSearchTextChanged extends CatBreedSearchEvent {
  final String name;
  const BreedSearchTextChanged({required this.name});
  @override
  List<Object> get props => [name];
}
