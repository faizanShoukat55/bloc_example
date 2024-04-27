import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/widget_test/my_widget_example/my_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows building and interacting
  // with widgets in the test environment.

  // test("A Material Widget", () async {
  //   // expect(await const MaterialPage(child: MyWidget(title: '', message: '',)),
  //   //     isA<MaterialPage>);
  //   expect( const MaterialPage<void>(child: MyWidget(title: '', message: '',)) ,
  //       isA<MaterialPage>);
  // });

  testWidgets('MyWidget has a title and message', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));

    // Create the Finders.
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}
// void main() {
//
//   test("A Material Widget", ()async{
//     expect(await const MaterialPage(child: MyWidget( title: '', message: '',)), isA<MaterialPage>);
//   });
//   // testWidgets("My Widget Test", (widgetTester) async{
//   //   await widgetTester.pumpWidget(const MyWidget(title: "T", message: "M"));
//   //
//   //   expect(find.byWidget(const MyWidget(title: "T", message: "M")),findsWidgets );
//   // });
// }