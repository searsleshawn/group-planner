// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:go_router/go_router.dart';
// import 'package:your_project/home_page.dart'; // Update with your actual path

// void main() {
//   // A helper function to set up the test environment with the router
//   Widget createHomePage() {
//     return MaterialApp(
//       routerDelegate: GoRouter(
//         routes: [
//           // Define the routes for the tests
//           GoRoute(
//             path: '/',
//             builder: (context, state) => const HomePage(),
//           ),
//           GoRoute(
//             path: '/create-group',
//             builder: (context, state) => const Scaffold(body: Text('Create Group Page')),
//           ),
//           GoRoute(
//             path: '/profile',
//             builder: (context, state) => const Scaffold(body: Text('Profile Page')),
//           ),
//         ],
//       ),
//       routeInformationParser: GoRouteInformationParser(),
//     );
//   }

//   testWidgets('HomePage renders with expected text', (WidgetTester tester) async {
//     await tester.pumpWidget(createHomePage());

//     // Check that the text is displayed
//     expect(find.text('No groups available. Start by creating one!'), findsOneWidget);
//   });

//   testWidgets('Navigates to Create Group page on app bar button tap', (WidgetTester tester) async {
//     await tester.pumpWidget(createHomePage());

//     // Tap the create group icon in the app bar
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pumpAndSettle();

//     // Check that the Create Group page is displayed
//     expect(find.text('Create Group Page'), findsOneWidget);
//   });

//   testWidgets('Navigates to Create Group page on FAB tap', (WidgetTester tester) async {
//     await tester.pumpWidget(createHomePage());

//     // Tap the Floating Action Button
//     await tester.tap(find.byType(FloatingActionButton));
//     await tester.pumpAndSettle();

//     // Check that the Create Group page is displayed
//     expect(find.text('Create Group Page'), findsOneWidget);
//   });

//   testWidgets('Navigates to Profile page on profile icon tap', (WidgetTester tester) async {
//     await tester.pumpWidget(createHomePage());

//     // Tap the profile icon in the app bar
//     await tester.tap(find.byIcon(Icons.person));
//     await tester.pumpAndSettle();

//     // Check that the Profile page is displayed
//     expect(find.text('Profile Page'), findsOneWidget);
//   });
// }
