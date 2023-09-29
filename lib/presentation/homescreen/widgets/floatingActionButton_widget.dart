import 'dart:async';
import 'package:elevate/application/audio/audio_bloc.dart';
import 'package:elevate/application/story/story_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record/record.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  const FloatingActionButtonWidget({
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
    //listen to the state of the audio
    _recordSub = _audioRecorder.onStateChanged().listen((recordState) {
      setState(() => _recordState = recordState);
    });

    super.initState();
  }

  Future<void> _start() async {
    try {
      //check if the app has permission to record audio
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

//function to start the timer
  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });
  }

//function to stop the recording
  Future<void> _stop() async {
    _timer?.cancel();
    _recordDuration = 0;

    final path = await _audioRecorder.stop();

    if (path != null) {
      context.read<AudioBloc>().add(AudioEvent.postAudio(path: path));
    }
  }

//function to pause the recording
  Future<void> _pause() async {
    _timer?.cancel();
    await _audioRecorder.pause();
  }

//function to resume the recording
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
                    //fetching the next story
                    context.read<StoryBloc>().add(StoryEvent.fetchStory());
                    //clearing the audio state
                    context.read<AudioBloc>().add(AudioEvent.clearState());
                  },
                  child: Icon(Icons.skip_next),
                ),
              ),
            ],
          );
        }
        //if the audio is loading then return empty container
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
                  //if the audio is playing then stop it else start it
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
                if (_recordState == RecordState.stop) {
                  //fetching the next story
                  context.read<StoryBloc>().add(StoryEvent.fetchStory());
                  return;
                }
                //if the audio is playing then pause it else resume it
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
