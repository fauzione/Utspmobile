import 'package:flutter/material.dart';
import 'admin_page.dart'; // Pastikan untuk mengimpor file AdminPage
import 'mahasiswa_page.dart'; // Pastikan untuk mengimpor file MahasiswaPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminLoginPage()),
                  );
                },
                child: Text('Login Admin'),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MahasiswaLoginPage()),
                  );
                },
                child: Text('Login Mahasiswa'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdminLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: LoginForm(label: 'Admin'),
        ),
      ),
    );
  }
}

class MahasiswaLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mahasiswa Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: LoginForm(label: 'Mahasiswa'),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  final String label;

  LoginForm({required this.label});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            labelText: '${widget.label} Username',
            prefixIcon: Icon(Icons.person),
          ),
        ),
        SizedBox(height: 20.0),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: '${widget.label} Password',
            prefixIcon: Icon(Icons.lock),
          ),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            // Lakukan validasi dan navigasi sesuai kebutuhan di sini
            String username = _usernameController.text.trim();
            String password = _passwordController.text.trim();

            // Validasi sederhana: pastikan kedua input tidak kosong
            if (username.isNotEmpty && password.isNotEmpty) {
              // Lakukan navigasi sesuai kebutuhan
              if (widget.label == 'Admin') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AdminPage()),
                );
              } else if (widget.label == 'Mahasiswa') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MahasiswaPage()),
                );
              }
            } else {
              // Tampilkan pesan kesalahan jika input kosong
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Username dan password harus diisi.'),
                ),
              );
            }
          },
          child: Text('Login ${widget.label}'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
