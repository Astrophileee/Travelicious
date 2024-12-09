class destinationModel {
  final int id, review;
  final List<String>? image;
  final String name, description, location, timetable;
  final double rate;

  destinationModel({
    required this.id,
    required this.name,
    required this.image,
    required this.location,
    required this.review,
    required this.description,
    required this.rate,
    required this.timetable,
  });
}

List<destinationModel> listDestination = [
  destinationModel(
      id: 1,
      name: "The Nice Funtastic Park",
      image: [
        'lib/assets/images/theNice/thenice.png',
        'lib/assets/images/theNice/thenice2.jpg',
      ],
      location:
          'Jl. Mariwati No.KM. 11, Sukaresmi, Kec. Sukaresmi, Kabupaten Cianjur, Jawa Barat',
      review: 2556,
      description: "-",
      rate: 4.6,
      timetable: "Everyday 09.00-17.00"),
  destinationModel(
      id: 2,
      name: "Curug Cikondang",
      image: [
        'lib/assets/images/curugCikondang/curugcikondang.png',
      ],
      location: 'Sukadana, Kec. Campaka, Kabupaten Cianjur, Jawa Barat',
      review: 1159,
      description: "-",
      rate: 4.7,
      timetable: "Everyday 09.00-17.00"),
  destinationModel(
      id: 3,
      name: "Curug Cibeureum",
      image: [
        'lib/assets/images/curugCibeureum/curugCibeureum.jpg',
      ],
      location:
          'JL. Cisarua Puncak KM. 10, Desa Cilember, Kec. Cisarua, Puncak, Cimacan, Kec. Cipanas, Kabupaten Cianjur, Jawa Barat',
      review: 2835,
      description:
          "Curug Cibereum adalah air terjun yang berada di Kabupaten Cianjur, Provinsi Jawa Barat. Di kawasan ini terdiri dari tiga air terjun yang saling berdekatan. Selain air terjun utama Curug Cibeureum, terdapat dua air terjun lain yang lebih kecil, yaitu Curug Cidendeng dan Curug Cikundul.",
      rate: 4.7,
      timetable: "Everyday 06.00-18.00"),
  destinationModel(
      id: 4,
      name: "Pantai Karang Potong",
      image: [
        'lib/assets/images/pantaiKarangPotong/pantaikarangpotong.jpg',
      ],
      location:
          'G5J9+26J, Saganten, Kec. Sindangbarang, Kabupaten Cianjur, Jawa Barat',
      review: 1870,
      description:
          "Dek observasi tepi laut dengan papan petunjuk terang dan pagar bercat yang digunakan sebagai latar foto.",
      rate: 4.4,
      timetable: "Everyday 08.00-00.00"),
  destinationModel(
      id: 5,
      name: "Telaga Biru",
      image: [
        'lib/assets/images/telagaBiru/telagabiru.jpg',
      ],
      location:
          '7X2V+HPR, Sindangjaya, Kec. Cipanas, Kabupaten Cianjur, Jawa Barat 43253',
      review: 1003,
      description: "-",
      rate: 4.6,
      timetable: "Everyday 09.00-17.00"),
  destinationModel(
      id: 6,
      name: "kebun Raya Cibodas",
      image: [
        'lib/assets/images/kebunRayaCibodas/kebunRayaCibodas.jpg',
      ],
      location:
          'Jl. Kebun Raya Cibodas, Sindangjaya, Kec. Cipanas, Kabupaten Cianjur, Jawa Barat 43253',
      review: 17000,
      description:
          "Didirikan pada tanggal 11 April 1852 oleh Johannes Ellias Teijsmann, seorang kurator Kebun Raya Bogor pada waktu itu, dengan nama Bergtuin te Tjibodas (Kebun Pegunungan Cibodas). Pada awalnya dimaksudkan sebagai tempat aklimatisasi jenis-jenis tumbuhan asal luar negeri yang mempunyai nilai penting dan ekonomi yang tinggi, salah satunya adalah Pohon Kina (Cinchona calisaya). Kemudian berkembang menjadi bagian dari Kebun Raya Bogor dengan nama Cabang Balai Kebun Raya Cibodas. Mulai tahun 2003 status Kebun Raya Cibodas menjadi lebih mandiri sebagai Unit Pelaksana Teknis Balai Konservasi Tumbuhan Kebun Raya Cibodas di bawah Pusat Konservasi Tumbuhan Kebun Raya Bogor dalam kedeputian Ilmu Pengetahuan Hayati Lembaga Ilmu Pengetahuan Indonesia (LIPI).",
      rate: 4.6,
      timetable: "Everyday 09.00-17.00"),
  destinationModel(
      id: 7,
      name: "Pantai Jayanti",
      image: [
        'lib/assets/images/pantaiJayanti/pantaijayanti.jpg',
      ],
      location:
          'Jl. Pantai Jayanti, Cidamar, Kec. Cidaun, Kabupaten Cianjur, Jawa Barat 43275',
      review: 3449,
      description:
          "Pantai Jayanti adalah sebuah pantai yang terletak di Desa Cidamar, Kecamatan Cidaun, Kabupaten Cianjur, Jawa Barat. Pantai ini berdampingan dengan Cagar Alam Bojonglarang dan pelabuhan nelayan",
      rate: 4.1,
      timetable: "Everyday 08.00-00.00"),
];
