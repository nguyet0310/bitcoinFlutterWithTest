import 'package:bitcoin_ticker/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'dart:io' show Platform;

void main() {
  group('Bitcoint ticker group test', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
        as IntegrationTestWidgetsFlutterBinding;

    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    testWidgets('Test picker ', (tester) async {
      var currency = 'USD';
      await tester.pumpWidget(MyApp());
      if (Platform.isAndroid) {
        // return getAndroidDropdown();
        // expect(find.byType(DropdownMenuItem(child: Text(currency), value: currency)),findsNo;
        await tester.pumpAndSettle(Duration(seconds: 1));
        var pickerItem = find.text('USD');
        expect(pickerItem, findsOneWidget);
        await tester.tap(pickerItem);
        await tester.drag(pickerItem, Offset(0.0,70.0));

        await tester.pumpAndSettle(Duration(seconds: 1));
        var dropItem = find.text('RON').last;
        await tester.tap(dropItem);
        await tester.pumpAndSettle(Duration(seconds: 10));
        // print(find.textContaining('RON'));
        expect(find.textContaining('RON'), findsNWidgets(4));
      }
    });
  });


}
