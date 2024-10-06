// import 'package:order_manager/enum/order_status.dart';
// import 'package:order_manager/models/menu_item.dart';
// import 'package:order_manager/models/order.dart';
// import 'package:order_manager/models/order_item.dart';
//
// class OrderData {
//   static List<Order> kOrderList = [
//
//     Order(
//         orderStatus: OrderStatus.Pending,
//         orderTotal: 1000.50,
//         orderId: "001",
//         orderItemList: [
//           OrderItem(
//               quantity: 2,
//               orderItemId: 1,
//               menuItem: MenuItem(
//                 id: 1,
//                 name: 'Spring Rolls',
//                 category: 'Cold Dishes',
//                 imageUrl:
//                     'https://saltedmint.com/wp-content/uploads/2024/01/Vegetable-Spring-Rolls-3.jpg',
//                 price: 2500.0,
//                 availableQuantity: 15,
//                 tags: ['Vegan', 'Vegetarian'],
//                 description:
//                     'Crispy and fresh spring rolls filled with a delightful mix of vegetables and spices, perfect for a light appetizer. Each bite delivers a satisfying crunch and a burst of flavor.',
//                 addOns: [
//                   {'id': 'b1', 'name': 'Extra Chicken', 'price': 3.00},
//                   {'id': 'b2', 'name': 'Side Salad', 'price': 2.50},
//                 ],
//               ),
//               addonList: ['source'],
//               specialNote: 'half boil',
//               totalPrice: 5000.00),
//           OrderItem(
//               quantity: 3,
//               orderItemId: 2,
//               menuItem: MenuItem(
//                 id: 2,
//                 name: 'Grilled Chicken Breast',
//                 category: 'Hot Dishes',
//                 imageUrl:
//                     'https://saltedmint.com/wp-content/uploads/2024/01/Vegetable-Spring-Rolls-3.jpg',
//                 price: 3250.0,
//                 availableQuantity: 12,
//                 tags: ['Vegan', 'Vegetarian'],
//                 description:
//                     'Tender and juicy grilled chicken breast, seasoned to perfection and served with a side of fresh vegetables. This hearty dish is both nutritious and delicious.',
//                 addOns: [
//                   {'id': 'b13', 'name': 'Extra Chicken', 'price': 3.00},
//                   {'id': 'b14', 'name': 'Mashed Potatoes', 'price': 2.50},
//                 ],
//               ),
//               addonList: ['source'],
//               specialNote: 'half boil',
//               totalPrice: 5000.00),
//         ],
//         tableId: 005),
//     Order(
//         orderStatus: OrderStatus.Preparing,
//         orderTotal: 5000.50,
//         orderId: "002",
//         orderItemList: [
//           OrderItem(
//               quantity: 5,
//               orderItemId: 3,
//               menuItem: MenuItem(
//                 id: 3,
//                 name: 'Tomato Basil Soup',
//                 category: 'Soup',
//                 imageUrl:
//                     'https://saltedmint.com/wp-content/uploads/2024/01/Vegetable-Spring-Rolls-3.jpg',
//                 price: 1350.0,
//                 availableQuantity: 18,
//                 tags: ['Vegan', 'Vegetarian'],
//                 description:
//                     'A comforting bowl of tomato basil soup, made with ripe tomatoes and fresh basil, served hot and perfect for any season. Enjoy the rich and savory flavors in every spoonful.',
//                 addOns: [
//                   {'id': 'b15', 'name': 'Breadsticks', 'price': 1.50},
//                   {'id': 'b16', 'name': 'Extra Basil', 'price': 1.00},
//                 ],
//               ),
//               addonList: ['source'],
//               specialNote: 'half boil',
//               totalPrice: 5000.00),
//           OrderItem(
//               quantity: 3,
//               orderItemId: 2,
//               menuItem: MenuItem(
//                 id: 4,
//                 name: 'Caesar Salad',
//                 category: 'Cold Dishes',
//                 imageUrl:
//                     'https://saltedmint.com/wp-content/uploads/2024/01/Vegetable-Spring-Rolls-3.jpg',
//                 price: 1800.0,
//                 availableQuantity: 10,
//                 tags: ['Vegan', 'Vegetarian'],
//                 description:
//                     'A classic Caesar salad with crisp romaine lettuce, creamy dressing, and crunchy croutons. Topped with parmesan cheese, it’s a timeless favorite.',
//                 addOns: [
//                   {'id': 'b17', 'name': 'Extra Croutons', 'price': 1.50},
//                   {'id': 'b18', 'name': 'Grilled Chicken', 'price': 3.00},
//                 ],
//               ),
//               addonList: ['source'],
//               specialNote: 'half boil',
//               totalPrice: 5000.00),
//         ],
//         tableId: 005),
//     Order(
//         orderStatus: OrderStatus.Completed,
//         orderTotal: 5000.50,
//         orderId: "002",
//         orderItemList: [
//           OrderItem(
//               quantity: 5,
//               orderItemId: 3,
//               menuItem: MenuItem(
//                 id: 3,
//                 name: 'Tomato Basil Soup',
//                 category: 'Soup',
//                 imageUrl:
//                     'https://saltedmint.com/wp-content/uploads/2024/01/Vegetable-Spring-Rolls-3.jpg',
//                 price: 1350.0,
//                 availableQuantity: 18,
//                 tags: ['Vegan', 'Vegetarian'],
//                 description:
//                     'A comforting bowl of tomato basil soup, made with ripe tomatoes and fresh basil, served hot and perfect for any season. Enjoy the rich and savory flavors in every spoonful.',
//                 addOns: [
//                   {'id': 'b15', 'name': 'Breadsticks', 'price': 1.50},
//                   {'id': 'b16', 'name': 'Extra Basil', 'price': 1.00},
//                 ],
//               ),
//               addonList: ['source'],
//               specialNote: 'half boil',
//               totalPrice: 5000.00),
//           OrderItem(
//               quantity: 3,
//               orderItemId: 2,
//               menuItem: MenuItem(
//                 id: 4,
//                 name: 'Caesar Salad',
//                 category: 'Cold Dishes',
//                 imageUrl:
//                     'https://saltedmint.com/wp-content/uploads/2024/01/Vegetable-Spring-Rolls-3.jpg',
//                 price: 1800.0,
//                 availableQuantity: 10,
//                 tags: ['Vegan', 'Vegetarian'],
//                 description:
//                     'A classic Caesar salad with crisp romaine lettuce, creamy dressing, and crunchy croutons. Topped with parmesan cheese, it’s a timeless favorite.',
//                 addOns: [
//                   {'id': 'b17', 'name': 'Extra Croutons', 'price': 1.50},
//                   {'id': 'b18', 'name': 'Grilled Chicken', 'price': 3.00},
//                 ],
//               ),
//               addonList: ['source'],
//               specialNote: 'half boil',
//               totalPrice: 5000.00),
//
//         ],
//         tableId: 005),
//     Order(
//         orderStatus: OrderStatus.Pending,
//         orderTotal: 89660.50,
//         orderId: "002",
//         orderItemList: [
//           OrderItem(
//               quantity: 5,
//               orderItemId: 3,
//               menuItem: MenuItem(
//                 id: 3,
//                 name: 'Tomato Basil Soup',
//                 category: 'Soup',
//                 imageUrl:
//                 'https://saltedmint.com/wp-content/uploads/2024/01/Vegetable-Spring-Rolls-3.jpg',
//                 price: 1350.0,
//                 availableQuantity: 18,
//                 tags: ['Vegan', 'Vegetarian'],
//                 description:
//                 'A comforting bowl of tomato basil soup, made with ripe tomatoes and fresh basil, served hot and perfect for any season. Enjoy the rich and savory flavors in every spoonful.',
//                 addOns: [
//                   {'id': 'b15', 'name': 'Breadsticks', 'price': 1.50},
//                   {'id': 'b16', 'name': 'Extra Basil', 'price': 1.00},
//                 ],
//               ),
//               addonList: ['source'],
//               specialNote: 'half boil',
//               totalPrice: 5000.00),
//           OrderItem(
//               quantity: 3,
//               orderItemId: 2,
//               menuItem: MenuItem(
//                 id: 4,
//                 name: 'Caesar Salad',
//                 category: 'Cold Dishes',
//                 imageUrl:
//                 'https://saltedmint.com/wp-content/uploads/2024/01/Vegetable-Spring-Rolls-3.jpg',
//                 price: 1800.0,
//                 availableQuantity: 10,
//                 tags: ['Vegan', 'Vegetarian'],
//                 description:
//                 'A classic Caesar salad with crisp romaine lettuce, creamy dressing, and crunchy croutons. Topped with parmesan cheese, it’s a timeless favorite.',
//                 addOns: [
//                   {'id': 'b17', 'name': 'Extra Croutons', 'price': 1.50},
//                   {'id': 'b18', 'name': 'Grilled Chicken', 'price': 3.00},
//                 ],
//               ),
//               addonList: ['source'],
//               specialNote: 'half boil',
//               totalPrice: 5000.00),
//
//         ],
//         tableId: 005),
//     Order(
//         orderStatus: OrderStatus.Preparing,
//         orderTotal: 10600.50,
//         orderId: "002",
//         orderItemList: [
//           OrderItem(
//               quantity: 5,
//               orderItemId: 3,
//               menuItem: MenuItem(
//                 id: 3,
//                 name: 'Tomato Basil Soup',
//                 category: 'Soup',
//                 imageUrl:
//                 'https://saltedmint.com/wp-content/uploads/2024/01/Vegetable-Spring-Rolls-3.jpg',
//                 price: 1350.0,
//                 availableQuantity: 18,
//                 tags: ['Vegan', 'Vegetarian'],
//                 description:
//                 'A comforting bowl of tomato basil soup, made with ripe tomatoes and fresh basil, served hot and perfect for any season. Enjoy the rich and savory flavors in every spoonful.',
//                 addOns: [
//                   {'id': 'b15', 'name': 'Breadsticks', 'price': 1.50},
//                   {'id': 'b16', 'name': 'Extra Basil', 'price': 1.00},
//                 ],
//               ),
//               addonList: ['source'],
//               specialNote: 'half boil',
//               totalPrice: 5000.00),
//           OrderItem(
//               quantity: 3,
//               orderItemId: 2,
//               menuItem: MenuItem(
//                 id: 4,
//                 name: 'Caesar Salad',
//                 category: 'Cold Dishes',
//                 imageUrl:
//                 'https://saltedmint.com/wp-content/uploads/2024/01/Vegetable-Spring-Rolls-3.jpg',
//                 price: 1800.0,
//                 availableQuantity: 10,
//                 tags: ['Vegan', 'Vegetarian'],
//                 description:
//                 'A classic Caesar salad with crisp romaine lettuce, creamy dressing, and crunchy croutons. Topped with parmesan cheese, it’s a timeless favorite.',
//                 addOns: [
//                   {'id': 'b17', 'name': 'Extra Croutons', 'price': 1.50},
//                   {'id': 'b18', 'name': 'Grilled Chicken', 'price': 3.00},
//                 ],
//               ),
//               addonList: ['source'],
//               specialNote: 'half boil',
//               totalPrice: 5000.00),
//
//         ],
//         tableId: 007),
//     Order(
//         orderStatus: OrderStatus.Completed,
//         orderTotal: 5000.50,
//         orderId: "002",
//         orderItemList: [
//           OrderItem(
//               quantity: 5,
//               orderItemId: 3,
//               menuItem: MenuItem(
//                 id: 3,
//                 name: 'Tomato Basil Soup',
//                 category: 'Soup',
//                 imageUrl:
//                 'https://saltedmint.com/wp-content/uploads/2024/01/Vegetable-Spring-Rolls-3.jpg',
//                 price: 1350.0,
//                 availableQuantity: 18,
//                 tags: ['Vegan', 'Vegetarian'],
//                 description:
//                 'A comforting bowl of tomato basil soup, made with ripe tomatoes and fresh basil, served hot and perfect for any season. Enjoy the rich and savory flavors in every spoonful.',
//                 addOns: [
//                   {'id': 'b15', 'name': 'Breadsticks', 'price': 1.50},
//                   {'id': 'b16', 'name': 'Extra Basil', 'price': 1.00},
//                 ],
//               ),
//               addonList: ['source'],
//               specialNote: 'half boil',
//               totalPrice: 5000.00),
//           OrderItem(
//               quantity: 3,
//               orderItemId: 2,
//               menuItem: MenuItem(
//                 id: 4,
//                 name: 'Caesar Salad',
//                 category: 'Cold Dishes',
//                 imageUrl:
//                 'https://saltedmint.com/wp-content/uploads/2024/01/Vegetable-Spring-Rolls-3.jpg',
//                 price: 1800.0,
//                 availableQuantity: 10,
//                 tags: ['Vegan', 'Vegetarian'],
//                 description:
//                 'A classic Caesar salad with crisp romaine lettuce, creamy dressing, and crunchy croutons. Topped with parmesan cheese, it’s a timeless favorite.',
//                 addOns: [
//                   {'id': 'b17', 'name': 'Extra Croutons', 'price': 1.50},
//                   {'id': 'b18', 'name': 'Grilled Chicken', 'price': 3.00},
//                 ],
//               ),
//               addonList: ['source'],
//               specialNote: 'half boil',
//               totalPrice: 5000.00),
//
//         ],
//         tableId: 006),
//     Order(
//         orderStatus: OrderStatus.Pending,
//         orderTotal: 5030.50,
//         orderId: "008",
//         orderItemList: [
//           OrderItem(
//               quantity: 5,
//               orderItemId: 3,
//               menuItem: MenuItem(
//                 id: 3,
//                 name: 'Tomato Basil Soup',
//                 category: 'Soup',
//                 imageUrl:
//                 'https://saltedmint.com/wp-content/uploads/2024/01/Vegetable-Spring-Rolls-3.jpg',
//                 price: 1350.0,
//                 availableQuantity: 18,
//                 tags: ['Vegan', 'Vegetarian'],
//                 description:
//                 'A comforting bowl of tomato basil soup, made with ripe tomatoes and fresh basil, served hot and perfect for any season. Enjoy the rich and savory flavors in every spoonful.',
//                 addOns: [
//                   {'id': 'b15', 'name': 'Breadsticks', 'price': 1.50},
//                   {'id': 'b16', 'name': 'Extra Basil', 'price': 1.00},
//                 ],
//               ),
//               addonList: ['source'],
//               specialNote: 'half boil',
//               totalPrice: 5000.00),
//           OrderItem(
//               quantity: 3,
//               orderItemId: 2,
//               menuItem: MenuItem(
//                 id: 4,
//                 name: 'Caesar Salad',
//                 category: 'Cold Dishes',
//                 imageUrl:
//                 'https://saltedmint.com/wp-content/uploads/2024/01/Vegetable-Spring-Rolls-3.jpg',
//                 price: 1800.0,
//                 availableQuantity: 10,
//                 tags: ['Vegan', 'Vegetarian'],
//                 description:
//                 'A classic Caesar salad with crisp romaine lettuce, creamy dressing, and crunchy croutons. Topped with parmesan cheese, it’s a timeless favorite.',
//                 addOns: [
//                   {'id': 'b17', 'name': 'Extra Croutons', 'price': 1.50},
//                   {'id': 'b18', 'name': 'Grilled Chicken', 'price': 3.00},
//                 ],
//               ),
//               addonList: ['source'],
//               specialNote: 'half boil',
//               totalPrice: 5000.00),
//
//         ],
//         tableId: 005),
//     Order(
//         orderStatus: OrderStatus.Pending,
//         orderTotal: 5000.50,
//         orderId: "009",
//         orderItemList: [
//           OrderItem(
//               quantity: 5,
//               orderItemId: 3,
//               menuItem: MenuItem(
//                 id: 3,
//                 name: 'Tomato Basil Soup',
//                 category: 'Soup',
//                 imageUrl:
//                 'https://saltedmint.com/wp-content/uploads/2024/01/Vegetable-Spring-Rolls-3.jpg',
//                 price: 1350.0,
//                 availableQuantity: 18,
//                 tags: ['Vegan', 'Vegetarian'],
//                 description:
//                 'A comforting bowl of tomato basil soup, made with ripe tomatoes and fresh basil, served hot and perfect for any season. Enjoy the rich and savory flavors in every spoonful.',
//                 addOns: [
//                   {'id': 'b15', 'name': 'Breadsticks', 'price': 1.50},
//                   {'id': 'b16', 'name': 'Extra Basil', 'price': 1.00},
//                 ],
//               ),
//               addonList: ['source'],
//               specialNote: 'half boil',
//               totalPrice: 5000.00),
//           OrderItem(
//               quantity: 3,
//               orderItemId: 2,
//               menuItem: MenuItem(
//                 id: 4,
//                 name: 'Caesar Salad',
//                 category: 'Cold Dishes',
//                 imageUrl:
//                 'https://saltedmint.com/wp-content/uploads/2024/01/Vegetable-Spring-Rolls-3.jpg',
//                 price: 1800.0,
//                 availableQuantity: 10,
//                 tags: ['Vegan', 'Vegetarian'],
//                 description:
//                 'A classic Caesar salad with crisp romaine lettuce, creamy dressing, and crunchy croutons. Topped with parmesan cheese, it’s a timeless favorite.',
//                 addOns: [
//                   {'id': 'b17', 'name': 'Extra Croutons', 'price': 1.50},
//                   {'id': 'b18', 'name': 'Grilled Chicken', 'price': 3.00},
//                 ],
//               ),
//               addonList: ['source'],
//               specialNote: 'half boil',
//               totalPrice: 800.00),
//
//         ],
//         tableId: 007),
//   ];
// }
