import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserBirthField extends StatefulWidget {
  final String birth;
  final Function updateBirth;

  UserBirthField(this.birth, this.updateBirth);

  @override
  _UserBirthFieldState createState() => _UserBirthFieldState();
}

class _UserBirthFieldState extends State<UserBirthField> {
  final dd = TextEditingController();
  final mm = TextEditingController();
  final yyyy = TextEditingController();

  @override
  void initState() {
    if (widget.birth + '' != '') {
      _setValue(widget.birth);
    }

    super.initState();
  }

  @override
  void dispose() {
    dd.dispose();
    mm.dispose();
    yyyy.dispose();
    super.dispose();
  }

  void _datePicker(context) {
    showDatePicker(
      context: context,
      initialDate: widget.birth + '' != ''
          ? DateTime.parse(widget.birth)
          : DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      widget.updateBirth(pickedDate);
      _setValue(pickedDate.toString());
    });
  }

  void _setValue(String date) {
    dd.text = DateFormat.d().format(DateTime.parse(date));
    mm.text = DateFormat.M().format(DateTime.parse(date));
    yyyy.text = DateFormat.y().format(DateTime.parse(date));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: InkWell(
        onTap: () {
          _datePicker(context);
        },
        child: Stack(
          children: [
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Birth DD',
                        border: OutlineInputBorder(gapPadding: 0),
                      ),
                      controller: dd,
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Birth MM',
                        border: OutlineInputBorder(gapPadding: 0),
                      ),
                      controller: mm,
                    ),
                  ),
                ),
                Flexible(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Birth YYYY',
                      border: OutlineInputBorder(gapPadding: 0),
                    ),
                    controller: yyyy,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                _datePicker(context);
              },
              child: Container(height: 60),
            )
          ],
        ),
      ),
    );
  }
}
