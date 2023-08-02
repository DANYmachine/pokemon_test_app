import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_test_app/feature/presentation/bloc/get_all_pokemons_bloc/get_all_pokemons_bloc.dart';
import 'package:pokemon_test_app/service_locator.dart' as di;

import 'feature/presentation/pages/pokemons_page.dart';
import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetAllPokemonsBloc>(
          create: (context) =>
              sl<GetAllPokemonsBloc>()..add(GetPokemonsEvent()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
