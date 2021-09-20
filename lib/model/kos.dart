class Kos {
  late String nama,
      imageUrl,
      kecamatan,
      kabupaten,
      alamat,
      telp,
      mapUrl,
      lemari,
      tempattidur,
      kamarmandi,
      mejakursi;
  late List photos;
  late int id, rating, harga;

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
    required this.mejakursi,
  });

  Kos.fromJson(json) {
    id = json['id'];
    nama = json['nama'];
    imageUrl = json['image_url'];
    harga = json['harga'];
    kecamatan = json['kecamatan'];
    kabupaten = json['kabupaten'];
    rating = json['rating'];
    alamat = json['alamat'];
    telp = json['telp'];
    mapUrl = json['map_url'];
    photos = json['photos'];
    kamarmandi = json['kamar_mandi'];
    tempattidur = json['tempat_tidur'];
    lemari = json['lemari'];
    mejakursi = json['meja_kursi'];
  }
}
