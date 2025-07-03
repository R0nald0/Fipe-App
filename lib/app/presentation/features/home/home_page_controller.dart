import 'package:fipe_app/app/core/app_providers.dart';
import 'package:fipe_app/app/domain/model/marca.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageController extends AsyncNotifier<List<Marca>> {
  @override
  Future<List<Marca>> build() async {
    return await ref.read(fipeRepository).getMarcas();
  }
}
