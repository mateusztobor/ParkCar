import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Park Car',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String _locationFilePath;
  late AppLocalizations _local;
  bool _isLocationSaved = false;
  bool _isConfirmingOverwrite = false;

  @override
  void didChangeDependencies() {
    _local = AppLocalizations.of(context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    _getLocationFilePath();
  }

  void _showInfoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_local.aboutApp),
          content: Text("Park Car 1.0\n" + _local.author + "Mateusz Tobor"),
          actions: [
            TextButton(
              child: Text(_local.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _getLocationFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    setState(() {
      _locationFilePath = '${directory.path}/location.txt';
      _isLocationSaved = File(_locationFilePath).existsSync();
    });
  }

  Future<void> _needLocationPerm() async {
    final confirmed = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_local.noPermTitle),
          content: Text(_local.noPermContent),
          actions: <Widget>[
            TextButton(
              child: Text(_local.cancel),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text(_local.grantPerm),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    if (confirmed) {
      var status = await Permission.locationWhenInUse.request();
      if (status.isGranted) {
        _saveLocation();
      }
      else if (status.isDenied || status.isPermanentlyDenied) {
        _needLocationPerm();
      }
    }
  }

  Future<void> _saveLocation() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      try {
        final position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        final file = File(_locationFilePath);
        if (_isLocationSaved && !_isConfirmingOverwrite) {
          setState(() {
            _isConfirmingOverwrite = true;
          });
          return;
        }
        await file.writeAsString('${position.latitude},${position.longitude}');
        setState(() {
          _isLocationSaved = true;
          _isConfirmingOverwrite = false;
        });
      } on PlatformException catch (e) {
        print(e);
      }
    } else if (status.isDenied || status.isPermanentlyDenied) {
      _needLocationPerm();
    }
  }

  Future<void> _showConfirmDialog() async {
    final confirmed = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_local.confirmTitle),
          content: Text(_local.confirmOverwriteContent),
          actions: <Widget>[
            TextButton(
              child: Text(_local.cancel),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text(_local.yes),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );

    if (confirmed) {
      _saveLocation();
    }
  }

  Future<void> _deleteLocation() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_local.confirmTitle),
          content: Text(_local.confirmDeleteContent),
          actions: <Widget>[
            TextButton(
              child: Text(_local.cancel),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text(_local.yes),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
    if (confirmed == true) {
      final file = File(_locationFilePath);
      await file.delete();
      setState(() {
        _isLocationSaved = false;
      });
    }
  }

  Future<void> _navigateToLocation() async {
    final file = File(_locationFilePath);
    final content = await file.readAsString();
    final parts = content.split(',');
    final lat = double.parse(parts[0]);
    final lng = double.parse(parts[1]);
    final url =
        'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              width: 200.0,
              height: 120.0,
            ),
            SizedBox(height: 82.0),
            ElevatedButton(
              onPressed: _isLocationSaved ? _showConfirmDialog : _saveLocation,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.local_parking),
                  SizedBox(width: 4.0),
                  Text(_isLocationSaved
                      ? _local.btnOverwriteLocation
                      : _local.btnSaveLocation),
                  const SizedBox(height: 50.0, width: 1.0),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isLocationSaved ? _deleteLocation : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_off),
                  SizedBox(width: 4.0),
                  Text(_local.btnDeleteLocation),
                  SizedBox(height: 50.0),
                ],
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _isLocationSaved ? _navigateToLocation : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map),
                  SizedBox(width: 4.0),
                  Text(_local.btnRunMaps),
                  const SizedBox(height: 64.0),
                ],
              ),
            ),
            SizedBox(height: 128.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showInfoDialog,
        tooltip: _local.aboutApp,
        child: Icon(Icons.info),
      ),
    );
  }
}