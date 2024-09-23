import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:planify/methods/firebase_auth.dart';
import 'package:planify/models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserModel? currentUser;
  @override
  void initState() {
    setState(() {
      currentUser = FirebaseAuthentication().getUserDetails();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          centerTitle: true,
          //TODO: add right side menu here.
        ),
        floatingActionButton: const CircleAvatar(
          child: Icon(Icons.add),
        ),
        drawer: const Drawer(),
        body: Column(
          children: [
            ListTile(
              title: Text(currentUser!.name!),
              leading: CircleAvatar(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: currentUser!.imageUrl!,
                    progressIndicatorBuilder: (context, url, progress) =>
                        CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
