import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todolist/models/item.dart';

final itemListProvider = StateNotifierProvider<ItemListNotifier, List<Item>>(
  (ref) => ItemListNotifier(),
);

class ItemListNotifier extends StateNotifier<List<Item>> {
  ItemListNotifier() : super([]);

  void addItem(Item item) {
    state = [...state, item]; // List baru, agar state berubah
  }

  void updateItem(Item item) {
    state = [
      for (var i in state) 
        if (i.id == item.id) item else i
    ];
  }

  void deleteItem(Item item) { // Nama diperbaiki dari deletedItem ke deleteItem
    state = state.where((element) => element.id != item.id).toList();
  }
}
