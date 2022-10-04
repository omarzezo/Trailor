  import 'package:flutter/material.dart';
import 'package:omar/models/TypesModel.dart';

  List<TypesModel> getTypesList(){
    List<TypesModel>typesList=[];
    typesList.add(TypesModel(id: 1,name: "نوع الثوب",image: "image/Robe/Emrati-front.png" ));
    typesList.add(TypesModel(id: 2,name: "نوع الياقة",image: "image/collar/collar-1.png" ));
    typesList.add(TypesModel(id: 3,name: "نوع الكبك",image: "image/Cabak/cabak-1.png"    )    );
    typesList.add(TypesModel(id: 4,name: "نوع الجيب",image: "image/pocket/Pocket-1.png"  )  );
    typesList.add(TypesModel(id: 5,name: "نوع الجبزور",image: "image/Gabzor/Gabzor-1.png"));
    return typesList;
  }

  List<TypesModel> relatedTypes(){
    List<TypesModel>typesList=[];
    typesList.add(TypesModel(id: 1,name: "سعودي",image: "image/Robe/Saudi- front.png",frontImage: "image/Robe/Saudi- front.png" ,backImage: "image/Robe/Saudi-back.png" ));
    typesList.add(TypesModel(id: 2,name: "قطري",image: "image/Robe/Qatari-front.png",frontImage: "image/Robe/Qatari-front.png" ,backImage: "image/Robe/Qatari-back.png" ));
    typesList.add(TypesModel(id: 3,name: "كويتي",image: "image/Robe/kwity-front.png",frontImage: "image/Robe/kwity-front.png" ,backImage: "image/Robe/kwity-back.png" ));
    typesList.add(TypesModel(id: 4,name: "عماني",image: "image/Robe/omani-front.png",frontImage: "image/Robe/omani-front.png" ,backImage: "image/Robe/omani-back.png" ));
    typesList.add(TypesModel(id: 5,name: "اماراتي",image: "image/Robe/Emrati-front.png",frontImage: "image/Robe/Emrati-front.png" ,backImage: "image/Robe/Emrati-back.png" ));
    typesList.add(TypesModel(id: 6,name: "نوم",image: "image/Robe/sleep-front.png",frontImage: "image/Robe/sleep-front.png" ,backImage: "image/Robe/sleep-back.png" ));
    return typesList;
  }

  List<TypesModel> relatedCollar(){
    List<TypesModel>typesList=[];
    typesList.add(TypesModel(id: 0,name: "3",image: "image/collar/collar-1.png"));
    typesList.add(TypesModel(id: 1,name: "كبس زرار سادة",image: "image/collar/collar-2.png"));
    typesList.add(TypesModel(id: 2,name: "ياقة",image: "image/collar/collar-3.png"));
    typesList.add(TypesModel(id: 3,name: "ساده كبس مخفي",image: "image/collar/collar-4.png"));
    typesList.add(TypesModel(id: 4,name: "ساده1*1 كبس زرار",image: "image/collar/collar-5.png"));
    typesList.add(TypesModel(id: 5,name: "ساده2*2 زرار سنجل",image: "image/collar/collar-6.png"));
    typesList.add(TypesModel(id: 6,name: "قلاب 2 كبس",image: "image/collar/collar-7.png"));
    typesList.add(TypesModel(id: 7,name: "4",image: "image/collar/collar-8.png"));
    typesList.add(TypesModel(id: 8,name: "قلاب 2 كبس فرنسي",image: "image/collar/collar-9.png"));
    typesList.add(TypesModel(id: 9,name: "قلاب 1 كبس زرار",image: "image/collar/collar-10.png"));
    typesList.add(TypesModel(id: 10,name: "قلاب 1 كبس مخفي",image: "image/collar/collar-11.png"));
    typesList.add(TypesModel(id: 11,name: "قلاب 1 كبس مخفي",image: "image/collar/collar-12.png"));
    typesList.add(TypesModel(id: 12,name: "5",image: "image/collar/collar-13.png"));
    typesList.add(TypesModel(id: 13,name: "2",image: "image/collar/collar-14.png"));
    typesList.add(TypesModel(id: 14,name: "10",image: "image/collar/collar-15.png"));
    typesList.add(TypesModel(id: 15,name: "1",image: "image/collar/collar-16.png"));
    typesList.add(TypesModel(id: 16,name: "12",image: "image/collar/collar-17.png"));
    typesList.add(TypesModel(id: 17,name: "13",image: "image/collar/collar-18.png"));
    typesList.add(TypesModel(id: 18,name: "14",image: "image/collar/collar-19.png"));
    typesList.add(TypesModel(id: 19,name: "15",image: "image/collar/collar-20.png"));
    typesList.add(TypesModel(id: 20,name: "7",image: "image/collar/collar-21.png"));
    typesList.add(TypesModel(id: 21,name: "6",image: "image/collar/collar-22.png"));
    return typesList;
  }

  List<TypesModel> relatedKabak(){
    List<TypesModel>typesList=[];
    typesList.add(TypesModel(id: 0,name: "كبك 1",   image: "image/Cabak/cabak-1.png"));
    typesList.add(TypesModel(id: 1,name: "كبك 2",   image: "image/Cabak/cabak-2.png"));
    typesList.add(TypesModel(id: 2,name: "كبك 3",   image: "image/Cabak/cabak-3.png"));
    typesList.add(TypesModel(id: 3,name: "كبك 4",   image: "image/Cabak/cabak-4.png"));
    typesList.add(TypesModel(id: 4,name: "كبك 5",   image: "image/Cabak/cabak-5.png"));
    typesList.add(TypesModel(id: 5,name: "كبك 6",   image: "image/Cabak/cabak-6.png"));
    typesList.add(TypesModel(id: 6,name: "كبك 7",   image: "image/Cabak/cabak-7.png"));
    typesList.add(TypesModel(id: 7,name: "كبك 8",   image: "image/Cabak/cabak-8.png"));
    typesList.add(TypesModel(id: 8,name: "كبك 9",   image: "image/Cabak/cabak-9.png"));
    typesList.add(TypesModel(id: 9,name: "كبك 10",   image: "image/Cabak/cabak-10.png"));
    typesList.add(TypesModel(id: 10,name: "كبك 11",  image: "image/Cabak/cabak-11.png"));
    typesList.add(TypesModel(id: 11,name: "كبك 12",  image: "image/Cabak/cabak-12.png"));
    typesList.add(TypesModel(id: 12,name: "كبك 13",  image: "image/Cabak/cabak-13.png"));
    typesList.add(TypesModel(id: 13,name: "كبك 14",  image: "image/Cabak/cabak-14.png"));
    typesList.add(TypesModel(id: 14,name: "كبك 15",  image: "image/Cabak/cabak-15.png"));
    typesList.add(TypesModel(id: 15,name: "كبك 16",  image: "image/Cabak/cabak-16.png"));
    typesList.add(TypesModel(id: 16,name: "كبك 17",  image: "image/Cabak/cabak-17.png"));
    typesList.add(TypesModel(id: 17,name: "كبك 18",  image: "image/Cabak/cabak-18.png"));
    typesList.add(TypesModel(id: 18,name: "كبك 19",  image: "image/Cabak/cabak-19.png"));
    typesList.add(TypesModel(id: 19,name: "كبك 20",  image: "image/Cabak/cabak-20.png"));
    typesList.add(TypesModel(id: 20,name: "كبك 21",  image: "image/Cabak/cabak-21.png"));
    typesList.add(TypesModel(id: 21,name: "كبك 22",  image: "image/Cabak/cabak-22.png"));
    typesList.add(TypesModel(id: 22,name: "كبك 23",  image: "image/Cabak/cabak-23.png"));
    return typesList;
  }

  List<TypesModel> relatedPocket(){
    List<TypesModel>typesList=[];
    typesList.add(TypesModel(id: 0,name: "جيب رسمي",   image: "image/pocket/Pocket-1.png"));
    typesList.add(TypesModel(id: 1,name: "جيب مربع",   image: "image/pocket/Pocket-2.png"));
    typesList.add(TypesModel(id: 2,name: "جيب كويتي",   image: "image/pocket/Pocket-3.png"));
    typesList.add(TypesModel(id: 3,name: "8",   image: "image/pocket/Pocket-4.png"));
    typesList.add(TypesModel(id: 4,name: "7",   image: "image/pocket/Pocket-5.png"));
    typesList.add(TypesModel(id: 5,name: "9",   image: "image/pocket/Pocket-6.png"));
    typesList.add(TypesModel(id: 6,name: "3",   image: "image/pocket/Pocket-7.png"));
    typesList.add(TypesModel(id: 7,name: "11",   image: "image/pocket/Pocket-8.png"));
    typesList.add(TypesModel(id: 8,name: "10",   image: "image/pocket/Pocket-9.png"));
    typesList.add(TypesModel(id: 9,name: "4",   image: "image/pocket/Pocket-10.png"));
    typesList.add(TypesModel(id: 10,name: "5",  image: "image/pocket/Pocket-11.png"));
    typesList.add(TypesModel(id: 11,name: "6",  image: "image/pocket/Pocket-12.png"));
    return typesList;
  }

  List<TypesModel> relatedGabzor(){
    List<TypesModel>typesList=[];
    typesList.add(TypesModel(id: 0,name: "بــــــــايــــــــن",    image: "image/Gabzor/Gabzor-1.png"));
    typesList.add(TypesModel(id: 1,name: "مخـــــفـــــــــي",    image: "image/Gabzor/Gabzor-2.png"));
    typesList.add(TypesModel(id: 2,name: "باين مربع",   image: "image/Gabzor/Gabzor-3.png"));
    typesList.add(TypesModel(id: 3,name: "مخفي مربع",           image: "image/Gabzor/Gabzor-4.png"));
    typesList.add(TypesModel(id: 4,name: "8",           image: "image/Gabzor/Gabzor-5.png"));
    typesList.add(TypesModel(id: 5,name: "6",           image: "image/Gabzor/Gabzor-6.png"));
    typesList.add(TypesModel(id: 6,name: "4",           image: "image/Gabzor/Gabzor-7.png"));
    typesList.add(TypesModel(id: 7,name: "2",          image: "image/Gabzor/Gabzor-8.png"));
    return typesList;
  }

  List<TypesModel> getRelatedListAnyType(int index){
    if(index==0){
    return relatedTypes();
    }else if(index==1){
      return relatedCollar();
    }else if(index==2){
      return relatedKabak();
    }else if(index==3){
      return relatedPocket();
    }else if(index==4){
      return relatedGabzor();
    }else{
      return [];
    }
  }


