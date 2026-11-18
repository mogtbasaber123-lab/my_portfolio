import 'package:flutter_test/flutter_test.dart';
import 'package:my_portfolio/main.dart';

void main() {
  testWidgets('Portfolio App smoke test', (WidgetTester tester) async {
    // Build our portfolio app and trigger a frame.
    await tester.pumpWidget(const MyPortfolioApp());
    await tester.pump(const Duration(milliseconds: 500));

    // Verify portfolio renders without exceptions.
    expect(find.byType(MyPortfolioApp), findsOneWidget);
  });
}
