import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musiq/injection.dart' as di;
import 'package:musiq/presentation/bloc/music_bloc.dart';
import 'package:musiq/presentation/bloc/player_bloc.dart';
import 'package:musiq/presentation/pages/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<MusicBloc>()),
        BlocProvider(create: (_) => di.locator<PlayerBloc>()),
      ],
      child: MaterialApp(
        title: 'musiQ',
        home: MainPage(),
      ),
    );
  }
}
