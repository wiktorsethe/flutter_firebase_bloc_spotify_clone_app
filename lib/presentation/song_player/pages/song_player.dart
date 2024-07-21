import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterspotifycloneapp/common/widgets/appBar/app_bar.dart';
import 'package:flutterspotifycloneapp/core/configs/constants/app_urls.dart';
import 'package:flutterspotifycloneapp/core/configs/theme/app_colors.dart';
import 'package:flutterspotifycloneapp/domain/entities/song/song.dart';
import 'package:flutterspotifycloneapp/presentation/song_player/bloc/song_player_cubit.dart';
import 'package:flutterspotifycloneapp/presentation/song_player/bloc/song_player_state.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity songEntity;
  const SongPlayerPage({super.key, required this.songEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: const Text(
          'Now playing',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        action: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert_rounded
          ),
        ),
      ),
      body: BlocProvider(
        create: (_) => SongPlayerCubit()..loadSong(
            '${AppUrls.songFirestorage}${songEntity.artist} - ${songEntity.title}.mp3?${AppUrls.mediaAlt}'
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Column(
            children: [
              _songCover(context),
        
              const SizedBox(height: 20,),
        
              _songDetail(),

              const SizedBox(height: 30,),

              _songPlayer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              '${AppUrls.coverFirestorage}${songEntity.artist} - ${songEntity.title}.jpeg?${AppUrls.mediaAlt}'
          )
        )
      )
    );
  }

  Widget _songDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntity.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5,),

            Text(
              songEntity.artist,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),

        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outline_outlined,
              size: 35,
              color: AppColors.darkGrey,
            )
        )
      ],
    );
  }

  Widget _songPlayer() {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
      builder: (context, state) {
        if(state is SongPlayerLoading) {
          return const CircularProgressIndicator();
        }
        if(state is SongPlayerLoaded) {
          return Column(
            children: [
              Slider(
                value: context.read<SongPlayerCubit>().songPosition.inSeconds.toDouble(),
                min: 0,
                max: context.read<SongPlayerCubit>().songDuration.inSeconds.toDouble(),
                onChanged: (value) {}
              ),

              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatDuration(
                        context.read<SongPlayerCubit>().songPosition,
                    )
                  ),

                  Text(
                    formatDuration(
                      context.read<SongPlayerCubit>().songDuration,
                    )
                  )
                ],
              ),

              const SizedBox(height: 20,),

              GestureDetector(
                onTap: () {
                  context.read<SongPlayerCubit>().playOrPauseSong();
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: Icon(
                    context.read<SongPlayerCubit>().audioPlayer.playing ? Icons.pause : Icons.play_arrow
                  ),
                ),
              )
            ],
          );
        }

        return Container();
      },
    );
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
