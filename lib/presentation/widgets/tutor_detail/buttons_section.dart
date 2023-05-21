import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutor_flutter_app/core/constants/common_text_style.dart';
import 'package:tutor_flutter_app/domain/entities/tutor/tutor_entity.dart';
import 'package:tutor_flutter_app/presentation/providers/tutor_notifier.dart';
import 'package:tutor_flutter_app/presentation/widgets/common/button_column.dart';
import 'package:tutor_flutter_app/presentation/widgets/tutor_detail/feedback_row.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            label: AppLocalizations.of(context)!.favor,
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
          label: AppLocalizations.of(context)!.reviews,
          callback: () {
            _showReviews();
          },
        ),
        ButtonColumn(
          color: color,
          icon: Icons.report_outlined,
          label: AppLocalizations.of(context)!.report,
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
              '${AppLocalizations.of(context)!.review_about} ${widget.tutor.name}',
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
                child: Text(AppLocalizations.of(context)!.close),
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
            title: Text(
                '${AppLocalizations.of(context)!.report} - ${widget.tutor.name}'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(AppLocalizations.of(context)!.report_ques),
                  const SizedBox(
                    height: 12,
                  ),
                  const TextField(
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
                  child: Text(AppLocalizations.of(context)!.cancel)),
              ElevatedButton(
                child: Text(AppLocalizations.of(context)!.submit),
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
          title: Text(AppLocalizations.of(context)!.report_success),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(AppLocalizations.of(context)!.report_success_desc),
              ],
            ),
          ),
          actions: <Widget>[
            OutlinedButton(
              child: Text(AppLocalizations.of(context)!.close),
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
