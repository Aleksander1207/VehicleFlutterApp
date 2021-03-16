import 'package:path_provider/path_provider.dart';
import 'vehicleFormElements/checksumCompareBrands.dart';
import 'vehicleFormElements/checksumCompareModels.dart';
import 'vehicleFormElements/checksumCompareTypes.dart';
import 'getBrandsChecksum.dart';
import 'getModelsChecksum.dart';
import 'getTypesChecksum.dart';
import 'getVehicleBrands.dart';
import 'getVehicleModels.dart';
import 'getVehicleType.dart';
import 'dart:io';

List<dynamic> vehicleFormSetup(String cookie){
  Future<TypesChecksum> typesChecksumApi = getTypesChecksumAPI(cookie);
  Future<TypesChecksum> typesChecksumCache = getTypesCheckSumCache(cookie);

  bool equalTypes = compareTypesChecksum(typesChecksumApi,typesChecksumCache);
  print('$equalTypes types');

  Future<BrandsChecksum> brandsChecksumApi = getBrandsChecksumAPI(cookie);
  Future<BrandsChecksum> brandsChecksumCache = getBrandsCheckSumCache(cookie);

  bool equalBrands = compareBrandsChecksum(brandsChecksumApi, brandsChecksumCache);
  print('$equalBrands brands');

  Future<ModelsChecksum> modelsChecksumApi = getModelsChecksumAPI(cookie);
  Future<ModelsChecksum> modelsChecksumCache = getModelsCheckSumCache(cookie);

  bool equalModels = compareModelsChecksum(modelsChecksumApi, modelsChecksumCache);
  print('$equalModels models');

  bool outdated=(!equalTypes || !equalBrands || !equalModels);
  if(outdated){
    _deleteCacheContents();
  }

  Future<VehicleTypes> types = getVehicleTypes(cookie,outdated);
  Future<VehicleBrands> brands = getVehicleBrands(cookie,outdated);
  Future<VehicleModels> models = getVehicleModels(cookie,outdated);

  List<dynamic> vehicleData = [types,brands,models];
  return vehicleData;
}

Future<void> _deleteCacheContents() async {
  final cacheDir = await getTemporaryDirectory();
  String fileName = 'CacheTypesChecksum.json';
  if (await File(cacheDir.path + '/' + fileName).exists()) {
    cacheDir.delete(recursive: true);
    print('All cache deleted!');
  }
}