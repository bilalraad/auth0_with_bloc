import 'package:oauth_with_bloc/data/const.dart';

const _baseUrl = 'api.thecatapi.com';
const _path = '/v1';

class CatApi {
  static Uri getUrWithQuery(String path, Map<String, dynamic> query) {
    return Uri(
      scheme: 'http',
      host: _baseUrl,
      path: _path + path,
      queryParameters: {
        'x-api-key': CAT_API_KEY,
        ...query,
      },
    );
  }
}
