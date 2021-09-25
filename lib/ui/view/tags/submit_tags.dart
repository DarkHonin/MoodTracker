import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_tracker/core/dependency_injection.dart';
import 'package:mood_tracker/cubits/tag_edit/tag_edit_cubit.dart';
import 'package:mood_tracker/models/tag.dart';

class SubmitTagsView extends StatefulWidget {
  const SubmitTagsView({Key? key}) : super(key: key);

  @override
  _SubmitTagsViewState createState() => _SubmitTagsViewState();
}

class _SubmitTagsViewState extends State<SubmitTagsView> {
  final TextEditingController _tag = TextEditingController();

  _submitTags(String text) {}
  _generateTagList(List<Tag> tags) {
    return Wrap(
      children: tags
          .map((e) => Container(
              padding: EdgeInsets.all(4),
              child: Chip(
                label: Text(e.value),
                onDeleted: () {
                  sl<TagEditCubit>().removeTag(e.value);
                },
              )))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 400,
      child: Column(
        children: [
          TextField(
            controller: _tag,
            onChanged: (v) {
              if (v.isEmpty) return;
              final lastChar = v[v.length - 1];
              if (lastChar == ',') {
                sl<TagEditCubit>().addTag(v.substring(0, v.length - 1));
                FocusScope.of(context).unfocus();
                _tag.clear();
              }
            },
          ),
          Container(
              padding: EdgeInsets.all(8),
              child: BlocBuilder(
                bloc: sl<TagEditCubit>(),
                builder: (c, s) {
                  if (s is TagEditInitState) {
                    _tag.text = s.tagText;
                    return _generateTagList(s.tags);
                  }
                  if (s is TagsEditChangedState) {
                    return _generateTagList(s.tags);
                  }
                  return Container();
                },
              ))
        ],
      ),
    ));
  }
}
