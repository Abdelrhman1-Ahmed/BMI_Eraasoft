// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:bmi_app/Screens/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;
  double height = 150;
  int weight = 60;
  int age = 26;

  void calculateBMI() {
    // حساب مؤشر كتلة الجسم
    final double heightInMeters = height / 100;
    final double bmi = weight / (heightInMeters * heightInMeters);

    String resultText;
    String interpretation;
    Color resultColor;

    if (bmi < 18.5) {
      resultText = "Underweight";
      resultColor = const Color(0xffFFC107);
      interpretation = "You have a lower than normal body weight. Try to eat a bit more.";
    } else if (bmi <= 24.9) {
      resultText = "Normal";
      resultColor = const Color(0xff24D876);
      interpretation = "You have a Normal Body Weight, Good Job.";
    } else if (bmi <= 29.9) {
      resultText = "Overweight";
      resultColor = const Color(0xffFF9800);
      interpretation = "You have a higher than normal body weight. Try to exercise more.";
    } else {
      resultText = "Obese";
      resultColor = const Color(0xffE83D67);
      interpretation = "You have a much higher than normal body weight. Consider a healthy diet and consultation.";
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          bmiResult: bmi,
          resultText: resultText,
          interpretation: interpretation,
          resultColor: resultColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C2135),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff1C2135),
        centerTitle: true,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ================= 1. اختيار الجنس =================
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: GanderWidget(
                        image: "assets/images/material-symbols_male.png",
                        title: "Male",
                        border: isMale
                            ? Border.all(color: const Color(0xff0084FF), width: 2)
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: GanderWidget(
                        image: "assets/images/material-symbols_female.png",
                        title: "Female",
                        border: !isMale
                            ? Border.all(color: const Color(0xff0084FF), width: 2)
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ================= 2. تحديد الطول =================
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff24263B),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Height",
                      style: TextStyle(fontSize: 18, color: Color(0xff8B8C9E)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.round().toString(),
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          "cm",
                          style: TextStyle(fontSize: 18, color: Color(0xff8B8C9E)),
                        ),
                      ],
                    ),
                    Slider(
                      value: height,
                      min: 80,
                      max: 220,
                      activeColor: const Color(0xffE83D67),
                      inactiveColor: const Color(0xff8B8C9E),
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // ================= 3. تحديد الوزن والعمر =================
            Expanded(
              child: Row(
                children: [
                  // Weight
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff24263B),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Weight", style: TextStyle(fontSize: 18, color: Color(0xff8B8C9E))),
                          Text(
                            "$weight",
                            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: const Color(0xff8B8C9E).withValues(alpha: 0.3),
                                child: IconButton(
                                  icon: const Icon(Icons.remove, color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      if (weight > 10) weight--;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              CircleAvatar(
                                backgroundColor: const Color(0xff8B8C9E).withValues(alpha: 0.3),
                                child: IconButton(
                                  icon: const Icon(Icons.add, color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Age
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff24263B),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Age", style: TextStyle(fontSize: 18, color: Color(0xff8B8C9E))),
                          Text(
                            "$age",
                            style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: const Color(0xff8B8C9E).withValues(alpha: 0.3),
                                child: IconButton(
                                  icon: const Icon(Icons.remove, color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      if (age > 1) age--;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              CircleAvatar(
                                backgroundColor: const Color(0xff8B8C9E).withValues(alpha: 0.3),
                                child: IconButton(
                                  icon: const Icon(Icons.add, color: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ================= 4. زر الحساب =================
      bottomNavigationBar: MaterialButton(
        onPressed: calculateBMI,
        color: const Color(0xffE83D67),
        height: 65,
        child: const Text(
          "Calculate",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// ================= كلاس كرت الجنس =================
class GanderWidget extends StatelessWidget {
  const GanderWidget({
    super.key,
    required this.image,
    required this.title,
    this.border,
  });

  final String image;
  final String title;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xff24263B),
        borderRadius: BorderRadius.circular(12),
        border: border,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, width: 70, height: 70),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(0xff8B8C9E),
            ),
          ),
        ],
      ),
    );
  }
}