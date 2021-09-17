import 'package:flutter/material.dart';

class MoodCreate extends StatefulWidget {
  const MoodCreate({Key? key}) : super(key: key);

  @override
  _MoodCreateState createState() => _MoodCreateState();
}

class _MoodCreateState extends State<MoodCreate> {
  final _formKey = GlobalKey<FormState>();
  final _moodNameControler = TextEditingController();
  double slider = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SizedBox(
      width: 400,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _moodNameControler,
                decoration: InputDecoration(hintText: "Mood name"),
              ),
              Row(
                children: [
                  Text(slider.toString()),
                  Expanded(
                      child: Slider(
                    min: -5,
                    max: 5,
                    value: slider,
                    divisions: 10,
                    onChanged: (v) {
                      setState(() {
                        slider = v;
                      });
                    },
                  ))
                ],
              ),
              MaterialButton(
                onPressed: () {
                  print({slider, _moodNameControler.value});
                },
                child: Text("Create Mood"),
              )
            ],
          ),
        ),
      ),
    )));
  }
}
