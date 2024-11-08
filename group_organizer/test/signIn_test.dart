// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:your_project/auth/sign_in_service.dart';
// import 'package:your_project/app_state.dart';

// // Mock Firebase Auth
// class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// void main() {
//   group('SignInService Tests', () {
//     MockFirebaseAuth mockFirebaseAuth;
//     SignInService signInService;

//     setUp(() {
//       mockFirebaseAuth = MockFirebaseAuth();
//       signInService = SignInService(auth: mockFirebaseAuth);
//     });

//     test('Sign in with valid credentials', () async {
//       when(mockFirebaseAuth.signInWithEmailAndPassword(
//           email: 'user@example.com', password: 'password123'))
//           .thenAnswer((_) async => MockUserCredential()); // Success

//       final result = await signInService.signIn('user@example.com', 'password123');
//       expect(result, isTrue);
//     });

//     test('Sign in with invalid credentials should fail', () async {
//       when(mockFirebaseAuth.signInWithEmailAndPassword(
//           email: 'wronguser@example.com', password: 'wrongpassword'))
//           .thenThrow(FirebaseAuthException(code: 'invalid-credential'));

//       expect(
//         () async => await signInService.signIn('wronguser@example.com', 'wrongpassword'),
//         throwsA(isA<FirebaseAuthException>()),
//       );
//     });

//     test('Sign in with empty credentials should return error', () async {
//       expect(
//         () async => await signInService.signIn('', ''),
//         throwsA(isA<ArgumentError>()),
//       );
//     });
//   });
// }
