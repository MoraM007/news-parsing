import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterappjson/bloc/article_event.dart';
import 'package:flutterappjson/bloc/article_state.dart';
import 'package:flutterappjson/models/api_result.dart';
import 'package:flutterappjson/repository/article_repo.dart';

class ArticleBloc extends Bloc<ArticlesEvent,ArticleState> {
  ArticleRepo repository;

  ArticleBloc({@required this.repository});

  @override
  // TODO: implement initialState
  ArticleState get initialState => ArticleInitialState();

  @override
  Stream<ArticleState> mapEventToState(ArticlesEvent event) async* {
    // TODO: implement mapEventToState
    if(event is FetchArticlesEvent) {
      yield ArticleLoadinState();
      try {
        List<Articles> articles = await repository.getArticles();
        yield ArticleLoadedState(articles: articles);
      } catch (e) {
        yield ArticleErrorState(message: e.toString());
      }
    }
  }

}