part of './tag_edit_cubit.dart';

class TagEditState {
  final String tagText;
  final List<Tag> tags;
  TagEditState(this.tagText, this.tags);
}

class TagEditInitState extends TagEditState {
  TagEditInitState() : super("", []);
}

class TagsEditChangedState extends TagEditState {
  final TagEditState _;
  TagsEditChangedState(this._) : super(_.tagText, _.tags);
}
