import 'package:flutter_test/flutter_test.dart';
import 'package:feel_the_beat/app/app.dart';

void main() {
  testWidgets('Feel the Beat app starts', (WidgetTester tester) async {
    await tester.pumpWidget(const FeelTheBeatApp());

    expect(find.byType(FeelTheBeatApp), findsOneWidget);
  });
}
