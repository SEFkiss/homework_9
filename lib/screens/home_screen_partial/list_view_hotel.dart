import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hw9/models/hotels.dart';

class ListViewHotel extends StatelessWidget {
  ListViewHotel({Key? key, @required this.hotels}) : super(key: key);
  List<HotelShortInfo>? hotels;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...hotels!.map((item) => GFCard(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 5),
          boxFit: BoxFit.cover,
          image: Image.asset(
            'assets/images/${item.poster}',
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          showImage: true,
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${item.name}'),
                GFButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/about', arguments: {
                      'name': item.name,
                      'uuid': item.uuid,
                    });
                  },
                  text: "Подробнее",
                ),
              ],
            ),
          ),
        ),).toList()


      ],
    );
  }
}
