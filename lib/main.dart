import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 0, 255, 255)
);
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 0, 0, 0),
);
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn){
    runApp(
        MaterialApp(
          darkTheme: ThemeData.dark().copyWith(
              inputDecorationTheme: const InputDecorationTheme().copyWith(
                fillColor: kDarkColorScheme.primaryContainer,
                border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
              ),
              colorScheme: kDarkColorScheme,
              cardTheme: const CardTheme().copyWith(
                color: kDarkColorScheme.primaryContainer,
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
              textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kDarkColorScheme.onSecondaryContainer,
                  fontSize: 16,
                ),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
                backgroundColor: kDarkColorScheme.onPrimaryContainer,
                foregroundColor: kDarkColorScheme.primaryContainer,
              )),
              dropdownMenuTheme: ThemeData().dropdownMenuTheme.copyWith(
                textStyle: ThemeData().textTheme.titleLarge,
              )

          ),
          themeMode: ThemeMode.system,
          home:const   Expenses(),
          theme: ThemeData().copyWith(
              colorScheme: kColorScheme,
              appBarTheme: const AppBarTheme().copyWith(
                backgroundColor: kColorScheme
                    .onPrimaryContainer,
                foregroundColor: kColorScheme.primaryContainer,
              ),
              cardTheme: const CardTheme().copyWith(
                color: kColorScheme.primaryContainer,
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
                backgroundColor: kColorScheme.onPrimaryContainer,
                foregroundColor: kColorScheme.primaryContainer,
              )),
              textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kColorScheme.onSecondaryContainer,
                  fontSize: 16,
                ),
              )
          ),

          debugShowCheckedModeBanner: false,
        )
    );
  // });

}
