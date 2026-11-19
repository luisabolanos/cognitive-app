/// Contrato para consultar el estado de conexion a internet.
abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<bool> get onConnectivityChanged;
}
