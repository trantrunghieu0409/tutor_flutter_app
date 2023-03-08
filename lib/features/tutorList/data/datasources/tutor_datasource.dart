import 'package:flutter/foundation.dart';
import 'package:tutor_flutter_app/core/constants/common_nation.dart';
import 'package:tutor_flutter_app/features/tutorList/data/models/category.dart';
import 'package:tutor_flutter_app/features/tutorList/data/models/tutor.dart';

List<Tutor> tutors = [
  Tutor(
      'Keegan',
      'https://api.app.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1627913015850.00',
      CommonNation.vietnam,
      5,
      [
        CategoryEnum.englishForBusiness.value,
        CategoryEnum.conversational.value,
        CategoryEnum.englishForKids.value,
        CategoryEnum.ielts.value,
        CategoryEnum.toelf.value,
        CategoryEnum.ket.value
      ],
      'I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.',
      true),
  Tutor(
      'April Baldo',
      'https://api.app.lettutor.com/avatar/83802576-70fe-4394-b27a-3d9e8b50f1b7avatar1649512219387.jpg',
      CommonNation.philpines,
      3,
      [
        CategoryEnum.englishForBusiness.value,
        CategoryEnum.conversational.value,
        CategoryEnum.englishForKids.value,
        CategoryEnum.toelf.value,
        CategoryEnum.ket.value,
        CategoryEnum.staters.value,
      ],
      'Hello! My name is April Baldo, you can just call me Teacher April. I am an English teacher and currently teaching in senior high school. I have been teaching grammar and literature for almost 10 years. I am fond of reading and teaching literature as one way of knowing one’s beliefs and culture. I am friendly and full of positivity. I love teaching because I know each student has something to bring on. Molding them to become an individual is a great success.',
      true),
  Tutor(
      'Jill Leano',
      'https://api.app.lettutor.com/avatar/e9e3eeaa-a588-47c4-b4d1-ecfa190f63faavatar1632109929661.jpg',
      CommonNation.philpines,
      0,
      [
        CategoryEnum.ielts.value,
        CategoryEnum.toelf.value,
        CategoryEnum.ket.value
      ],
      "Hi, My name is Jill I am an experienced English Teacher from Philippine. I would like to share my enthusiasm with the learners in this platform. I've been working with diverse learners of all levels for many years. I am greatly passionate about about profession. I love teaching because I can help others improve their skills and it gives me joy and excitement meeting different learners around the world. In my class I worked with wonderful enthusiasm and positivity, and I'm happy to focus on my learner's goal.",
      false),
  Tutor(
      'Joan Gacer',
      'https://api.app.lettutor.com/avatar/8c4e58c4-e9d1-4353-b64d-41b573c5a3e9avatar1632284832414.jpg',
      CommonNation.taiwan,
      3,
      [
        CategoryEnum.toelf.value,
        CategoryEnum.staters.value,
        CategoryEnum.conversational.value
      ],
      "I was a customer service sales executive for 3 years before I become an ESL teacher I am trained to deliver excellent service to my clients so I can help you with business English dealing with customers or in sales-related jobs and a lot more, I also love to teach beginner, intermediate and advance I speak slowly and clearly so that the student can easily follow my instructions and pronunciation. In my class, I want environment-friendly fun and engaging I have many activities designed to help your enthusiasm in learning the language. I'm so excited to meet you in one of my classes let us have fun while learning English. See you there.",
      false)
];
