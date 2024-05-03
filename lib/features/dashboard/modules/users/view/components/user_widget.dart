import 'package:candies_db/features/dashboard/modules/users/model/repo/database_repo.dart';
import 'package:candies_db/features/dashboard/modules/users/model/user_model.dart';
import 'package:flutter/material.dart';

class UserItemWidget extends StatelessWidget {
  const UserItemWidget({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;

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
          contentPadding: const EdgeInsets.all(12.0),
          title: Row(
            children: [
              const Text(
                "Name: ",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.pink,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                userModel.name ?? 'XXX',
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Address: ",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    userModel.address ?? 'XXX',
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                children: [
                  const Text(
                    "Phone: ",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    userModel.phone ?? 'XXX',
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.cancel, color: Colors.red),
            onPressed: () async {
              // Confirmation Dialog for User Deletion (Security Consideration)
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Delete User'),
                  content:
                      const Text('Are you sure you want to delete this user?'),
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
                        await _repo.deleteUser(id: userModel.id as String);
                        Navigator.pop(context); 
                       } catch (e) {
                       print('Failed to delete user: $e');
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
