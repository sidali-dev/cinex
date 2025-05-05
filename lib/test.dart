import 'package:cinex/app/services/tmdb_service.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              TmdbService service = TmdbService();
              await service.getTvShowDetails(2224);
            },
            child: Text("TEST"),
          ),
        ),
      ),
    );
  }
}
