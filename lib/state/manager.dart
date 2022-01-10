import 'package:flutter_app/models/api.dart';
import 'package:flutter_app/network/request.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiStateFuture = FutureProvider((ref) async {
  return mapResponse;
});
