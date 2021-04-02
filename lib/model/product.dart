// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/foundation.dart';

enum Category { all, accessories, clothing, home, }

class Product {
  const Product({
    @required this.category,
    @required this.id,
    @required this.star,
    @required this.hotelName,
    @required this.location,
    @required this.callNumber,
    @required this.detail,
  })  : assert(category != null),
        assert(id != null),
        assert(star != null),
        assert(hotelName != null),
        assert(location != null),
        assert(callNumber != null),
        assert(detail != null);

  final Category category;
  final int id;
  final int star;
  final String hotelName;
  final String location;
  final String callNumber;
  final String detail;

  String get assetName => 'assets/hotel/$id.png';

  @override
  String toString() => "$hotelName (id=$id)";
}
