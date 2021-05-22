import 'package:danoetz_vascomm/core/models/Menu.dart';
import 'package:danoetz_vascomm/core/models/Product.dart';
import 'package:danoetz_vascomm/core/models/TipeLayanan.dart';

class Data {
  List<Menu> listMenu = [
    Menu(
      id: 0,
      value: 'All Product',
    ),
    Menu(
      id: 1,
      value: 'Layanan kesehatan',
    ),
    Menu(
      id: 2,
      value: 'Alat Kesehatan',
    ),
  ];

  List<Product> listProducts = [
    Product(
      id: 0,
      name: 'Suntik Steril',
      photo: 'assets/images/img_product.png',
      price: 'Rp. 10.000',
      qty: 10,
      rating: 5,
    ),
    Product(
      id: 1,
      name: 'Suntik Steril',
      photo: 'assets/images/img_product.png',
      price: 'Rp. 10.000',
      qty: 10,
      rating: 5,
    ),
    Product(
      id: 2,
      name: 'Masker',
      photo: 'assets/images/img_product.png',
      price: 'Rp. 30.000',
      qty: 0,
      rating: 5,
    ),
    Product(
      id: 3,
      name: 'Masker',
      photo: 'assets/images/img_product.png',
      price: 'Rp. 17.000',
      qty: 4,
      rating: 4,
    ),
  ];

  List<TipeLayanan> listTipeLayanan = [
    TipeLayanan(
      id: 0,
      name: 'PCR Swab Test (Drive Thru)',
      photo: 'assets/images/img_layanan_1.png',
      price: 'Rp. 10.000',
      result: 'Hasil 1 Hari Kerja',
      building: 'Lenmarc Surabaya',
      address: 'Dukuh Pakis, Surabaya',
    ),
    TipeLayanan(
      id: 1,
      name: 'PCR Swab Test (Drive Thru)',
      photo: 'assets/images/img_layanan_2.png',
      price: 'Rp. 10.000',
      result: 'Hasil 1 Hari Kerja',
      building: 'Lenmarc Surabaya',
      address: 'Dukuh Pakis, Surabaya',
    ),
    TipeLayanan(
      id: 2,
      name: 'PCR Swab Test (Drive Thru)',
      photo: 'assets/images/img_layanan_1.png',
      price: 'Rp. 10.000',
      result: 'Hasil 1 Hari Kerja',
      building: 'Lenmarc Surabaya',
      address: 'Dukuh Pakis, Surabaya',
    ),
    TipeLayanan(
      id: 3,
      name: 'PCR Swab Test (Drive Thru)',
      photo: 'assets/images/img_layanan_2.png',
      price: 'Rp. 10.000',
      result: 'Hasil 1 Hari Kerja',
      building: 'Lenmarc Surabaya',
      address: 'Dukuh Pakis, Surabaya',
    ),
    TipeLayanan(
      id: 4,
      name: 'PCR Swab Test (Drive Thru)',
      photo: 'assets/images/img_layanan_1.png',
      price: 'Rp. 10.000',
      result: 'Hasil 1 Hari Kerja',
      building: 'Lenmarc Surabaya',
      address: 'Dukuh Pakis, Surabaya',
    ),
  ];
}
