import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_adi/view/home/view/login_page.dart';
import 'package:project_adi/view/home/view/home_view.dart';

void main() {
  testWidgets('LoginPage Test', (WidgetTester tester) async {
    // LoginPage widget'ını oluştur
    await tester.pumpWidget(
      MaterialApp(
        home: LoginPage(),
      ),
    );

    // E-posta ve şifre alanlarını doldurmadan giriş yapmayı deneyin
    await tester.tap(find.text('Giriş Yap'));
    await tester.pump();

    // Hata mesajının gösterilip gösterilmediğini kontrol et
    expect(find.text('Lütfen e-posta ve şifre giriniz'), findsOneWidget);

    // Doğru e-posta ve şifre ile giriş yapmayı deneyin
    await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'password123');
    await tester.tap(find.text('Giriş Yap'));
    await tester.pump();

    // Yönlendirme kontrolünü yapabilirsiniz, örneğin HomePageScreen widget'ını bekleyebilirsiniz
    expect(find.byType(HomePageScreen), findsOneWidget);

    // Hatalı giriş durumunu kontrol et
    // Burada AuthService().signIn fonksiyonunu kontrol edemezsiniz, çünkü bu fonksiyonun gerçek
    // implementasyonunu taklit etmek zordur ve gereksiz bir bağımlılık getirebilir.
    // Ancak, eğer AuthService().signIn başarısız olursa, bir hata mesajının gösterildiğini kontrol edebilirsiniz.
    // AuthService().signIn başarılı olduğunu simüle etmek yerine, birim testlerde genellikle çeşitli
    // servisleri (AuthService gibi) taklit eden mock sınıfları kullanırız.
    await tester.enterText(find.byType(TextField).at(0), 'invalid@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'wrongpassword');
    await tester.tap(find.text('Giriş Yap'));
    await tester.pump();

    // Hata mesajının gösterilip gösterilmediğini kontrol et
    expect(find.text('Kullanıcı bulunamadı veya hatalı şifre'), findsOneWidget);
});
}