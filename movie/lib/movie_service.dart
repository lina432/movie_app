import 'package:dio/dio.dart';
import 'package:movie/api_movie.dart';



class MovieService {
  final Dio _dio = Dio();

  Future<List<dynamic>> fetchMovies(String movieName) async {
    try {
      final response = await _dio.get(
        ApiMovie.baseUrl,
        queryParameters: {
          't': movieName,
          'apikey': ApiMovie.apiKey,
          'plot': 'full',
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['Response'] == 'True') {
          return data['Search'];
        } else {
          throw Exception(data['Error']);
        }
      } else {
        throw Exception('Failed to fetch movies error');
      }
    } catch (e) {
      throw Exception('Failed to connect: $e');
    }
  }
}