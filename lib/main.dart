import 'package:ecoommerce/injection.dart';
import 'package:ecoommerce/presentation/bloc/local/localproductbloc.dart';
import 'package:ecoommerce/presentation/bloc/remote/productsbloc.dart';
import 'package:ecoommerce/presentation/pages/productscreen.dart';
import 'package:ecoommerce/presentation/pages/spalshscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final globalContext = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initilaizeDependecies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: locator<ProductsBloc>()),
        BlocProvider.value(value: locator<LocalProductBloc>())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: globalContext,
        title: 'E-Commerce App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
