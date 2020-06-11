import 'package:get_it/get_it.dart';
import 'package:otube/api/client/client.dart';
import 'package:otube/api/client/simple_client.dart';
import 'package:otube/api/invidious_api_client.dart';

class Injection {
  static final getIt = GetIt.instance;

  static void setup() async {
    final client = SimpleClient(); //CachedClient();
    //await client.init();

    final invidiousApiClient = InvidiousApiClient(client);

    getIt.registerSingleton<HttpClient>(client, signalsReady: true);
    getIt.registerSingleton<InvidiousApiClient>(invidiousApiClient,
        signalsReady: true);
  }

  static T get<T>() => getIt<T>();
}
