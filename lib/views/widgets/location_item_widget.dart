import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/models/location_model.dart';
import 'package:e_commerce_app/utils/colors_app.dart';
import 'package:flutter/material.dart';

class LocationItemWidget extends StatefulWidget {
  final LocationModel locationItem;
  final bool? selected;
  const LocationItemWidget(
      {super.key, required this.locationItem, this.selected = false});

  @override
  State<LocationItemWidget> createState() => _LocationItemWidgetState();
}

class _LocationItemWidgetState extends State<LocationItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 12.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.locationItem.cityName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '${widget.locationItem.cityName}, ${widget.locationItem.countryName}',
                    style: const TextStyle(color: AppColors.grey),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: AppColors.grey,
                radius: 38,
                child: CachedNetworkImage(
                  imageUrl: widget.locationItem.imgUrl,
                  height: 70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//  Text(
//             '${widget.locationItem.cityName}, ${widget.locationItem.countryName}',
//             style: const TextStyle(color: AppColors.grey),
//           ),

          // Border.all(
          //   color: widget.selected! ? AppColors.primaryColor : AppColors.grey,
          // ),


          // Text(
          //   widget.locationItem.cityName,
          //   style: const TextStyle(
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),