class ListOfImage {



 static List<String> varity = [
    'image/Robe/Emrati-back.png',
    'image/Cabak/cabak-1.png',
    'image/collar/collar-1.png',
    'image/Gabzor/Gabzor-1.png',
    'image/pocket/Pocket-1.png',
    'image/Robe-Species/emrati.png',
  ];
  // Robe

  static List<String> robe = [
    'image/Robe/Emrati-back.png',
    'image/Robe/Emrati-front.png',
    'image/Robe/kwity-back.png',
    'image/Robe/kwity-front.png',
    'image/Robe/omani-back.png',
    'image/Robe/omani-front.png',
    'image/Robe/Qatari-back.png',
    'image/Robe/Qatari-front.png',
    'image/Robe/Saudi-back.png',
    'image/Robe/Saudi- front.png',
    'image/Robe/sleep-back.png',
    'image/Robe/sleep-front.png',
  ];

  // static List<Image> robeImage = [
  //   Image.asset('image/Robe/Emrati-back.png'),
  //   Image.asset('image/Robe/Emrati-front.png'),
  //   Image.asset('image/Robe/kwity-back.png'),
  //   Image.asset('image/Robe/kwity-front.png'),
  //   Image.asset('image/Robe/omani-back.png'),
  //   Image.asset('image/Robe/omani-front.png'),
  //   Image.asset('image/Robe/Qatari-back.png'),
  //   Image.asset('image/Robe/Qatari-front.png'),
  //   Image.asset('image/Robe/Saudi-back.png'),
  //   Image.asset('image/Robe/Saudi- front.png'),
  //   Image.asset('image/Robe/sleep-back.png'),
  //   Image.asset('image/Robe/sleep-front.png'),
  // ];

