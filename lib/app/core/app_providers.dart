
import 'package:fipe_app/app/data/repository/fipe_repository.dart';
import 'package:fipe_app/app/domain/model/marca.dart';
import 'package:fipe_app/app/domain/model/result_model.dart';
import 'package:fipe_app/app/presentation/features/home/home_page_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


var minhaMarca = Marca(codigo: "",nome: "");

final fipeRepository = Provider<FipeRepository>((ref) => FipeRepository());
final setmarcaProvider = Provider.family((ref, marca) => minhaMarca = marca as Marca );
final getMinhMarcaProvider = Provider((ref) =>  minhaMarca);

final getModeloByMarcaPovider = FutureProvider.family<ResultModel,String>((ref,codigo) async {
  return await ref.read(fipeRepository).getModelos(codigo);
});

final homePageControllerProvider = AsyncNotifierProvider<HomePageController,List<Marca>>(HomePageController.new);

