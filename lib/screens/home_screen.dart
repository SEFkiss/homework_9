import 'package:flutter/material.dart';
import 'package:hw9/models/hotels.dart';
import 'package:hw9/screens/home_screen_partial/grid_view_hotel.dart';
import 'package:hw9/screens/home_screen_partial/list_view_hotel.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool listMode = true; // Для переклюения представления Грид/Лист
  bool isDataLoading =
      false; // Метка для отслеживания загрузки контента с сервера
  bool isLoadingError = false;
  Dio _dio = Dio();
  List<HotelShortInfo>? hotels;

  // Получение данных с сервера
  getHotels() async {
    setState(() {
      isDataLoading = true;
    });

    try {
      final response = await _dio
          .get('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');
      hotels = response.data
          .map<HotelShortInfo>((item) => HotelShortInfo.fromJson(item))
          .toList();
    } on DioError catch (error) {
      setState(() {
        isLoadingError = true;
      });
      print('Error loading');
    }

    setState(() {
      isDataLoading = false;
    });
  }

  // Обработка нажатий на иконки Лист и Грид
  void _switchToList() {
    if (!listMode) {
      setState(() {
        listMode = true;
      });
    }
  }

  void _switchToGrid() {
    if (listMode) {
      setState(() {
        listMode = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getHotels();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Сервис бронирования'),
          actions: [
            // Кнопка Лист
            IconButton(
              onPressed: () => _switchToList(),
              icon: Icon(
                Icons.list,
                color: listMode ? Colors.white38 : Colors.white,
              ),
            ),
            // Кнопка Грид
            IconButton(
              onPressed: () => _switchToGrid(),
              icon: Icon(
                Icons.apps,
                color: listMode ? Colors.white : Colors.white38,
              ),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: isDataLoading
              ? const Center(child: CircularProgressIndicator())
              : isLoadingError
                  ? Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Ошибка загрузки, попробуйте снова!'),
                          OutlinedButton.icon(
                            onPressed: () {
                              getHotels();
                              setState(() {
                                isLoadingError = false;
                              });
                            },
                            icon: const Icon(Icons.update),
                            label: const Text('Обновить'),
                          ),
                        ],
                      ),
                    )
                  : listMode
                      ? ListViewHotel(hotels: hotels)
                      : GridViewHotel(hotels: hotels),
        ),
      ),
    );
  }
}