  // Cabak

  static  List<String> cabak = [
    'image/Cabak/cabak-1.png',
    'image/Cabak/cabak-2.png',
    'image/Cabak/cabak-3.png',
    'image/Cabak/cabak-4.png',
    'image/Cabak/cabak-5.png',
    'image/Cabak/cabak-6.png',
    'image/Cabak/cabak-7.png',
    'image/Cabak/cabak-8.png',
    'image/Cabak/cabak-9.png',
    'image/Cabak/cabak-10.png',
    'image/Cabak/cabak-11.png',
    'image/Cabak/cabak-12.png',
    'image/Cabak/cabak-13.png',
    'image/Cabak/cabak-14.png',
    'image/Cabak/cabak-15.png',
    'image/Cabak/cabak-16.png',
    'image/Cabak/cabak-17.png',
    'image/Cabak/cabak-18.png',
    'image/Cabak/cabak-19.png',
    'image/Cabak/cabak-20.png',
    'image/Cabak/cabak-21.png',
    'image/Cabak/cabak-22.png',
    'image/Cabak/cabak-23.png',
  ];

  // Coller

  static List<String> coller = [
    'image/collar/collar-1.png',
    'image/collar/collar-2.png',
    'image/collar/collar-3.png',
    'image/collar/collar-4.png',
    'image/collar/collar-5.png',
    'image/collar/collar-6.png',
    'image/collar/collar-7.png',
    'image/collar/collar-8.png',
    'image/collar/collar-9.png',
    'image/collar/collar-10.png',
    'image/collar/collar-11.png',
    'image/collar/collar-12.png',
    'image/collar/collar-13.png',
    'image/collar/collar-14.png',
    'image/collar/collar-15.png',
    'image/collar/collar-16.png',
    'image/collar/collar-17.png',
    'image/collar/collar-18.png',
    'image/collar/collar-19.png',
    'image/collar/collar-20.png',
    'image/collar/collar-21.png',
    'image/collar/collar-22.png',
    'image/collar/collar-23.png',
    'image/collar/collar-24.png',
  ];

