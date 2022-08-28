import 'package:flutter/material.dart';
import 'package:musiq/presentation/bloc/music_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musiq/presentation/bloc/music_event.dart';
import 'package:musiq/presentation/bloc/music_state.dart';
import 'package:musiq/presentation/widgets/music_card.dart';
import 'package:musiq/presentation/widgets/music_bar.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(child: Text('Music Search', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (query) {
                context.read<MusicBloc>().add(OnQueryChanged(query));
              },
              decoration: const InputDecoration(
                hintText: 'Search track',
                prefixIcon: Icon(Icons.search),
                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(
              height: 8,
            ),
            BlocBuilder<MusicBloc, MusicState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is SearchError) {
                  return Expanded(
                    child: Center(
                      child: Text(state.message),
                    ),
                  );
                } else if (state is SearchHasData) {
                  final result = state.result;
                  return Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final music = result[index];
                        return MusicCard(music, index);
                      },
                      itemCount: result.length,
                    ),
                  );
                } else {
                  return const Expanded(child: Center(child: Text('Start a search', style: TextStyle(fontSize: 20))));
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: MusicBar(),
    );
  }
}
