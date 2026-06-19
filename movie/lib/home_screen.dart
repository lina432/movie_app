import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie/movie1.dart';
import 'package:movie/movie2.dart';
import 'package:dio/dio.dart';
import 'package:movie/profile.dart';

class movies_today extends StatefulWidget {
  final VoidCallback toggleTheme;
  const movies_today({super.key, required this.toggleTheme});

  @override
  State<movies_today> createState() => _movies_todayState();
}

class _movies_todayState extends State<movies_today> {
  final List<String> movieName = [
    'Avengers: Endgame',
    'Fast & Furious',
    'Titanic',
    'The Lord of the Rings',
    'John Wick',
    'Jumanji: Next Level',
  ];

  late Future<List<Map<String, dynamic>>> _moviesFuture;

  @override
  void initState() {
    super.initState();
    _moviesFuture = _fetchAllMovies();
  }

  Future<List<Map<String, dynamic>>> _fetchAllMovies() async {
    Dio dio = Dio();
    List<Map<String, dynamic>> loadedMovies = [];

    for (String name in movieName) {
      try {
        final response = await dio.get(
          'https://www.omdbapi.com/',
          queryParameters: {'apikey': 'ecde59d', 't': name},
        );
        if (response.data['Response'] == 'True') {
          loadedMovies.add(response.data);
        }
      } catch (e) {
        print("خطأ في جلب فيلم $name: $e");
      }
    }
    return loadedMovies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.amber,
        child: const Icon(Icons.movie, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        title: const Text('Movies Today'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_4),
            onPressed: () {
              print("button pressed");
              widget.toggleTheme();
            },
          ),
        ],
      ),

      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _moviesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.amber),
            );
          }

          if (snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data!.isEmpty) {
            return const Center(
              child: Text('حدث خطأ في تحميل البيانات من السيرفر'),
            );
          }

          final movies = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Center(
                    child: Column(
                      children: [
                        Center(
                          child: Center(
                            child:
                                //row1
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Movie1(movieData: movies[0]),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 155,
                                        height: 220,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(40),
                                            topRight: Radius.circular(40),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.amber.withValues(
                                                alpha: 0.3,
                                              ),
                                              blurRadius: 12,
                                              offset: const Offset(0, 5),
                                            ),
                                          ],
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              movies[0]['Poster'],
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(width: 20),

                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Movie2(
                                              movieData: movies[1],
                                            ), // تمرير بيانات الفيلم الثاني
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: 155,
                                        height: 220,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(40),
                                            topLeft: Radius.circular(40),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.amber.withValues(
                                                alpha: 0.3,
                                              ),
                                              blurRadius: 12,
                                              offset: const Offset(0, 5),
                                            ),
                                          ],
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              movies[1]['Poster'],
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          ),
                        ),

                        const SizedBox(height: 24), ////////////////////2nd row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Movie1(movieData: movies[2]),
                                  ),
                                );
                              },
                              child: Container(
                                width: 155,
                                height: 220,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(40),
                                    topLeft: Radius.circular(40),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.amber.withValues(
                                        alpha: 0.3,
                                      ),
                                      blurRadius: 12,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                  image: DecorationImage(
                                    image: NetworkImage(movies[2]['Poster']),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 20),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Movie2(
                                      movieData: movies[3],
                                    ), // تمرير بيانات الفيلم الرابع
                                  ),
                                );
                              },
                              child: Container(
                                width: 155,
                                height: 220,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.amber.withValues(
                                        alpha: 0.3,
                                      ),
                                      blurRadius: 12,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                  image: DecorationImage(
                                    image: NetworkImage(movies[3]['Poster']),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        /////////////////////////////////////////////////////////////////////////carousel
                        const SizedBox(height: 30),

                        CarouselSlider(
                          options: CarouselOptions(
                            height: 220,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            enlargeCenterPage: true,
                            viewportFraction: 0.85,
                          ),

                          items: movies.map((item) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: NetworkImage(item['Poster']),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: const Icon(Icons.home), onPressed: () {}),
            const SizedBox(width: 40),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