  // Gabzor

  static  List<String> gabzor = [
    'image/Gabzor/Gabzor-1.png',
    'image/Gabzor/Gabzor-2.png',
    'image/Gabzor/Gabzor-3.png',
    'image/Gabzor/Gabzor-4.png',
    'image/Gabzor/Gabzor-5.png',
    'image/Gabzor/Gabzor-6.png',
    'image/Gabzor/Gabzor-7.png',
    'image/Gabzor/Gabzor-8.png',
  ];

  // Pocket

  static List<String> pocket = [
    'image/pocket/Pocket-1.png',
    'image/pocket/Pocket-2.png',
    'image/pocket/Pocket-3.png',
    'image/pocket/Pocket-4.png',
    'image/pocket/Pocket-5.png',
    'image/pocket/Pocket-6.png',
    'image/pocket/Pocket-7.png',
    'image/pocket/Pocket-8.png',
    'image/pocket/Pocket-9.png',
    'image/pocket/Pocket-10.png',
    'image/pocket/Pocket-11.png',
    'image/pocket/Pocket-12.png',
  ];

  // Robe-Species

  static List<String> robe_species = [
    'image/Robe-Species/emrati.png',
    'image/Robe-Species/kwity.png',
    'image/Robe-Species/omani.png',
    'image/Robe-Species/Qatari.png',
    'image/Robe-Species/Saudi.png',
    'image/Robe-Species/sleep.png',
  ];
}
