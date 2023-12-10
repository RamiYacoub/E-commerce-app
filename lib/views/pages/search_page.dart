import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85,
        title: const TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
              borderSide: BorderSide(color: Colors.yellow),
            ),
            prefixIcon: Padding(
              padding: EdgeInsetsDirectional.only(start: 15.0),
              child: Icon(
                Icons.search,
                size: 30,
                color: Colors.black54,
              ),
            ),
            hintText: '  Sreach ...',
            hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
