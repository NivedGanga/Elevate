import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elevate/domain/failure/main_failure.dart';
import 'package:elevate/domain/story/i_story_repo.dart';
import 'package:elevate/domain/story/model/story.dart';
import 'package:elevate/domain/user_details/model/user_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IStoryRepo)
class StoryRepo extends IStoryRepo {
  @override
  Future<Either<MainFailure, String>> getStory() async {
    try {
      final data = {'user_id': UserModel.instance.uid};
      print(data);
      final Response response = await Dio(BaseOptions()).get(
        'https://elevate01.azurewebsites.net/content/get/stories/',
        data: data,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final String? msg = response.data["message"];
        // final story = StoryModel.fromJson(response.data.toString());
        return right(msg ?? "");
      } else {
        return left(const MainFailure.serverFailure());
      }
    } catch (e) {
      return left(const MainFailure.clientFailure());
    }
  }
}
