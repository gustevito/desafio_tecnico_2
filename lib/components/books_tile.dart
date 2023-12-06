import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_ecommerce_app/models/book.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_ecommerce_app/models/book_list.dart';
import 'package:provider/provider.dart';

class BookTile extends StatelessWidget {
  final Book book;

  const BookTile({
    super.key,
    required this.book,
  });

  // add to cart
  void addToCart(BuildContext context) {
    // dialog box to confirm
    context.read<BookList>().addToCart(book);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(10),
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // image
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            //image: book.image,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(25),
                          width: double.infinity,
                          child: Icon(Icons.favorite),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: const Icon(
                              Icons.bookmark_add,
                              color: Color.fromARGB(255, 255, 116, 106),
                              size: 30,
                            ),
                            onPressed: () {
                              var snack;
                              void closeSnack() {
                                snack.close();
                              }

                              Get.closeCurrentSnackbar();
                              snack = Get.snackbar(
                                'Livro favoritado!',
                                book.name,
                                snackPosition: SnackPosition.BOTTOM,
                                margin:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                animationDuration:
                                    const Duration(milliseconds: 200),
                                mainButton: TextButton(
                                  onPressed: () {
                                    context.read<BookList>().removeFromCart(book);
                                    closeSnack();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      'Desfazer',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );

                              addToCart(context);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),

              // price
              /*Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${book.price.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20),
                  ),

                  // add button
                ],
              ),*/
            ],
          ),
        ),
        // name
        Text(
          book.name,
          style: GoogleFonts.josefinSans(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 6),

        // description
        Text(
          book.description,
          style: GoogleFonts.josefinSans(
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
