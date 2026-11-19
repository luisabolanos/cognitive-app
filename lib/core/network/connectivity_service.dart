import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cognitive_app/core/network/network_info.dart';

/// Implementacion de [NetworkInfo] basada en connectivity_plus.
class ConnectivityService implements NetworkInfo {
  ConnectivityService([Connectivity? connectivity])
      : _connectivity = connectivity ?? Connectivity();

  final Connectivity _connectivity;

  @override
  Future<bool> get isConnected async {
    final results = await _connectivity.checkConnectivity();
    return _hasConnection(results);
  }

  @override
  Stream<bool> get onConnectivityChanged {
    return _connectivity.onConnectivityChanged.map(_hasConnection);
  }

  bool _hasConnection(List<ConnectivityResult> results) {
    return results.isNotEmpty &&
        !results.every((result) => result == ConnectivityResult.none);
  }
}

final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return ConnectivityService();
});
