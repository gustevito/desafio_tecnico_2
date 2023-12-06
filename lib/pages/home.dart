import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_ecommerce_app/components/drawer.dart';
import 'package:minimal_ecommerce_app/components/books_tile.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/book_list.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    final books = context.watch<BookList>().booklist;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: const MyDrawer(),
      appBar: AppBar(
        //iconTheme: IconThemeData(color: Colors.amber),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,

        // logo
        title: ImageIcon(
          AssetImage('assets/logos/ebooks.png'),
          size: 120,
        ),
        // theme switch
        actions: <Widget>[
          IconButton(
            icon: Get.isDarkMode
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
            onPressed: () {
              Get.changeThemeMode(
                  Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
            },
          )
        ],
      ),
      body: Column(
        children: [
          // title
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 20, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // subtitle
                    Text(
                      'Livros',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.collections_bookmark,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/cartpage');
                      },
                    )),
              ],
            ),
          ),
          // books
          Flexible(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                mainAxisExtent: 270,
              ),
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(15),
              itemCount: books.length,
              itemBuilder: ((context, index) {
                // get each book from the booklist
                final book = books[index];

                // return UI element
                return BookTile(book: book);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
