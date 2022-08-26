import 'package:flutter_test/flutter_test.dart';
import 'package:singup_app/common/network_client/network_client.dart';

void main() {
  test('Invalide Url test', () async {
    final INetworkClient clients = NetworkClient();
    final respon = await clients
        .get('https://spiceblogserver-production.up.railway.app/nitish');
    expect(respon.statusCode, 404);
  });
}
