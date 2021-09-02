import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hw9/models/hotel.dart';

class AboutHotelScreen extends StatefulWidget {
  AboutHotelScreen({Key? key, this.hotelName, this.uuid}) : super(key: key);

  final String? hotelName;
  final String? uuid;

  @override
  _AboutHotelScreenState createState() => _AboutHotelScreenState();
}

class _AboutHotelScreenState extends State<AboutHotelScreen> {
  bool _isDataLoading = false;
  bool _isLoadingError = false;
  Dio _dio = Dio();
  final CarouselController _carouselController = CarouselController();
  Hotel hotel = Hotel();

  // Получение данных с сервера
  getAboutHotel() async {
    setState(() {
      _isDataLoading = true;
    });

    try {
      final response = await _dio.get('https://run.mocky.io/v3/${widget.uuid}');
      hotel = Hotel.fromJson(response.data);
    } on DioError catch (error) {
      setState(() {
        _isLoadingError = true;
      });
      // print('Error loading');
    }

    setState(() {
      _isDataLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getAboutHotel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.hotelName}'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: SafeArea(
        child: _isDataLoading
              ? Container(child: const Center(child: CircularProgressIndicator(),),)
              : _isLoadingError
                ? const NotFoundOrError()
                : Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: CustomScrollView(
                    slivers: [ SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          CarouselSlider(
                              carouselController: _carouselController,
                              items: hotel.photos
                              !.map((item) => Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Center(
                                    child: Image.asset('assets/images/$item',
                                        fit: BoxFit.cover, width: 1000)),
                              ))
                                  .toList(),
                              options: CarouselOptions(),
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 3),
                                    child: Row(
                                      children: [
                                        const Text('Страна:'),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          hotel.address!.country ?? '-',
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 3),
                                    child: Row(
                                      children: [
                                        const Text('Город:'),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          hotel.address!.city ?? '-',
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 3),
                                    child: Row(
                                      children: [
                                        const Text('Улица:'),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          hotel.address!.street ?? '-',
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 3),
                                    child: Row(
                                      children: [
                                        const Text('Рейтинг:'),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          hotel.rating.toString(),
                                          style: const TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                          ),
                          const SizedBox(
                              height: 10,
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              alignment: Alignment.topLeft,
                              child: const Text(
                                'Сервисы',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                              ),
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    width: MediaQuery.of(context).size.width / 2.2,
                                    child: Column(mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Платные',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500, fontSize: 18),
                                        ),
                                        const SizedBox(height: 8),
                                        ...hotel.services!.paid!.map((item) => Text(item)).toList()
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    width: MediaQuery.of(context).size.width / 2.2,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Бесплатно',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500, fontSize: 18),
                                        ),
                                        const SizedBox(height: 8),
                                        ...hotel.services!.free!.map((item) => Text(item)).toList()
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                          ),
                        ]
                      )
                    ),
                    ]
                  ),
                ),
      ),
    );
  }
}

class NotFoundOrError extends StatelessWidget {
  const NotFoundOrError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: const Text('Контент временно не доступен!'),
          )
        ],
      ),
    );
  }
}
