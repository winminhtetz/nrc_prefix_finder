import 'package:nrc_prefix_finder/nrc_prefix_handler.dart';
import 'package:shelf_router/shelf_router.dart';

final router = Router()
  ..get('/api/all', getNRCPrefixAll)
  ..get('/api/union_territories', getUnionTerritories)
  ..get('/api/nrc_prefix_codes', getNRCPrefixCodes);
