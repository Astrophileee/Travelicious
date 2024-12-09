class foodModel {
  final int id, review;
  final List<String>? image;
  final String name, description, location, timetable;
  final double rate;

  foodModel({
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

List<foodModel> listFood = [
  foodModel(
      id: 1,
      name: "Tomoro Coffe Cianjur",
      image: [
        'lib/assets/images/tomoro/tomoro.jpg',
        'lib/assets/images/tomoro/tomoro2.jpg',
      ],
      location:
          'Jl. Suroso, Pamoyanan, Kec. Cianjur, Kabupaten Cianjur, Jawa Barat',
      review: 32,
      description:
          "TOMORO refers to “tomorrow“ and it means “embrace the goodness and yearn for tomorrow”. This is the original aspiration of TOMORO, strive to make every good cup of coffee with heart and encourage everyone to follow their heart bravely, feel the life with heart while yearning for tomorrow. ",
      rate: 4.8,
      timetable: "Everyday 07.00-21.00"),
  foodModel(
      id: 2,
      name: "__Baeco",
      image: [
        'lib/assets/images/baeco/baeco1.jpg',
        'lib/assets/images/baeco/baeco2.jpg',
        'lib/assets/images/baeco/baeco3.jpg',
      ],
      location:
          'Jl. KH Asnawi No.9, Solokpandan, Kec. Cianjur, Kabupaten Cianjur, Jawa Barat',
      review: 34,
      description: "-",
      rate: 4.8,
      timetable: "Everyday 09.00-00.00"),
  foodModel(
      id: 3,
      name: "Secret Garden Cianjur",
      image: [
        'lib/assets/images/secretGarden/secretGarden1.jpg',
        'lib/assets/images/secretGarden/secretGarden2.jpg',
      ],
      location:
          'Jl. KH Abdullah Bin Nuh No.86-b, Sawah Gede, Kec. Cianjur, Kabupaten Cianjur, Jawa Barat',
      review: 779,
      description: "-",
      rate: 4.6,
      timetable: "Everyday 10.00-22.00"),
  foodModel(
      id: 4,
      name: "Maraloka",
      image: [
        'lib/assets/images/Maraloka/maraloka1.jpg',
        'lib/assets/images/Maraloka/maraloka2.jpg',
        'lib/assets/images/Maraloka/maraloka3.jpg',
      ],
      location:
          'Jl. Raya Sukabumi No.114, Sukamaju, Kec. Cianjur, Kabupaten Cianjur, Jawa Barat',
      review: 49,
      description: "-",
      rate: 4.8,
      timetable: "Everyday 08.00-22.00"),
  foodModel(
      id: 5,
      name: "Lorong Temu",
      image: [
        'lib/assets/images/LorongTemu/LorongTemu1.jpg',
        'lib/assets/images/LorongTemu/LorongTemu2.jpg',
      ],
      location:
          'Jl. Otista II No.36, RT.02/RW.11, Pamoyanan, Kec. Cianjur, Kabupaten Cianjur, Jawa Barat',
      review: 328,
      description: "-",
      rate: 4.6,
      timetable: "Everyday 09.00-23.00"),
  foodModel(
      id: 6,
      name: "Ninety",
      image: [
        'lib/assets/images/Ninety/ninety1.jpg',
      ],
      location:
          'Jl. Ir. H. Juanda No.29, Bojongherang, Kec. Cianjur, Kabupaten Cianjur, Jawa Barat',
      review: 115,
      description: "-",
      rate: 4.5,
      timetable: "Everyday 12.00-22.00"),
  foodModel(
      id: 7,
      name: "Menata Coffee & Eatery",
      image: [
        'lib/assets/images/Menata/menata1.jpg',
        'lib/assets/images/Menata/menata2.jpg',
      ],
      location:
          'Jl. KH Abdullah Bin Nuh No.76-78, Sawah Gede, Kec. Cianjur, Kabupaten Cianjur, Jawa Barat',
      review: 100,
      description:
          "Creating a harmounious warmth with the best coffee and food.#TimeToMenata",
      rate: 4.9,
      timetable: "Everyday 10.00-22.00"),
  foodModel(
      id: 8,
      name: "Sela Kopi Cianjur",
      image: [
        'lib/assets/images/selakopi/selakopi1.jpg',
        'lib/assets/images/selakopi/selakopi2.jpg',
      ],
      location: 'Pamoyanan, Kec. Cianjur, Kabupaten Cianjur, Jawa Barat',
      review: 257,
      description:
          "#SelaKopiEverywhere Mari berkumpul dan berbahagia bersama Sela Kopi",
      rate: 4.7,
      timetable: "Everyday 10.00-23.30"),
  foodModel(
      id: 9,
      name: "Kopitarium",
      image: [
        'lib/assets/images/kopitarium/kopitarium1.jpg',
        'lib/assets/images/kopitarium/kopitarium2.jpg',
      ],
      location:
          'Jl. KH Abdullah Bin Nuh, Nagrak, Kec. Cianjur, Kabupaten Cianjur, Jawa Barat',
      review: 7,
      description: "-",
      rate: 4.6,
      timetable: "Everyday 10.00-22.00"),
  foodModel(
      id: 10,
      name: "Warung Kopi Sonda Saji",
      image: [
        'lib/assets/images/sondasaji/sondasaji1.jpg',
        'lib/assets/images/sondasaji/sondasaji2.jpg',
      ],
      location:
          'Sebelah Spbu Panyaweuyan, Jl. Raya Ciherang No.90, Kabupaten Cianjur, Jawa Barat',
      review: 106,
      description: "-",
      rate: 4.9,
      timetable: "Everyday 10.00-22.00"),
];
