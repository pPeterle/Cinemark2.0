import 'package:cinemark_2/app/modules/home/repository/api/ingresso_api.dart';
import 'package:cinemark_2/app/modules/home/repository/errors/error.dart';
import 'package:cinemark_2/app/modules/home/repository/local/local_repository.dart';
import 'package:cinemark_2/app/shared/errors/errors.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'ingresso_api_test.mocks.dart';

@GenerateMocks([LocalRepository])
main() {
  final dio = Dio(BaseOptions());
  final dioAdapter = DioAdapter(dio: dio);

  final mockLocalRepository = MockLocalRepository();

  final api = IngressoApi(dio, mockLocalRepository);
  test(
    'should return states list on get states',
    () async {
      dioAdapter.onGet(
        'states',
        (server) => server.reply(200, [
          {
            "name": "Acre",
            "uf": "AC",
            "cities": [
              {
                "id": "364",
                "name": "Rio Branco",
                "uf": "AC",
                "state": "Acre",
                "urlKey": "rio-branco",
                "timeZone": "America/Rio_Branco"
              }
            ]
          },
        ]),
      );

      final data = await api.getStates();

      expect(data[0].name, equals("Acre"));
    },
  );

  test(
    'should return server error on get states when dio error type equals to response',
    () async {
      dioAdapter.onGet(
        'states',
        (server) => server.throws(
            404,
            DioError(
                requestOptions: RequestOptions(path: 'states'),
                type: DioErrorType.response,
                error: 'server error')),
      );
      try {
        await api.getStates();
      } on ServerError catch (e) {
        expect(e.message, equals('server error'));
      }
    },
  );

  test(
    'should return network error get states when dio error type different of response',
    () async {
      dioAdapter.onGet(
        'states',
        (server) => server.throws(
            404,
            DioError(
              requestOptions: RequestOptions(path: 'states'),
            )),
      );
      try {
        await api.getStates();
      } on NetworkError catch (e) {
        expect(e.message, equals('Erro de conexão com a internet'));
      }
    },
  );

  test(
    'should return failure when is not dio error on get state',
    () async {
      dioAdapter.onGet(
        'states',
        (server) => server.reply(200, [
          {},
        ]),
      );
      try {
        await api.getStates();
      } on Failure catch (e) {
        expect(e.message, equals('Algum Erro aconteceu'));
      }
    },
  );

  test(
    'should return carousel list on get carousel',
    () async {
      when(mockLocalRepository.getCityId())
          .thenAnswer((realInvocation) => Future.value('11'));
      dioAdapter.onGet(
        '/carousel/11/partnership/cinemark',
        (server) => server.reply(200, [carouselJson]),
      );
      final carousel = await api.getCarousel();
      expect(carousel[0].name, "Destaque");
    },
  );

  test(
    'should throw NullCityIdError on null city id when get carousel',
    () async {
      when(mockLocalRepository.getCityId())
          .thenAnswer((realInvocation) => Future.value(null));

      try {
        await api.getCarousel();
      } on NullCityIdError catch (e) {
        expect(e.message, "Selecione a cidade que deseja ver os filmes");
      }
    },
  );
}

final carouselJson = {
  "id": "3",
  "name": "Destaque",
  "carouselSlug": "destaque",
  "priority": 1,
  "type": "filmes",
  "hasLink": false,
  "events": [
    {
      "id": "23806",
      "title": "Doutor Estranho no Multiverso da Loucura",
      "originalTitle": "Doctor Strange in the Multiverse of Madness",
      "movieIdUrl": "",
      "ancineId": "",
      "countryOrigin": "Estados Unidos",
      "priority": 1,
      "contentRating": "Verifique a Classificação",
      "duration": "126",
      "rating": 0.0,
      "synopsis":
          "Em Doutor Estranho no Multiverso da Loucura, o Multiverso foi aberto e expande seus limites para mais longe do que nunca. Embarque em uma viagem para o desconhecido com o Doutor Estranho que, com a ajuda de aliados místicos antigos e novos, atravessa as perigosas realidades alternativas e alucinantes do Multiverso para enfrentar um novo adversário misterioso.\n\n\n",
      "cast":
          "Benedict Cumberbatch, Chiwetel Ejiofor, Elizabeth Olsen, Benedict Wong, Xochitl Gomez, Michael Stühlbarg, Rachel McAdams.\n\n",
      "director": "Sam Raimi",
      "distributor": "Disney",
      "inPreSale": false,
      "isReexhibition": false,
      "urlKey": "doutor-estranho-no-multiverso-da-loucura",
      "isPlaying": false,
      "countIsPlaying": 0,
      "premiereDate": {
        "localDate": "2022-05-04T19:00:00+00:00",
        "isToday": false,
        "dayOfWeek": "quarta-feira",
        "dayAndMonth": "04/05",
        "hour": "19:00",
        "year": "2022"
      },
      "creationDate": "0001-01-01T00:00:00Z",
      "city": "Rio de Janeiro",
      "siteURL":
          "https://www.ingresso.com/rio-de-janeiro/home/filmes/doutor-estranho-no-multiverso-da-loucura",
      "nationalSiteURL":
          "https://www.ingresso.com/filme/doutor-estranho-no-multiverso-da-loucura?city=rio-de-janeiro&partnership=",
      "images": [
        {
          "url":
              "https://ingresso-a.akamaihd.net/prd/img/movie/doutor-estranho-no-multiverso-da-loucura/29239d6e-2fb6-40ae-8f5d-1a1b70c3e681.jpg",
          "type": "PosterPortrait"
        },
        {
          "url":
              "https://ingresso-a.akamaihd.net/prd/img/movie/doutor-estranho-no-multiverso-da-loucura/ce489100-f2e5-4244-ace2-9e49d414942b.jpg",
          "type": "PosterHorizontal"
        }
      ],
      "genres": ["Ação", "Fantasia"],
      "ratingDescriptors": [],
      "completeTags": [],
      "tags": [],
      "trailers": [
        {
          "type": "Youtube",
          "url": "https://www.youtube.com/watch?v=7BpfaezgWCg",
          "embeddedUrl": "//www.youtube.com/embed/7BpfaezgWCg"
        }
      ],
      "boxOfficeId": null,
      "partnershipType": null,
      "rottenTomatoe": {
        "id": "783507b9-197a-3216-a5b3-99a00eb48cfa",
        "criticsRating": "",
        "criticsScore": "",
        "audienceRating": "",
        "audienceScore": "",
        "originalUrl":
            "https://www.rottentomatoes.com/m/doctor_strange_in_the_multiverse_of_madness"
      }
    }
  ]
};
