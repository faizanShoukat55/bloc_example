part of 'cubit_favourite_cubit.dart';

enum ListStatus { loading, success, failure }

class FavouriteState extends Equatable {
  final List<FavouriteItemModel> favouriteItemList;

  final List<FavouriteItemModel> tempFavouriteItemList;

  // final List<FavouriteItemModel> selectItemList;
  // final List<FavouriteItemModel> unSelectItemList;

  final ListStatus listStatus;

  const FavouriteState(
      {this.favouriteItemList = const [],
        // this.selectItemList = const [],
        // this.unSelectItemList = const [],
        this.tempFavouriteItemList=const [],
        this.listStatus = ListStatus.loading});

  FavouriteState copyWith(
      {List<FavouriteItemModel>? favouriteItemList,List<FavouriteItemModel>? tempFavouriteItemList, ListStatus? listStatus}) {
    return FavouriteState(
        favouriteItemList: favouriteItemList ?? this.favouriteItemList,
        tempFavouriteItemList: tempFavouriteItemList ?? this.tempFavouriteItemList,
        listStatus: listStatus ?? this.listStatus);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [favouriteItemList, tempFavouriteItemList, listStatus];
}
