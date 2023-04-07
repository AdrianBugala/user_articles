import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:user_articles/data/remote_data_sources/authors_remote_data_source.dart';
import 'package:user_articles/domain/models/author_model.dart';
import 'package:user_articles/domain/repositories/authors_repository.dart';

class MockAuthorDataSource extends Mock
    implements AuthorsRemoteRetrofitDataSource {}

void main() {
  late AuthorsRepository sut;
  late MockAuthorDataSource dataSource;

  setUp(() {
    dataSource = MockAuthorDataSource();
    sut = AuthorsRepository(remoteDataSource: dataSource);
  });

  group('getAuthorModel', () {
    test('should filter data source results with provided author id', () async {
      // 1
      when(() => dataSource.getAuthors()).thenAnswer((_) async => [
            AuthorModel(1, 'picture1', 'firstName1', 'lastName1'),
            AuthorModel(2, 'picture2', 'firstName2', 'lastName2'),
            AuthorModel(3, 'picture3', 'firstName3', 'lastName3'),
            AuthorModel(4, 'picture4', 'firstName4', 'lastName4'),
          ]);
      // 2
      final result = await sut.getAuthorModels();

      // 3
      expect(result, [
        AuthorModel(1, 'picture1', 'firstName1', 'lastName1'),
        AuthorModel(2, 'picture2', 'firstName2', 'lastName2'),
        AuthorModel(3, 'picture3', 'firstName3', 'lastName3'),
        AuthorModel(4, 'picture4', 'firstName4', 'lastName4'),
      ]);
    });

    test('should call remoteDataSource.getAuthors() method', () async {
      // 1
      when(() => dataSource.getAuthors()).thenAnswer((_) async => []);

      // 2
      await sut.getAuthorModels();

      // 3
      verify(() => dataSource.getAuthors()).called(1);
    });
  });
}
