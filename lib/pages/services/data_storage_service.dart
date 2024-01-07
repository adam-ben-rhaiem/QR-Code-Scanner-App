// data_storage_service.dart

class DataStorageService {
  late String scannedData;

  void setScannedData(String data) {
    scannedData = data;
  }

  String getScannedData() {
    return scannedData;
  }
}
