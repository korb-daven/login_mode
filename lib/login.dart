import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final bool isDarkMode;
  final String currentLanguage;
  final Function(bool) onThemeChanged;
  final Function(String) onLanguageChanged;

  LoginScreen({
    required this.isDarkMode,
    required this.currentLanguage,
    required this.onThemeChanged,
    required this.onLanguageChanged,
  });

  final Map<String, Map<String, String>> localizedStrings = {
    'en': {'greeting': 'Hello!', 'login': 'Log in', 'username': 'Username', 'password': 'Password', 'darkmode': 'Dark Mode'},
    'fr': {'greeting': 'Salut!', 'login': 'Connexion', 'username': "Nom d'utilisateur", 'password': 'Mot de passe', 'darkmode': 'Mode sombro'},
    'kh': {'greeting': 'សួស្តី!', 'login': 'ចូល', 'username': 'ឈ្មោះអ្នកប្រើប្រាស់', 'password': 'ពាក្យសម្ងាត់', 'darkmode': 'ផ្ទាំងងងឹត'},
  };

  @override
  Widget build(BuildContext context) {
    final greeting = localizedStrings[currentLanguage]!['greeting']!;
    final login = localizedStrings[currentLanguage]!['login']!;
    final username = localizedStrings[currentLanguage]!['username']!;
    final password = localizedStrings[currentLanguage]!['password']!;
    final darkmode = localizedStrings[currentLanguage]!['darkmode']!;

    return Scaffold(
      appBar: AppBar(title: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // left-align
          children: [
            Text(
              login,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 18,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '___________',
              style: TextStyle(
                fontSize: 16,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              'lib/assets/transparent_logo.png',
              height: 120,
              width: 300,
              fit: BoxFit.cover,
            )),
            Text(greeting, style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 24,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              )),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: username,
                labelStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: password,
                labelStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14),
                border: OutlineInputBorder(), 
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
             onPressed: () {},
             style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 153, 0), 
                minimumSize: Size(300, 50),
              ),
             child: Text(login, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14, fontWeight: FontWeight.w700))
             ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['en', 'fr', 'kh'].map((lang) {
                return ElevatedButton(
                  onPressed: () => onLanguageChanged(lang),
                  child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'lib/assets/$lang.png',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 8),
                    Text(lang.toUpperCase()),
                  ],
                ),
                );
              }).toList(),
            ),
            SizedBox(height: 40),
            Center(
            child: SizedBox(
              width: 200, 
              child: SwitchListTile(
                title: Text(
                  darkmode,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14),
                ),
                value: isDarkMode,
                onChanged: onThemeChanged,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
