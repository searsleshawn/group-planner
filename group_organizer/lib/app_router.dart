// app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:group_organizer/create_group_page.dart';
import 'package:provider/provider.dart';

import 'welcome_page.dart';
import 'home_page.dart';
import 'app_state.dart';  

class AppRouter {
  final ApplicationState appState;

  AppRouter(this.appState);

  GoRouter get router => GoRouter(
    initialLocation: "/welcome-page",
    refreshListenable: appState, // listen to appState changes
    redirect: (context, state) {
      if (appState.loggedIn && appState.onHomePage){
        return '/home-page';
      }
      return null;
    },
    routes: [
      // GoRoute(
      //   name: "root",
      //   path: "/",
      //   builder: (context, state) => HomePage(),
      // ),
      GoRoute(
        name:"/sign-in",
        path: '/sign-in',
        builder: (context, state) {
          return SignInScreen(
            actions: [
              ForgotPasswordAction(((context, email) {
                final uri = Uri(
                  path: '/sign-in/forgot-password',
                  queryParameters: <String, String?>{
                    'email': email,
                  },
                );
                context.push(uri.toString());
              })),
              AuthStateChangeAction(((context, state) {
                final user = switch (state) {
                  SignedIn state => state.user,
                  UserCreated state => state.credential.user,
                  _ => null
                };
                if (user == null) return;

                if (state is UserCreated) {
                  user.updateDisplayName(user.email!.split('@')[0]);
                }
                if (!user.emailVerified) {
                  user.sendEmailVerification();
                  const snackBar = SnackBar(
                      content: Text(
                          'Please check your email to verify your email address'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                appState.onHomePage = true;
                context.go('/home-page');
              })),
            ],
          );
        },
        routes: [
          GoRoute(
            name: "forgot-password",
            path: 'forgot-password',
            builder: (context, state) {
              final arguments = state.uri.queryParameters;
              return ForgotPasswordScreen(
                email: arguments['email'],
                headerMaxExtent: 200,
              );
            },
          ),
        ],
      ),
      GoRoute(
        name: "/home-page",
        path: '/home-page',
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            name: "profile",
            path: "profile",
            builder: (context, state) => ProfileScreen(
              providers: const [],
              actions: [
                //we're immediately jumping to the signedOutAction here even when appState.loggedIn==true
                SignedOutAction((context) {
                  context.pushReplacement('/welcome-page');
                }),
              ],
            )
          ),
          GoRoute(
            name: "create-group",
            path: "create-group",
            builder: (context, state) => const CreateGroupPage(),
          ),
        ],

      ),
      GoRoute(
        //redirect: appState.loggedIn ? return context.namedLocation("/home-page") : return "/welcome-page",
        name:"/welcome-page",
        path: '/welcome-page',
        builder: (context, state) {
          return const WelcomePage ();
        },
      ),
    ],
  );


















  // GoRouter get router => GoRouter(
  // initialLocation: "/welcome-page",
  // refreshListenable: appState, // listen to appState changes
  // // redirect: (context, state) {
  // //   return '/home-page';
  // // },
  // routes: <RouteBase>[
  //   GoRoute(
  //     name:"/sign-in",
  //     path: '/sign-in',
  //     builder: (context, state) {
  //       return SignInScreen(
  //         actions: [
  //           ForgotPasswordAction(((context, email) {
  //             final uri = Uri(
  //               path: '/sign-in/forgot-password',
  //               queryParameters: <String, String?>{
  //                 'email': email,
  //               },
  //             );
  //             context.push(uri.toString());
  //           })),
  //           AuthStateChangeAction(((context, state) {
  //             final user = switch (state) {
  //               SignedIn state => state.user,
  //               UserCreated state => state.credential.user,
  //               _ => null
  //             };
  //             if (user == null) return;

  //             if (state is UserCreated) {
  //               user.updateDisplayName(user.email!.split('@')[0]);
  //             }
  //             if (!user.emailVerified) {
  //               user.sendEmailVerification();
  //               const snackBar = SnackBar(
  //                   content: Text(
  //                       'Please check your email to verify your email address'));
  //               ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //             }
  //             context.pushReplacement('/home-page');
  //           })),
  //         ],
  //       );
  //     },
  //     routes: [
  //       GoRoute(
  //         name: "forgot-password",
  //         path: 'forgot-password',
  //         builder: (context, state) {
  //           final arguments = state.uri.queryParameters;
  //           return ForgotPasswordScreen(
  //             email: arguments['email'],
  //             headerMaxExtent: 200,
  //           );
  //         },
  //       ),
  //     ],
  //   ),
  //   GoRoute(
  //     name: "/profile",
  //     path: '/profile',
  //     builder: (context, state) {
  //       return ProfileScreen(
  //         providers: const [],
  //         // actions: [
  //         //   //we're immediately jumping to the signedOutAction here even when appState.loggedIn==true
  //         //   SignedOutAction((context) {
  //         //     context.pushReplacement('/welcome-page');
  //         //   }),
  //         // ],
  //       );
  //     },
  //   ),
  //   GoRoute(
  //     name: "/home-page",
  //     path: '/home-page',
  //     builder: (context, state) {
  //       return const HomePage ();
  //     },
  //   ),
  //   GoRoute(
  //     redirect: appState.loggedIn ? return context.namedLocation("/home-page") : return "/welcome-page",
  //     name:"/welcome-page",
  //     path: '/welcome-page',
  //     builder: (context, state) {
  //       return const WelcomePage ();
  //     },
  //   ),
  //   ],
  // );
}
