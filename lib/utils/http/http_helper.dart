import 'package:http/http.dart' as http;
import 'package:scrubo/utils/constants/enums.dart';

class THttpHelper {
  static String _getApiUrl(ApiFlags urlType, String endpoint) {
    return _getBaseUrl(urlType) + endpoint;
  }

  static Future<http.Response> getRequest(
      ApiFlags apiFlag, String endPoint) async {
    final url = _getApiUrl(apiFlag, endPoint);
    final response = await http.get(Uri.parse(url));
    return response;
  }

  static String _getBaseUrl(ApiFlags urlType) {
    switch (urlType) {
      case ApiFlags.postalOffice:
        return "https://api.postalpincode.in/pincode/";
      case ApiFlags.vehicles:
        return "https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/all-vehicles-model/";
      case ApiFlags.googleMaps:
        return 'https://staging.scrubo.com/api/v1';
      case ApiFlags.news:
        return 'https://scrubo.com/api/v1';
      case ApiFlags.price:
        return 'https://staging.scrubo.com/api/v1';
      case ApiFlags.service:
        return 'https://staging.scrubo.com/api/v1';
      default:
        return 'https://dev.scrubo.com/api/v1';
    }
  }
}
