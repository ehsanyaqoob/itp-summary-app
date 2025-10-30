import 'dart:convert';
import 'package:http/http.dart' as http;
const String baseUrl = 'https://traffic.islamabadpolice.gov.pk/v1/api/challan-summary'; // Replace with your actual base URL



// const String baseUrl = 'https://example.com'; // Replace with your actual base URL
// const String analysisEndpoint = '/api/analysis'; // Replace with your actual endpoint
// class AnalysisController {
//   AnalysisController({});

//   Future<AnalysisResponse> fetchAnalysisData() async {
//     final url = Uri.parse('$baseUrl$analysisEndpoint');
//     print('🔵 [AnalysisController] Fetching analysis data from: $url');

//     try {
//       final response = await http.get(
//         url,
//         headers: {'Content-Type': 'application/json'},
//       );

//       print('🟢 [AnalysisController] Response status: ${response.statusCode}');
//       print('🟢 [AnalysisController] Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         final jsonResponse = json.decode(response.body);
//         final analysisResponse = AnalysisResponse.fromJson(jsonResponse);

//         if (analysisResponse.status) {
//           print('✅ [AnalysisController] Analysis data fetched successfully');
//           _logAnalysisData(analysisResponse.data);
//           return analysisResponse;
//         } else {
//           print('🔴 [AnalysisController] API returned false status: ${analysisResponse.message}');
//           throw Exception('API error: ${analysisResponse.message}');
//         }
//       } else {
//         print('🔴 [AnalysisController] HTTP error: ${response.statusCode}');
//         throw Exception('Failed to load analysis data: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('🔴 [AnalysisController] Error fetching analysis data: $e');
//       rethrow;
//     }
//   }

//   void _logAnalysisData(AnalysisData data) {
//     print('\n📊 Analysis Data Summary:');
    
//     // Today's data
//     print('\n📅 Today:');
//     print('  - Records: ${data.today.records}');
//     print('  - Paid: ${data.today.totalPaid}');
//     print('  - Unpaid: ${data.today.totalUnpaid}');
//     print('  - Total Amount: ${data.today.totalAmount}');
//     print('  - Paid Tickets: ${data.today.paidTickets}');
//     print('  - Unpaid Tickets: ${data.today.unpaidTickets}');
    
//     // Weekly data
//     print('\n📅 Week:');
//     print('  - Records: ${data.week.records}');
//     print('  - Paid: ${data.week.paid}');
//     print('  - Unpaid: ${data.week.unpaid}');
//     print('  - Total Amount: ${data.week.totalAmount}');
//     print('  - Paid Tickets: ${data.week.paidTickets}');
//     print('  - Unpaid Tickets: ${data.week.unpaidTickets}');
    
//     // Monthly data
//     print('\n📅 Month:');
//     print('  - Records: ${data.month.records}');
//     print('  - Paid: ${data.month.paid}');
//     print('  - Unpaid: ${data.month.unpaid}');
//     print('  - Total Amount: ${data.month.totalAmount}');
//     print('  - Paid Tickets: ${data.month.paidTickets}');
//     print('  - Unpaid Tickets: ${data.month.unpaidTickets}');
    
//     // Yearly data
//     print('\n📅 Year:');
//     print('  - Records: ${data.year.records}');
//     print('  - Paid: ${data.year.paid}');
//     print('  - Unpaid: ${data.year.unpaid}');
//     print('  - Total Amount: ${data.year.totalAmount}');
//     print('  - Paid Tickets: ${data.year.paidTickets}');
//     print('  - Unpaid Tickets: ${data.year.unpaidTickets}');
//   }
// }


