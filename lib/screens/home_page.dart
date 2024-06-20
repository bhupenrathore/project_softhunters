import 'package:flutter/material.dart';
import 'package:project/services/push_notification_service.dart';

import '../constants/app_colors.dart';
import '../models/view_schemes_api_model.dart';
import '../services/view_scheme_api_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          PushNotificationService pushNotificationService =
              PushNotificationService();
          pushNotificationService.sendNotificationToSelectedDevice(
            context,
          );
        },
      ),*/
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: schemesList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 8.0),
              const Expanded(
                child: Center(
                  child: Text(
                    'View Schemes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search),
                hintText: 'Enter unit number, type, status...',
                hintStyle: const TextStyle(color: Colors.black12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget schemesList() {
    return FutureBuilder<ViewSchemesApiModel?>(
      future: ViewSchemeApi().viewSchemeApiRequest(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData ||
            snapshot.data?.result?.properties?.data == null) {
          return const Center(child: Text('No schemes available.'));
        } else {
          List<Data> schemes = snapshot.data!.result!.properties!.data!;
          return ListView.builder(
            itemCount: schemes.length,
            itemBuilder: (context, index) {
              return schemeCard(schemes[index]);
            },
          );
        }
      },
    );
  }

  Widget schemeCard(Data scheme) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${scheme.plotType ?? ""}- ${scheme.plotName ?? ""}',
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      scheme.schemeName ?? "",
                      style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Text(
                  "Available",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                )
              ],
            ),
            const SizedBox(height: 8.0),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            const SizedBox(height: 8.0),
            Text(
                'Plot-No.: ${scheme.attributesData?.no ?? ""}, Size (Sq. Mtr): ${scheme.attributesData?.sizeSqMtr ?? ""}, Size (Sq. Yrds): ${scheme.attributesData?.sizeSqYrds ?? ""}'),
            const SizedBox(height: 8.0),
            Text(
                'Slable Area (Sq. Yrd): ${scheme.attributesData?.slableAreaSqYrd ?? ""}, Facing: ${scheme.attributesData?.facing ?? ""}, Road size: ${scheme.attributesData?.roadSize ?? ""}'),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text('Book/Hold',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
