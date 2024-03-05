import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter/material.dart';

class GitRepoWidget extends StatefulWidget {
  const GitRepoWidget({super.key});

  @override
  State<GitRepoWidget> createState() => _GitRepoWidgetState();
}

class _GitRepoWidgetState extends State<GitRepoWidget> {
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        color: Colors.white,
        fontSize: 40,
        fontWeight: FontWeight.bold,
        fontFamily: 'Montserrat',
        letterSpacing: 1.5);

    return const Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Git',
          style: textStyle,
        ),
        TimelineWidget(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Repo',
            style: textStyle,
          ),
        ),
        TimelineWidget(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'commits',
            style: textStyle,
          ),
        ),
        TimelineWidget(),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Projects',
                style: textStyle,
              ),
            ),
            SizedBox(width: 10),
            //add a thick line with
          ],
        ),
      ],
    );
  }
}

class TimelineWidget extends StatelessWidget {
  const TimelineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.02,
      beforeLineStyle: const LineStyle(
        color: Colors.white,
      ),
      indicatorStyle: const IndicatorStyle(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
