import 'package:e_commerce_app/models/location_model.dart';
import 'package:e_commerce_app/views/widgets/location_item_widget.dart';
import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose your location',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'let\'s find your unforgettable event. Choose a location below to get started',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(color: Colors.black),
                    ),
                    leading: const Icon(
                      Icons.location_on_outlined,
                      color: Colors.black,
                    ),
                    title: const Text(
                      'San Diego, CA',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(
                      Icons.gps_fixed_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                'Select location',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listOfLocations.length,
                itemBuilder: (context, index) {
                  final item = listOfLocations[index];
                  return InkWell(
                    child: LocationItemWidget(locationItem: item),
                    onTap: () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
