import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../model/FavouriteItemModel.dart';
import '../../repository/favourite_repository.dart';

part 'cubit_favourite_state.dart';

// class FavouriteCubit extends Cubit<FavouriteState> {
//   FavouriteCubit() : super(FavouriteInitial());
// }


class FavouriteCubit extends Cubit<FavouriteState> {
  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> tempFavouriteList = [];
  FavouriteRepository favouriteRepository;

  FavouriteCubit(this.favouriteRepository) : super(const FavouriteState()) {
    // on<FetchFavouriteList>(fetchList);
    // on<FavouriteItem>(_addFavouriteItem);
    // on<SelectItem>(_selectItem);
    // on<UnSelectItem>(_unSelectItem);
    // on<DeleteItem>(_deleteItem);
  }

  void fetchList() async {
    favouriteList = await favouriteRepository.fetchItem();
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        listStatus: ListStatus.success));
  }

  void addFavouriteItem(FavouriteItemModel itemModel) async {
    final index =
    favouriteList.indexWhere((element) => element.id == itemModel.id);

    if (itemModel.isFavourite) {
      if (tempFavouriteList.contains(favouriteList[index])) {
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(itemModel);
      }
    } else {
      if (tempFavouriteList.contains(favouriteList[index])) {
        tempFavouriteList.remove(favouriteList[index]);
        tempFavouriteList.add(itemModel);
      }
    }

    favouriteList[index] = itemModel;
    emit(state.copyWith(favouriteItemList: List.from(favouriteList),tempFavouriteItemList: List.from(tempFavouriteList)));
  }

  void selectItem(FavouriteItemModel itemModel) async {
    tempFavouriteList.add(itemModel);
    emit(state.copyWith(tempFavouriteItemList: List.from(tempFavouriteList)));
  }

  void unSelectItem(FavouriteItemModel itemModel) async {
    tempFavouriteList.remove(itemModel);
    emit(state.copyWith(tempFavouriteItemList: List.from(tempFavouriteList)));
  }

  void deleteItem() async {

    for (int i = 0; i < tempFavouriteList.length; i++) {
      favouriteList.remove(tempFavouriteList[i]);
    }
    tempFavouriteList.clear();

    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
        tempFavouriteItemList: List.from(tempFavouriteList)));
  }
}