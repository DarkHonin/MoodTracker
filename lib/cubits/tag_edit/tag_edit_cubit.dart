import 'package:bloc/bloc.dart';
import 'package:mood_tracker/models/tag.dart';

part './tag_edit_state.dart';

class TagEditCubit extends Cubit<TagEditState> {
  TagEditCubit() : super(TagEditInitState());

  addTag(String tag) {
    List<Tag> whAn =
        state.tags.where((element) => element.value == tag).toList();
    if (!whAn.isEmpty) return;
    state.tags.add(Tag(value: tag, dateTime: DateTime.now()));
    emit(TagsEditChangedState(state));
  }

  removeTag(String name) {
    List<Tag> whAn =
        state.tags.where((element) => element.value == name).toList();
    if (whAn.isEmpty) return;
    whAn.forEach((element) {
      state.tags.remove(element);
    });
    emit(TagsEditChangedState(state));
  }
}
