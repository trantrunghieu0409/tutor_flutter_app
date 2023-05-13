import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/tutor_entity.dart';
import 'package:tutor_flutter_app/presentation/providers/tutor_notifier.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/button_column.dart';
import 'package:tutor_flutter_app/presentation/widgets/tutor_detail/feedback_row.dart';

class ButtonSection extends ConsumerStatefulWidget {
  const ButtonSection({super.key, required this.tutor});

  final TutorEntity tutor;

  @override
  ConsumerState<ButtonSection> createState() => _ButtonSectionState();
}

class _ButtonSectionState extends ConsumerState<ButtonSection> {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ButtonColumn(
            color: widget.tutor.isFavorite ? Colors.red : color,
            icon: widget.tutor.isFavorite
                ? Icons.favorite
                : Icons.favorite_outline,
            label: 'Favorite',
            callback: () {
              setState(() {
                widget.tutor.toggleFavorite();
                ref
                    .read(tutorsProvider.notifier)
                    .toggleFavorite(widget.tutor.userId);
              });
            }),
        ButtonColumn(
          color: color,
          icon: Icons.list_alt_outlined,
          label: 'Reviews',
          callback: () {
            _showReviews();
          },
        ),
        ButtonColumn(
          color: color,
          icon: Icons.report_outlined,
          label: 'Report',
          callback: () {
            _showReportConfirmDialog();
          },
        ),
      ],
    );
  }

  Future<void> _showReviews() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return GestureDetector(
          child: AlertDialog(
            title: Text(
              'Reviews about ${widget.tutor.name}',
              style: CommonTextStyle.h2Second,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                  children: List<Widget>.generate(
                      widget.tutor.feedbacks.length,
                      (index) => Column(
                            children: [
                              FeedbackRow(
                                  feedback: widget.tutor.feedbacks[index]),
                              const SizedBox(
                                height: 32,
                              )
                            ],
                          ))),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showReportConfirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return GestureDetector(
          child: AlertDialog(
            title: Text('Report - ${widget.tutor.name}'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('What do you want to report?'),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 3, color: Colors.greenAccent),
                      ),
                    ),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel")),
              ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _showReportResultDialog();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showReportResultDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Report successfully'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                    'We\'ve received your report and will take care of this case carefully.'),
              ],
            ),
          ),
          actions: <Widget>[
            OutlinedButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
