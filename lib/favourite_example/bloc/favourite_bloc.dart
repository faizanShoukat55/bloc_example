import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../model/FavouriteItemModel.dart';
import '../../repository/favourite_repository.dart';

part 'favourite_event.dart';

part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> tempFavouriteList = [];
  FavouriteRepository favouriteRepository;

  FavouriteBloc(this.favouriteRepository) : super(const FavouriteState()) {
    on<FetchFavouriteList>(fetchList);
    on<FavouriteItem>(_addFavouriteItem);
    on<SelectItem>(_selectItem);
    on<UnSelectItem>(_unSelectItem);
    on<DeleteItem>(_deleteItem);
  }

  void fetchList(FetchFavouriteList event, Emitter<FavouriteState> emit) async {
    favouriteList = await favouriteRepository.fetchItem();
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        listStatus: ListStatus.success));
  }

  void _addFavouriteItem(
      FavouriteItem event, Emitter<FavouriteState> emit) async {
    final index =
        favouriteList.indexWhere((element) => element.id == event.item.id);

    if (event.item.isFavourite) {
      if (tempFavouriteList.contains(favouriteList[index])) {
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.item);
      }
    } else {
      if (tempFavouriteList.contains(favouriteList[index])) {
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(event.item);
      }
    }

    favouriteList[index] = event.item;
    emit(state.copyWith(favouriteItemList: List.from(favouriteList),tempFavouriteItemList: List.from(tempFavouriteList)));
  }

  void _selectItem(SelectItem event, Emitter<FavouriteState> emit) async {
    tempFavouriteList.add(event.item);
    emit(state.copyWith(tempFavouriteItemList: List.from(tempFavouriteList)));
  }

  void _unSelectItem(UnSelectItem event, Emitter<FavouriteState> emit) async {
    tempFavouriteList.remove(event.item);
    emit(state.copyWith(tempFavouriteItemList: List.from(tempFavouriteList)));
  }

  void _deleteItem(DeleteItem event, Emitter<FavouriteState> emit) async {
    //tempFavouriteList.remove(event.item);
    //emit(state.copyWith(tempFavouriteItemList: List.from(tempFavouriteList)));

    for (int i = 0; i < tempFavouriteList.length; i++) {
      favouriteList.remove(tempFavouriteList[i]);
    }
    tempFavouriteList.clear();

    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        tempFavouriteItemList: List.from(tempFavouriteList)));
  }
}
