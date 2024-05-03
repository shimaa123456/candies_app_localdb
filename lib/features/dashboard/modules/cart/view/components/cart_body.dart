import 'package:candies_db/features/dashboard/modules/cart/model/cart_model.dart';
import 'package:candies_db/features/dashboard/modules/users/model/repo/database_repo.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CartBody extends StatelessWidget {
  CartBody({
    super.key,
    required this.cartModel,
  });
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              cartModel.image ?? 'xxxxx',
              width: 70.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            cartModel.name ?? 'xxx',
            style: const TextStyle(fontSize: 18),
          ),
          subtitle: Text(
            '\$ ${cartModel.totalPrice} , itemCount ${cartModel.itemCount}',
            style: const TextStyle(fontSize: 12),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () async {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Delete item'),
                  content:
                      const Text('Are you sure you want to delete this item?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                    onPressed: () async {
                      final DatabaseRepo _repo = DatabaseRepo();
                      await _repo.initDB();
                     try {
                        await _repo.deleteCartItem(id: cartModel.id as String);
                        Navigator.pop(context); 
                       } catch (e) {
                       print('Failed to delete item: $e');
                      }
                    },

                      child: const Text('Delete'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
