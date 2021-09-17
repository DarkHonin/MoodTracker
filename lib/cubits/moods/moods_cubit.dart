import 'package:bloc/bloc.dart';
import 'package:mood_tracker/helper/json_helper.dart';

part './moods_state.dart';

class MoodsCubit extends Cubit<MoodsState> {
  final JsonHelper jsonHelper;
  MoodsCubit(this.jsonHelper) : super(MoodsState());

  loadMoods() async {}

  createMood() async {}
}
