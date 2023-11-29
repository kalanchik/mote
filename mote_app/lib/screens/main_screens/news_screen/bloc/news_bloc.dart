import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mote_app/services/account_services/account_services.dart';
import 'package:mote_app/utils/feedback/feedback.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<NewsLoadingEvnt>((event, emit) async {
      final info = await AccountServices().getNewsInfo();
      if (info != null) {
        emit(NewsLoadedState(
          name: info['name'] as String,
          mainPhoto: info['mainPhoto'] as String,
          news: info['news'] as List,
        ));
        return;
      }
      FeedBack.showToast(complete: false, msg: 'Не удалось загрузить данные');
      emit(NewsLoadingFailureState());
    });
  }
}
