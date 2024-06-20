import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

class PushNotificationService {
  Future<String?> getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "softhunters-4fba5",
      "private_key_id": "1083db3163e966cf811329ee9b6d7297f0f6085e",
      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCjNeNVB+66zH/E\n4c7ooxYI/1viC+JuMsJzI8t/pjS3udf48D4SssTs5e6AbI0Xu21+7RH06Ob9K/uZ\no74oEqYEFC0QAlQ0hZrJUm+TRoy/yWC1m3ICmDb5LYdpY1mAjcE/QyRXJfhD/FgP\nx7etsaulRlenJb7ZoaL4G33NOkli28o86JW55GjKwc1PhFOMNbUGDP3/yeNi2ueb\nAfyjTAsHLYAdVqLoM0x7dkblDJqbM7BI0tSt8AqZQgmkbwB1oMJq/py8bqU95oBh\ncXPFJGxoqc/dlT3HDUEGOx6I4X0wcJnp2/ceYHEVpA0Uz/qX1JtQFaKlIfDXmHiP\nzTOBRJgdAgMBAAECggEACw7MXXc5XzoaQQRckKn2BPuKJeVQvM8fGg53i+k+oqEK\nhzD9v6YRjgxhDZ3tLEm0WDhnMkzyU35eoFD2AgCLc3TLfc1ul5ViwJeffB64TAkw\njnVe8tqNxPGm/kavKnTQPkFGDcqCiNaov770DKZgPwUmTKqTxOp84Gr6acR0cuhe\nAGPwDeAqjoRSDZIDT3JBo48vGcWsWMcUd/LEeoEYfw/J67JOWD5iyBYjj2Mi06tl\nIUsEqZ/in9H2AQrXNpJab28mdAzABRZGJww6KfyBnv/jhQxVqHcl7M/yTX1MdN1E\nOVDYP15T1B0PHRUPxzL8QG5uZyFu13z2TBAXDW+WIQKBgQDdjVhawe6+HSBIPUzZ\nlyLYLg+9zkTg/SYon7ZWD3be62pkV7g43CuOqMykxPujeUEskCriBYdGTJi9maDu\n+Z9OQGvoda70ZWE2/qLKi+dB5E8ROrX2pW2CmbeakynNG0DoyU2wNziXzKIMKCa6\nBW5eGOsQ+xtIkNYwlLutOs5XvQKBgQC8llB0DqX6UTfOcVQJYAEdVz4lX0u5DJ6q\nI074VIYdGEWjm0mSypf2aYx+taOrSPdw7faiYVjw012t0ur+/y4XoPnTWt90UWtf\nIcev4oChRTU5ln/Rr7l2ymHs1j8txj6a2nkOdh6vTUB85vF48V6swLRqdKIQ/usc\n5aRVtt2X4QKBgQCzLvnijS6Vu+C8DDf3U3Du/nHkxMqYXKVb/a/ucptlN2jYtslb\n01W3D3ZTXK1YTV0UuZS1MFtz08dEsNej72eUVi3v2B4js0qou9DVl8j1Vb1M5fr8\n/FZRZhlEfvkz1XLt0sFuX3r56pq00lRf5ryYhfa3yR8L1Xgl2mTfecwg0QKBgAbj\njsjOiC2ereUyqpk1EpVZzIFc+80kst8QLyBPJh8F9fVGBOgB0o9Dx8gRJotpPPC5\nIJtJ5w/VCMUCwWbTN4HRdY7M8QC0wLFW8I5yPbSmbI1P/BdSzfmS5wTZxrELXtoV\nRPrMQc6xibuGTCfY2VaCK5T/8bOhPEFv+hLPfUTBAoGAd5HZRwTeucLoA2FhKpRZ\ntpQClSEjYBYYN+WKa4xj1P/4FXAcOuDivrErH0TFMf5yuA2dbXEErQ8omcV6SQIW\nJhCth5eHy9NnIDiUl8R8BB7zOZShb//pmPRB87sj4Hu7GCqeaTAZSzK4O4zMS3iR\nxOqucA1WsF/ezDj+j1Hf+dc=\n-----END PRIVATE KEY-----\n",
      "client_email": "softhunters@softhunters-4fba5.iam.gserviceaccount.com",
      "client_id": "115757022255271137051",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/softhunters%40softhunters-4fba5.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      //"https://www.googleapis.com/auth/userinfo.email",
     // "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];
try{
    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );

    auth.AccessCredentials credentials =
    await auth.obtainAccessCredentialsViaServiceAccount(auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes, client);


    client.close();
    print("222222");
    print(credentials.accessToken.data);

    return credentials.accessToken.data;

    print(credentials.accessToken.data);}catch (error,r) {
  print('Error obtaining credentials: $error');
  print(r);
  // Handle the error appropriately
  }

  }

  Future<void> sendNotificationToSelectedDevice(
     BuildContext context) async {
    final  serverAccessTokenKey = await getAccessToken();

    String endpointFirebaseCloudMessaging =
        'https://fcm.googleapis.com/v1/projects/softhunters-4fba5/messages:send';
   // https://fcm.googleapis.com/v1/projects/myproject-b5ae1/messages:send

    final Map<String, dynamic> message =   {
      "message": {

    "topic": "news",
    "notification": {
    "title": "Breaking News",
    "body": "New news story available."
    },

    "data": {
    "story_id": "story_12345"
    }
    }
    };

    /*final Map<String, dynamic> message = {
      'message': {
        'token': deviceToken,
        'notification': {'title': "Dummy Title", 'body': "Dummy body"},
        'data': {'tripID': 'Dummy tripId'}
      }
    };*/
var headers = <String, String>{
  'Content-Type': 'application/json',
  'Authorization': 'Bearer $serverAccessTokenKey'
};
print("headers ${headers}");
    try {
      final http.Response response = await http.post(
        Uri.parse(endpointFirebaseCloudMessaging),
        headers: headers,
        body: jsonEncode(message),
      );
print(response.body);
      if (response.statusCode == 200) {
        print("Notification sent Successfully");
        print("${response.body}");
      } else {
        print("Failed, Notification not sent : ${response.statusCode}");
      }
    } catch (e, r) {
      print(e);
      print(r);

    }
  }
}
