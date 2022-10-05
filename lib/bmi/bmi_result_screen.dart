import 'package:flutter/material.dart';

class BmiResultScreen extends StatefulWidget {
  final int height;
  final int? weight;
  final String gender;

  const BmiResultScreen({
    Key? key,
    required this.height,
    this.weight = 0,
    required this.gender,
  }) : super(key: key);

  @override
  State<BmiResultScreen> createState() => _BmiResultScreenState();
}

class _BmiResultScreenState extends State<BmiResultScreen> {
  @override
  Widget build(BuildContext context) {
    var myBmi = getBmi().toStringAsFixed(1);
    var myGrade = getGrade(double.parse(myBmi));

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '체질량지수(BMI)는 ${myBmi}로 ${myGrade[0]} 입니다.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage("${myGrade[1]}"))),
            ),
          ],
        ),
      ),
    );
  }

  double getBmi() {
    var standardWeight;
    //-- 표준체중
    if (widget.gender == "남성") {
      standardWeight = (widget.height / 100) * (widget.height / 100) * 22;
    } else {
      standardWeight = (widget.height / 100) * (widget.height / 100) * 21;
    }
    return widget.weight! / standardWeight * 100;
    // return widget.weight! / ((widget.height / 100) * (widget.height / 100));
  }

  List<String> getGrade(double myBmi) {
    if (myBmi < 90) {
      return [
        "저체중",
        "http://health.chosun.com/site/data/img_dir/2018/09/07/2018090702657_0.jpg"
      ];
    } else if (myBmi >= 90 && myBmi < 110) {
      return [
        "정상체중",
        "https://health.chosun.com/site/data/img_dir/2021/03/08/2021030801022_0.jpg"
      ];
    } else if (myBmi >= 110 && myBmi < 120) {
      return [
        "과체중",
        "https://media.istockphoto.com/photos/overweight-asian-obese-men-he-is-feeling-ill-and-worried-about-his-picture-id1181448785"
      ];
    } else {
      return [
        "비만",
        "http://www.amc.seoul.kr/healthinfo/health/attach/img/30274/20111202094314_0_30274.jpg"
      ];
    }
  }

  // List<String> getGrade(double myBmi) {
  //   if (myBmi < 18.5) {
  //     return [
  //       "저체중",
  //       "http://health.chosun.com/site/data/img_dir/2018/09/07/2018090702657_0.jpg"
  //     ];
  //   } else if (myBmi >= 18.5 && myBmi < 23) {
  //     return [
  //       "정상체중",
  //       "https://health.chosun.com/site/data/img_dir/2021/03/08/2021030801022_0.jpg"
  //     ];
  //   } else if (myBmi >= 23 && myBmi < 25) {
  //     return [
  //       "과체중",
  //       "https://media.istockphoto.com/photos/overweight-asian-obese-men-he-is-feeling-ill-and-worried-about-his-picture-id1181448785"
  //     ];
  //   } else {
  //     return [
  //       "비만",
  //       "http://www.amc.seoul.kr/healthinfo/health/attach/img/30274/20111202094314_0_30274.jpg"
  //     ];
  //   }
  // }
}
