import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_watchlist_app/main.dart';
import 'package:movie_watchlist_app/data/movies_data.dart';
import 'package:movie_watchlist_app/screens/details_screen.dart';

void main() {
  testWidgets(
    'Every movie opens its own data and back returns to the catalog',
    (tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(const MovieApp());
      await tester.pumpAndSettle();
      for (final movie in sampleMovies) {
        final tile = find.byKey(ValueKey('movie-${movie.id}'));
        await tester.scrollUntilVisible(
          tile,
          180,
          scrollable: find.byType(Scrollable).first,
        );
        await tester.tap(tile);
        await tester.pumpAndSettle();
        final details = tester.widget<DetailsScreen>(
          find.byType(DetailsScreen),
        );
        expect(identical(details.movie, movie), isTrue);
        expect(find.text(movie.synopsis), findsOneWidget);
        for (final actor in movie.cast) {
          expect(find.text(actor), findsOneWidget);
        }
        expect(find.byType(Image), findsOneWidget);
        expect(tester.takeException(), isNull);
        await tester.pageBack();
        await tester.pumpAndSettle();
        expect(find.byType(DetailsScreen), findsNothing);
        expect(
          find.byKey(const PageStorageKey('movie-catalog')),
          findsOneWidget,
        );
      }
    },
  );

  testWidgets('Small screen with enlarged text can scroll without overflow', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 568);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.6)),
          child: child!,
        ),
        home: DetailsScreen(movie: sampleMovies.last),
      ),
    );
    await tester.pumpAndSettle();
    await tester.drag(
      find.byType(SingleChildScrollView),
      const Offset(0, -1200),
    );
    await tester.pumpAndSettle();
    expect(find.text('Adrien Brody'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('All declared poster assets decode', (tester) async {
    await tester.runAsync(() async {
      for (final movie in sampleMovies) {
        final data = await File(movie.posterPath).readAsBytes();
        final codec = await ui.instantiateImageCodec(data);
        final frame = await codec.getNextFrame();
        expect(frame.image.width, greaterThan(100));
        expect(frame.image.height, greaterThan(frame.image.width));
        frame.image.dispose();
        codec.dispose();
      }
    });
  });
}
