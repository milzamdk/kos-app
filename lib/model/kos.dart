class Kos {
  late String nama, imageUrl, kecamatan, kabupaten, alamat, telp, mapUrl;
  late List photos;
  late int id, rating, harga, lemari, tempattidur, kamarmandi;

  Kos({
    required this.id,
    required this.nama,
    required this.imageUrl,
    required this.harga,
    required this.kecamatan,
    required this.kabupaten,
    required this.rating,
    required this.alamat,
    required this.telp,
    required this.mapUrl,
    required this.kamarmandi,
    required this.tempattidur,
    required this.lemari,
  });

  Kos.fromJson(json) {
    id = json['id'];
    nama = json['name'];
    imageUrl = json['image_url'];
    harga = json['price'];
    kecamatan = json['city'];
    kabupaten = json['country'];
    rating = json['rating'];
    alamat = json['address'];
    telp = json['phone'];
    mapUrl = json['map_url'];
    photos = json['photos'];
    kamarmandi = json['number_of_kitchens'];
    tempattidur = json['number_of_bedrooms'];
    lemari = json['number_of_cupboards'];
  }
}
