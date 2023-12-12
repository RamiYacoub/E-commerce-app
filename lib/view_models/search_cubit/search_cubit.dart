
import 'package:e_commerce_app/models/last_search_model.dart';
import 'package:e_commerce_app/models/populer_search_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void getSearchData(){
    emit(SearchLoading());
    Future.delayed(const Duration(seconds: 2), (){
      emit(SearchLoaded(listLastSearched: lastSearches, listPopulerSearch: listPopulerSearch));
    });
  }
}