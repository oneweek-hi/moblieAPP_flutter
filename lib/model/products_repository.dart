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

import 'product.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product> [
//      Product(
//        category: Category.accessories,
//        id: 0,
//        isFeatured: true,
//        name: 'Vagabond sack',
//        price: 120,
//      ),
      Product(
        category: Category.accessories,
        id: 0,
        star: 3,
        hotelName: 'Stamford Plaza',
        location: 'Corner of Edward Street & Margaret Street',
        callNumber: '+48 576 2573 132',
        detail: 'Guests can dine riverside on the promenade at The Brasserie on the River, or indoors for breakfast, lunch and dinner. The Brasserie offers a popular seafood buffet and delightful high tea. Kabuki Japanese features teppanyaki grill options or a la carte selections. The Pav Bar is the place for a light menu and cocktail while enjoying the open-air courtyard.'
      ),
      Product(
        category: Category.accessories,
        id: 1,
        star: 5,
        hotelName: 'Emporium Hotel',
        location: '267 Grey Street, South Brisbane, 4101',
          callNumber: '+48 243 9756 098',
          detail: 'The refurbished guest rooms offer a tranquil and luxurious stay and feature a classic, elegant style. All spacious, air-conditioned rooms include a flat-screen TV, free WiFi, mini bar, tea/coffee making facilities and a work space. The luxurious marble bathrooms feature a separate bath and walk-in shower. 24-hour in room dining is available.'
      ),
      Product(
        category: Category.accessories,
        id: 2,
        star: 4,
        hotelName: 'Charlotte Suites',
        location: '128 Charlotte Street, Brisbane CBD, 4000',
          callNumber: '+48 335 1623 8786',
          detail: 'This unique riverfront property offers stunning vistas to the iconic Story Bridge and Kangaroo Point cliffs and lush open gardens. It features an onsite outdoor pool and spa, sauna, 24-hour fitness center and 3 restaurants and bars.'
      ),
      Product(
        category: Category.accessories,
        id: 3,
        star: 3,
        hotelName: 'Evolution Hotel',
        location: '18 Tank Street, Brisbane CBD, 4000',
          callNumber: '+45 243 221 3324',
          detail: 'The hotel is located in the hub of the CBD (Central Business District) and within the city’s prestigious dining and shopping precinct. Self parking is available at an off-site location, 240 m from the hotel.'
      ),
      Product(
        category: Category.accessories,
        id: 4,
        star: 4,
        hotelName: 'Ibis Elizabeth',
        location: '40 Elizabeth Street, Brisbane CBD',
          callNumber: '+48 203 2940 392',
          detail:'ibis Styles Brisbane Elizabeth Street is set in Brisbane, 328 feet from Treasury Building - Casino and 1.1 mi from Suncorp Stadium. Guests can enjoy the on-site bar. Rooms have a TV.'
      ),
      Product(
        category: Category.accessories,
        id: 5,
        star: 3,
        hotelName: 'Oakwood Hotel',
        location: '15 Ivory Lane, Brisbane CBD',
          callNumber: '+48 354 2668 375',
          detail: 'Located in Brisbane\'s CBD (Central Business District), Oaks Brisbane on Charlotte Suites offers self-contained accommodations with a private balcony.'
      ),
    ];
    if (category == Category.all) {
      return allProducts;
    } else {
      return allProducts.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }
}
