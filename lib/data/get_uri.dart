import 'package:oauth_with_bloc/data/const.dart';

const String API_URL = "http://project1-timeline.herokuapp.com/api/v1/";

Uri getUri(String path) {
  String _path = Uri.parse(API_URL).path;
  if (!_path.endsWith('/')) {
    _path += '/';
  }
  return Uri(
    scheme: Uri.parse(API_URL).scheme,
    host: Uri.parse(API_URL).host,
    port: Uri.parse(API_URL).port,
    path: _path + path,
  );
}

Uri getUriWithQuery(String path, Map<String, dynamic> query) {
  return Uri(
    scheme: 'http',
    host: API_URL,
    port: 3399,
    path: path,
    queryParameters: {
      'x-api-key': CAT_API_KEY,
      ...query,
    },
  );
}
