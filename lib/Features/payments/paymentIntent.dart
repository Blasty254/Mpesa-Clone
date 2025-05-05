import 'dart:convert';

import 'package:http/http.dart' as http;

class PaymentService {
  final String backendUrl = 'cd';
  Future<String> createPaymentIntent(double amount, String currency) async {
    final url = Uri.parse('$backendUrl/create-payment-intent');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'applications/json'},
      body: jsonEncode({
        'amount': (amount * 100).toInt(),
        'currency': currency,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['clientSecret'];
    } else {
      print('Failed to create payment intent : ${response.body}');
      throw Exception('Failed to create payment intent: ${response.body}');
    }
  }
}
