import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rt_karate_academy/model/events_model.dart';

class EventWidget extends StatelessWidget {
  final Event data;

  const EventWidget(
    this.data, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://t3.ftcdn.net/jpg/00/74/43/82/360_F_74438276_80yZYtaCBwZ0CZ5CDSL1n21P58B2cIPa.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 20,
                          color: Colors.blue,
                        ),
                        Text(
                          data.date.toString(),
                          // '06 Jan 21, 9.00 AM',
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 170,
                      child: Text(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        data.description,
                        style: TextStyle(),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
