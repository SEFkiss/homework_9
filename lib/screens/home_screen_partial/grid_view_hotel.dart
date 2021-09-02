import 'package:flutter/material.dart';
import 'package:hw9/models/hotels.dart';

class GridViewHotel extends StatelessWidget {
  GridViewHotel({Key? key, @required this.hotels}) : super(key: key);
  List<HotelShortInfo>? hotels;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      crossAxisCount: 2,
      children: [
        ...hotels!.map((item) => CardForGridList(hotel: item)).toList()
      ],
    );
  }
}

class CardForGridList extends StatelessWidget {
  CardForGridList({Key? key, @required this.hotel}) : super(key: key);

  HotelShortInfo? hotel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/${hotel!.poster}',
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              flex: 5,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${hotel!.name}',
                  textAlign: TextAlign.center,
                ),
              ),
              flex: 3,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: TextButton(
                    child: const Text(
                      'Подробнее',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/about', arguments: {
                        'name': hotel!.name,
                        'uuid': hotel!.uuid,
                      });
                    },
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
