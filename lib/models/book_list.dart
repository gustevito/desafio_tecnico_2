import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/book.dart';

class BookList extends ChangeNotifier {
  // livros
  final List<Book> _booklist = [
    Book(
      name: 'Book 1',
      price: 49.99,
      description: 'Item description',
    ),
    Book(
      name: 'Book 2',
      price: 49.99,
      description: 'Item description',
    ),
    Book(
      name: 'Book 3',
      price: 49.99,
      description: 'Item description',
    ),
    Book(
      name: 'Book 4',
      price: 49.99,
      description: 'Item description',
    ),
    Book(
      name: 'Book 5',
      price: 49.99,
      description: 'Item description',
    ),
    Book(
      name: 'Book 6',
      price: 49.99,
      description: 'Item description',
    ),
    Book(
      name: 'Book 7',
      price: 49.99,
      description: 'Item description',
    ),
    Book(
      name: 'Book 8',
      price: 49.99,
      description: 'Item description',
    ),
    Book(
      name: 'Book 9',
      price: 49.99,
      description: 'Item description',
    ),
    Book(
      name: 'Book 10',
      price: 49.99,
      description: 'Item description',
    ),
    Book(
      name: 'Book 11',
      price: 49.99,
      description: 'Item description',
    ),
  ];

  // favoritos
  final List<Book> _cart = [];
  // get livros
  List<Book> get booklist => _booklist;
  // get favoritos
  List<Book> get cart => _cart;
  // adicionar livro aos favoritos
  void addToCart(Book item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(Book item) {
    _cart.remove(item);
    notifyListeners();
  }
}
