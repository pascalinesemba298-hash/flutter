import 'package:flutter_test/flutter_test.dart';
import 'package:cv_flutter_joel/main.dart';

void main() {
  testWidgets('Test de lancement de mon application CV',
      (WidgetTester tester) async {

    // Lancer notre application
    await tester.pumpWidget(const CvFlutterApp());

    // Vérifier que la page de connexion apparaît
    expect(find.text('Bienvenue'), findsOneWidget);

    // Vérifier la présence du bouton de connexion
    expect(find.text('Se connecter'), findsOneWidget);
  });
}