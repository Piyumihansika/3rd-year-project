import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

// class Aluminium extends StatefulWidget {
//   @override
//   _AluminiumState createState() => _AluminiumState();
// }

// class _AluminiumState extends State<Aluminium> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//     );
//   }
// }

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

class Aluminium extends StatelessWidget {
  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(search.length, (int index) {
      return Post(
        "Title : $search $index",
        "Description :$search $index",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar<Post>(
            onSearch: search,
            onItemFound: (Post post, int index) {
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.description),
              );
            },
          ),
        ),
      ),
    );
  }
}
