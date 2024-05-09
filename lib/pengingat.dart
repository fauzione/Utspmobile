import 'package:flutter/material.dart';

class PengingatPage extends StatelessWidget {
  final String tanggal;
  final String waktu;
  final String ruangan;

  // Map untuk mengaitkan ruangan dengan lokasinya (lantai)
  static const Map<String, String> roomLocations = {
    'Ruangan R 1': 'Lantai 2',
    'Ruangan R 2': 'Lantai 2',
    'Ruangan R 3': 'Lantai 2',
    'Ruangan R 4': 'Lantai 2',
    'Ruangan R 5': 'Lantai 2',
    'Ruangan R 6': 'Lantai 2',
    'Ruangan R AULA': 'Lantai 3',
    'Ruangan R IOT': 'Lantai 3',
  };

  const PengingatPage({
    Key? key,
    required this.tanggal,
    required this.waktu,
    required this.ruangan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dapatkan lokasi (lantai) berdasarkan ruangan yang dipilih
    String location = roomLocations[ruangan] ??
        ''; // Gunakan default value jika ruangan tidak ditemukan

    return Scaffold(
      appBar: AppBar(
        title: Text('Pengingat'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'JANGAN LUPA DATANG PADA',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Tanggal: $tanggal',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Waktu: $waktu',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Ruangan: $ruangan',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Lantai: $location', // Tampilkan informasi lantai (lokasi) ruangan
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
