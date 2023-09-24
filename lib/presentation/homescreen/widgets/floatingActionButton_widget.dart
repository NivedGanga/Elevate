import 'dart:async';

import 'package:dio/dio.dart';
import 'package:elevate/application/audio/audio_bloc.dart';
import 'package:elevate/application/story/story_bloc.dart';
import 'package:elevate/domain/user_details/model/user_model.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record/record.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  FloatingActionButtonWidget({
    super.key,
  });

  @override
  State<FloatingActionButtonWidget> createState() =>
      _FloatingActionButtonWidgetState();
}

class _FloatingActionButtonWidgetState
    extends State<FloatingActionButtonWidget> {
  int _recordDuration = 0;

  Timer? _timer;

  final _audioRecorder = Record();

  StreamSubscription<RecordState>? _recordSub;

  RecordState _recordState = RecordState.stop;

  StreamSubscription<Amplitude>? _amplitudeSub;

  @override
  void initState() {
    _recordSub = _audioRecorder.onStateChanged().listen((recordState) {
      setState(() => _recordState = recordState);
    });

    super.initState();
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        final isSupported = await _audioRecorder.isEncoderSupported(
          AudioEncoder.aacLc,
        );
        if (kDebugMode) {
          print('${AudioEncoder.aacLc.name} supported: $isSupported');
        }

        await _audioRecorder.start();
        _recordDuration = 0;

        _startTimer();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });
  }

  Future<void> _stop() async {
    _timer?.cancel();
    _recordDuration = 0;

    final path = await _audioRecorder.stop();

    if (path != null) {
      context.read<AudioBloc>().add(AudioEvent.postAudio(path: path));
    }
  }

  Future<void> _pause() async {
    _timer?.cancel();
    await _audioRecorder.pause();
  }

  Future<void> _resume() async {
    _startTimer();
    await _audioRecorder.resume();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _recordSub?.cancel();
    _amplitudeSub?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioBloc, AudioState>(
      builder: (context, state) {
        if (state.currectedorfailure.isSome()) {
          return Row(
            children: [
              SizedBox(
                width: 95.w,
              ),
              Expanded(
                child: FloatingActionButton(
                  heroTag: 'next',
                  onPressed: () {
                    context.read<StoryBloc>().add(StoryEvent.fetchStory());
                    context.read<AudioBloc>().add(AudioEvent.clearState());
                  },
                  child: Icon(Icons.skip_next),
                ),
              ),
            ],
          );
        }
        if (state.isLoading) {
          return SizedBox();
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 95.w,
            ),
            Expanded(
              child: FloatingActionButton(
                heroTag: 'speak',
                onPressed: () {
                  (_recordState != RecordState.stop) ? _stop() : _start();
                },
                child: _recordState == RecordState.stop
                    ? Icon(Icons.mic)
                    : Icon(Icons.stop),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.background,
              onPressed: () {
                (_recordState == RecordState.pause) ? _resume() : _pause();
              },
              child: _recordState == RecordState.stop
                  ? Icon(Icons.restart_alt_sharp)
                  : _recordState == RecordState.pause
                      ? Icon(Icons.play_arrow)
                      : Icon(Icons.pause),
              heroTag: 'restart',
            ),
          ],
        );
      },
    );
  }
}
