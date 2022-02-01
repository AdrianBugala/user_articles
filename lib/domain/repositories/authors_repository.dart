import 'package:user_articles/data/remote_data_sources/authors_remote_data_source.dart';
import 'package:user_articles/domain/models/author_model.dart';

class AuthorsRepository {
  AuthorsRepository(this._remoteDataSource);

  final AuthorsRemoteRetroFitDataSource _remoteDataSource;

  Future<List<AuthorModel>> getAuthorModels() async {
    final json = await _remoteDataSource.getAuthors();
    if (json == null) {
      return [];
    }
    return json;
  }
}

// return [
//   const AuthorModel(
//     id: 1,
//     avatarURL: 'https://randomuser.me/api/portraits/men/57.jpg',
//     firstName: 'Piotr Obdarowicz',
//     lastName: 'Piotr Obdarowicz',
//   ),
//   const AuthorModel(
//     id: 2,
//     avatarURL: 'https://randomuser.me/api/portraits/men/58.jpg',
//     firstName: 'Radosław Gdański',
//     lastName: 'Radosław Gdański',
//   ),
// ];