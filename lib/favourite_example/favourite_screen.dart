import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/favourite_example/bloc/favourite_bloc.dart';
import 'package:flutter_bloc_example/model/FavouriteItemModel.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite App"),
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteState>(builder: (context, state) {
            return Visibility(
              visible: state.tempFavouriteItemList.isNotEmpty ? true : false,
              child: IconButton(
                icon: const Icon(Icons.delete_forever),
                onPressed: () {
                  context.read<FavouriteBloc>().add(DeleteItem());
                },
              ),
            );
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<FavouriteBloc, FavouriteState>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case ListStatus.success:
                return ListView.builder(
                    itemCount: state.favouriteItemList.length,
                    itemBuilder: (context, index) {
                      var item = state.favouriteItemList[index];
                      return Card(
                        child: ListTile(
                          leading: Checkbox(
                            value: state.tempFavouriteItemList.contains(item)
                                ? true
                                : false,
                            onChanged: (newValue) {
                              if (newValue!) {
                                context
                                    .read<FavouriteBloc>()
                                    .add(SelectItem(item: item));
                              } else {
                                context
                                    .read<FavouriteBloc>()
                                    .add(UnSelectItem(item: item));
                              }
                            },
                          ),
                          title: Text(
                            item.value.toString(),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              FavouriteItemModel updateItem =
                                  FavouriteItemModel(
                                      id: item.id,
                                      value: item.value,
                                      isFavourite:
                                          item.isFavourite ? false : true);
                              context
                                  .read<FavouriteBloc>()
                                  .add(FavouriteItem(item: updateItem));
                            },
                            icon: Icon(item.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_outline),
                          ),
                        ),
                      );
                    });
              case ListStatus.failure:
                return const Text("Something Went Wrong");
            }
          },
        ),
      ),
    );
  }
}
