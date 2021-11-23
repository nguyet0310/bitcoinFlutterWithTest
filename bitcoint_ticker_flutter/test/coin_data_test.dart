import 'package:bitcoin_ticker/coin_data.dart';
import 'package:test/test.dart';

void main() {
  group('Test coin rate will show', () {
    CoinData coinData = CoinData();

    test(' 1. A new item should be added', () async {
      var data = await coinData.getCoinData('USD');
      print(data);
      expect(data.toString(), equals('{BTC: 57010, ETH: 4184, LTC: 210}'));
    });
  });
}
