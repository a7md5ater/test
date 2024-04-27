// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:test/core/local_storage/keys.dart';
// import 'package:test/features/cart/data/models/cart_model/cart_model.dart';
// import 'package:test/features/product_details/data/models/product_details_model/product_properties_value.dart';
// import 'package:test/features/product_details/data/models/product_details_model/product_varient_image.dart';
// import 'package:test/features/product_details/data/models/product_details_model/variation.dart';

// abstract class CartStorage {
//   Future<void> init();
//   bool hasData();
//   List<CartModel> getCartItems();
//   Future<void> saveCartItem({required CartModel cartModel});
//   Future<void> deleteCartItem({required int id});
// }

// class CartStorageImpl implements CartStorage {
//   Box<CartModel>? _box;

//   final key = HiveKeys.cart;

//   @override
//   Future<void> init() async {
//     if (!Hive.isAdapterRegistered(CartModelAdapter().typeId)) {
//       Hive.registerAdapter(CartModelAdapter());
//     }
//     if (!Hive.isAdapterRegistered(VariationAdapter().typeId)) {
//       Hive.registerAdapter(VariationAdapter());
//     }
//     if (!Hive.isAdapterRegistered(ProductPropertiesValueAdapter().typeId)) {
//       Hive.registerAdapter(ProductPropertiesValueAdapter());
//     }
//     if (!Hive.isAdapterRegistered(ProductVarientImageAdapter().typeId)) {
//       Hive.registerAdapter(ProductVarientImageAdapter());
//     }
//     _box = await Hive.openBox(key);
//   }

//   @override
//   bool hasData() => _box!.isNotEmpty;

//   @override
//   List<CartModel> getCartItems() => _box!.values.toList();

//   @override
//   Future<void> saveCartItem({required CartModel cartModel}) async {
//     await _box!.put(cartModel.id, cartModel);
//     await _box!.flush();
//   }

//   @override
//   Future<void> deleteCartItem({required int id}) async {
//     await _box!.delete(id);
//   }
// }
