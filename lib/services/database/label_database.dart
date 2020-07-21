import 'package:ideashare/services/database/firestore_path.dart';
import 'package:ideashare/services/database/firestore_service.dart';
import 'package:ideashare/services/models/label/label.dart';

class LabelDatabase {

  final _service = FirestoreService.instance;

  Future<List<Label>> getLabels() =>
      _service.getCollection<Label>(
          path: FirestorePath.labels(),
          builder: (data, documentId) =>
              Label.fromMap(documentId, data));
}
