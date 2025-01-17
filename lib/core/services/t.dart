import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationsHelper {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    // get device token
    String? deviceToken = await _firebaseMessaging.getToken();
    //  DeviceToken = deviceToken;
    print(
        "===================Device FirebaseMessaging Token====================");
    print(deviceToken);
    await FirebaseMessaging.instance.subscribeToTopic("سس");
    print(
        "===================Device FirebaseMessaging Token====================");
  }

  // handle notifications when received
  void handleMessages(RemoteMessage? message) {
    if (message != null) {}
  }

  // handel notifications in case app is terminated
  void handleBackgroundNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then((handleMessages));
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessages);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Get.snackbar(
        message.notification?.title ?? "",
        message.notification?.body ?? "",
      );
      print("Message received: ${message.notification?.body}");
      // عرض الإشعار
    });
  }

  Future<String?> getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "ican-91267",
      "private_key_id": "eefd1faeda58c4b860e95a73466f52e7cda85e65",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDAUrkDIbqfNN4l\nR36EpmXjEnqiy/uT7Tu7Drjsru1+c533Rsql4U++zw78BruhpI7JtMdNEF56N3bV\nGmHSQs3mcg2KT4KHbCcwOCjuQTmEIdK5BzeQPQo0SM8YN7K16KMGn1euLl+aQ4lu\nFx/lP+hJnvKeZODKtkApJ+mWwatFxqteohaKujhhlCuUv/xZCXpLIrTr5zATf1WQ\nYwqMiOcsn9PRvJJZJubJX3cSGPCO0jAfQ4Iw+uY0fH/gY67eOIPwHAvuvY+YMZG/\nPPFCeHqUVxSynLDlEwtl0tJm/+VRdYV/wJFDUDYR7nC8zV/lqEqZROT/nuqXwCcE\nS8df+cD5AgMBAAECggEABRM5wswlT1W3EKnxZqvjGj9O1qnGLq9kM98N1gsWBSVP\nvhUovFYKLhlrMQ82wit5lszgiddR0uz7Q7YxmM7pUuM1bxitiQgmLuwlzQcSGZCb\nQwWJJmiB8tgYBPDVVF5k95larY6XjcEp/ip54ulmkRNyyLzAlNYt3Rgqnm89EeHX\nmavIqPK9s4PQqsQAN8GS1XIXp7fCGCbgQgz5pA55GA8UvRQzNUcQbb9wSNGz1yA4\nnE0D11d1R/LsouSsLTY4EeoDs3oz7j+xd15LqP4pSzg6L6ei1X0+Yc3kdyA5pyJX\n+S93rtAJz9oMioYhRfNZwOYtRglMuZH34ZPac032TQKBgQDmQueztjKW8lS44DVh\nR2/tAt2l9jdFY5bekPVfS9nOEnFFEeqQs2rmULD2iFoVUgkQ+EH4ZKVYZM2QOdV9\npKglaqL8nQbkd0imlFKUET2c6wR30i1ljpbZ7O2DG4+xJYLeaK224l8faSHKNf3C\noHFpnswScTuIFeEpWloYJcwKdQKBgQDV0jAw6StmbsOrtVGBwVBW3gWp0ubAYIug\n3PpHRKnxtcgN6urk5YGGgCCWxydmwODLr8nyDhApGumHoIoP1lb6vnNheaua0NVr\n19iVko8vtebgJcydUFSdebGlPwZyXR4xk8UyCwdfbkmpov9Cd/tHuKwJ8sbLo08R\nEr/VEvbj9QKBgQDVglpY0GwOfXvDxdqZbmVBbzPZbPoJNHQzwlRT3gCDTaSMODW5\noTRRhabhosNtG5lei+SYD7MlyKq3vnjQvTpRH5UsCerXNChAli4QMABinaWR+Wiw\nz8vfHQuLU6Yky7SSyJuzhipP9OspFnFL4/vlxSJTQ33BDRCwiKAb3ghZ9QKBgHrf\nb5wb0jnp+v3Ik48qJN3WdpCxxrLUiEin1BdyaOqi2NTOo69oB/ff11puFcFho4zJ\ndxZnaHgGpB6xbcVOGeu72Bgy0B+GVK7FegvyDeCP+p3ieuQIDqf0D9bzEeRUiI5a\n6Z4pYlI/0YrvRRrQUhFUGWEaJ41MSpp4GM78N+6lAoGACHAJTISPe7oLU6wWrucJ\niZKVl5c571B8DHuhARhwd6hpZ02qdSeSm4LUVvLcHhIPIoUqwNjd1WfgYPuhiuwk\nPBzksOJ4r9IBNYwbZlxIY1Hg2fhVd/GaMa8wT4gpSwiPTW4Me6+tRihaZpPXqeZk\nAVnt02rex3I6HrbDUYkmh58=\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-orfn8@ican-91267.iam.gserviceaccount.com",
      "client_id": "111132056634443823947",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-orfn8%40ican-91267.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    try {
      var credentials =
          auth.ServiceAccountCredentials.fromJson(serviceAccountJson);

      var client = await auth.clientViaServiceAccount(credentials, scopes);

      var accessCredentials =
          await auth.obtainAccessCredentialsViaServiceAccount(
        credentials,
        scopes,
        client,
      );

      var accessToken = accessCredentials.accessToken.data;

      client.close();

      print("Access Token: $accessToken");
      return accessToken;
    } catch (e) {
      if (e is DioException) {
        print("Error getting access token: ${e.response?.data}");
      }
      print(e.toString());
      return null;
    }
  }

  Map<String, dynamic> getBody({
    required String fcmToken,
    required String title,
    required String body,
    required String userId,
    required String localTimeString,
    String? type,
  }) {
    return {
      "message": {
        "token": fcmToken,
        "notification": {"title": title, "body": body},
        "android": {
          "notification": {
            "notification_priority": "PRIORITY_MAX",
            "sound": "default",
          }
        },
        "apns": {
          "payload": {
            "aps": {"content_available": true}
          }
        },
        "data": {
          "type": type,
          "id": userId,
          "click_action": "FLUTTER_NOTIFICATION_CLICK"
        }
      }
    };
  }

  Future<void> sendNotifications({
    required String fcmToken,
    required String title,
    required String body,
    required String userId,
    String? type,
  }) async {
    DateTime localTime = DateTime.now();
    String localTimeString = localTime.toIso8601String();

    try {
      var serverKeyAuthorization = await getAccessToken();

      // change your project id
      const String urlEndPoint =
          "https://fcm.googleapis.com/v1/projects/ican-91267/messages:send";

      Dio dio = Dio();
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $serverKeyAuthorization';

      var response = await dio.post(
        urlEndPoint,
        data: getBody(
          userId: userId,
          localTimeString: localTimeString,
          fcmToken: fcmToken,
          title: title,
          body: body,
          type: type ?? "message",
        ),
      );

      // Print response status code and body for debugging
      print('Response Status Code: ${response.statusCode}');
      print('Response Data: ${response.data}');
    } catch (e) {
      if (e is DioException) {
        print("Error sending notification: ${e.response?.data}");
      }
      print("Error sending notification: $e");
    }
  }
}
