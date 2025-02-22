import 'package:elevate/application/audio/audio_bloc.dart';
import 'package:elevate/application/story/story_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tts/flutter_tts.dart';

class StoryWidget extends StatelessWidget {
  StoryWidget({
    super.key,
  });
  final FlutterTts flutterTts = FlutterTts();
  speak(String text) async {
    await flutterTts.setLanguage('en-uk');
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

//funation to show the popup menu of mispronounced words and speak them
  void showPopupMenu(BuildContext context, Offset position, String text) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final Animation<double> scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: ModalRoute.of(context)!.animation!,
        curve: Curves.fastOutSlowIn,
      ),
    );

    final RelativeRect positionRect = RelativeRect.fromRect(
      Rect.fromPoints(position, position.translate(0.0, 1.0)),
      Offset.zero & overlay.size,
    );

    showMenu(
      color: Theme.of(context).colorScheme.background,
      context: context,
      position: positionRect,
      items: <PopupMenuEntry>[
        PopupMenuItem(
          value: 'item3',
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(text, style: TextStyle(fontSize: 60.sp)),
                IconButton(
                  color: Theme.of(context).colorScheme.tertiary,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.tertiaryContainer,
                    ),
                    elevation: MaterialStateProperty.all(50),
                  ),
                  //speaking the mispronounced word
                  onPressed: () => speak(text),
                  icon: Icon(
                    Icons.multitrack_audio_rounded,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ).then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<StoryBloc>().add(StoryEvent.fetchStory());
    });
    return BlocBuilder<AudioBloc, AudioState>(
      builder: (context, state1) {
        return BlocBuilder<StoryBloc, StoryState>(
          builder: (context, state) {
            //if the story is loading then show the loading indicator
            if (state1.isLoading) {
              return Expanded(
                child: Center(
                  child: SpinKitWave(
                    color: Theme.of(context).colorScheme.primary,
                    size: 100.sp,
                  ),
                ),
              );
            } else {
              //if the story is loaded then show the story
              if (state1.currectedorfailure.isSome()) {
                return state1.currectedorfailure.fold(() {
                  return const SizedBox();
                }, (a) {
                  return a.fold((l) {
                    return Expanded(
                      child: Center(
                        child: Text(
                          l.map(
                            serverFailure: (_) => "Server is down",
                            clientFailure: (_) => "Something went wrong",
                            firebaseFailure: (value) => value.message,
                            otherFailure: (value) => value.message,
                          ),
                        ),
                      ),
                    );
                  }, (r) {
                    ///splitting the story into words
                    final _words = state.story!.split(RegExp(r'[ .]'));
                    _words.removeWhere((word) => word.isEmpty);
                    final List<TextSpan> spans = [];
                    for (int i = 0; i < _words.length; i++) {
                      TextStyle style;
                      if (r.comparisonResult![i].isCorrect == "A") {
                        style = TextStyle(
                          fontSize: 69.sp,
                          fontFamily: "Outfit",
                          fontWeight: FontWeight.w400,
                          height: 1.38,
                          color: Theme.of(context).colorScheme.background,
                        );
                      } else {
                        style = TextStyle(
                          fontSize: 69.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Outfit",
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red,
                          decorationStyle: TextDecorationStyle.wavy,
                          color: Theme.of(context).colorScheme.background,
                        );
                      }
                      spans.add(TextSpan(
                          text: "${_words[i]} ",
                          style: style,
                          recognizer: TapGestureRecognizer()
                            ..onTapDown = (de) {
                              if (r.comparisonResult![i].isCorrect != "A") {
                                showPopupMenu(
                                    context, de.globalPosition, _words[i]);
                              }
                            }));
                    }
                    //showing the story with highlighted mispronounced words
                    return Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                RichText(
                                  text: TextSpan(children: spans),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: 150.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
                });
              } else {
                //if the story is loading then show the loading indicator
                if (state.isLoading) {
                  return Expanded(
                    child: Center(
                      child: SpinKitWave(
                        color: Theme.of(context).colorScheme.primary,
                        size: 100.sp,
                      ),
                    ),
                  );
                } else {
                  return state.failureOrStory.fold(() => const SizedBox(), (a) {
                    return a.fold((l) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            l.map(
                              serverFailure: (_) => "Server Failure",
                              clientFailure: (_) => "Client Failure",
                              firebaseFailure: (value) => value.message,
                              otherFailure: (value) => value.message,
                            ),
                          ),
                        ),
                      );
                    }, (r) {
                      //showing the story
                      return Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(r,
                                      style: TextStyle(
                                          fontSize: 68.sp,
                                          fontFamily: "Outfit",
                                          fontWeight: FontWeight.w400,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background)),
                                  SizedBox(
                                    height: 150.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
                  });
                }
              }
            }
          },
        );
      },
    );
  }
}
