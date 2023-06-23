import 'package:elearning/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

//// Created by PhucPT on 17/06/2023

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
