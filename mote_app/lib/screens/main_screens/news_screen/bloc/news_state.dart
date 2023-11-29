part of 'news_bloc.dart';

abstract class NewsState extends Equatable {}

class NewsInitial extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoadedState extends NewsState {
  final String mainPhoto;
  final String name;
  final List news;

  NewsLoadedState({
    required this.mainPhoto,
    required this.name,
    required this.news,
  });

  @override
  List<Object?> get props => [mainPhoto, name];
}

class NewsLoadingFailureState extends NewsState {
  @override
  List<Object?> get props => [];
}
