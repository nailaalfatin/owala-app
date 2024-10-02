import 'package:e_commerce/consts.dart';
import 'package:e_commerce/ui/home/catalogue_screen.dart';
import 'package:e_commerce/ui/splash/components/splash_content.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override 
  State<Body> createState() => _BodyState(); //createstate untuk menyimpan semua perubahan
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  PageController _pageController = PageController();
  // List<String> product = List.generate(
  //   10, (index) => "Product ${index + 1}"
  //   );


  // dasar pengambilan data API
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Owala – The water bottle \nthat transforms the way you stay hydrated",
      "image": "assets/images/drinkware/SmoothSip_TelescopeTales.png"
    },
    {
      "text": "Stylish & Eco-Friendly Design. \nStay hydrated in style while caring for our planet",
      "image": "assets/images/drinkware/SmoothSip_TelescopeTales.png"
    },
    {
      "text": "Ready to start your hydration journey? \nLet’s explore our products!",
      "image": "assets/images/drinkware/SmoothSip_TelescopeTales.png"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( //biar widget kita ga tumpukan sama sistem sistem
        child: Column(
          children: [
            Expanded( //agar mengikuti layar biar gaada blank space
              flex: 3, //memenuhi 3 ruang yg kosong
              child: SizedBox(
                  width: double.infinity, //biar tengah dengan titik koordinat 0.0
                  child: PageView.builder( // pageview = buat mengatur swipe activity , buider = membangun data
                    // ngecontroll untuk ganti page
                    controller: _pageController = PageController(), //biar buttonnya pas dipencet bisa ganti ganti page
                    onPageChanged: (value) {
                       //kalo misalnya kita mau manggil semua argumen dimana argumen tersebut berfungsi untuk
                      //mewakili sebuah tipe data integer maka gunakanlah argumen value

                      //awal state method untuk statefulWidget behavior
                      setState(() {  //initial state method for statefulWidget behaviour
                        currentPage = value;
                      });
                    },
                      itemCount: splashData.length,  
                      // item count = biar di ngasi batasan swipe,
                      //length = buat mendefinisikan panjang arraynya

                      // item builder untuk jembatan, adapter antar data/pembuat data
                      itemBuilder: (context, index) => SplashContent(
                          text: splashData[index]["text"]!, // !  untuk menghilangkan null safety
                          image: splashData[index]["image"]!
                          )
                        )
                      ),
                   ),
            Expanded(
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,// biar ke tengah
                children: List.generate( //List.generate: menghasilkan sejumlah dots sesuai dengan panjang splashData
                  splashData.length,
                (index) => _dotsIndicator(index: index)) // mulai dari 0 dan buat method exraction
              )
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 30,
              ),
              child: SizedBox(
                width: double.infinity, //dia akan membawa ke koordinat 0.0
                child: ElevatedButton( // btn yg paling cocok dan bisa styling dari awal
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor, 
                  ),
                  onPressed: () {
                    //ketika current page di klik maka akan ke pindah screen
                    if (currentPage == splashData.length - 1) {
                    //length itu banyaknya data atau panjangnya data
                    //kan di splash data ada 3, sedangkan di index itu dimulai dari 0. kalo dimuali dari 0 jadi index terakhirnya itu 2 makanya disisni dikurang 1
                    //jika berada di halaman terakhir (currentPage == splashData.length - 1), abistu diarahkan ke CatalogueScreen.
                    
                    //kode yang di gunakan untuk berpindah antar halaman
                      Navigator.push(
                        context, // represent dari currentPage
                        MaterialPageRoute(
                          builder: (context) => const CatalogeScreen())
                      );
                    } else {
                      // ini  untuk swipe ke slide berikutnya
                      _pageController.animateToPage( // kalo belum sampai akhir bakal nambah ke halaman berikutnya pakai animateToPage
                        currentPage + 1,
                        duration: animationDuration,
                        curve: Curves.ease);
                      
                    }
                  }, 
                  // ini untuk  text button
                  child: Text(
                    currentPage == splashData.length - 1 ? "Get Started" : "Next",
                    style: const TextStyle(
                      color: Colors.white
                    ),
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // code untuk logic dots indikator/ yg bulet bulet.
  // Method extraction (biar reusable)
  AnimatedContainer _dotsIndicator({required int index}) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: currentPage == index ? primaryColor : secondaryColor, // kalau curentPage maka warna primaryColor
      ),
      width: currentPage == index ? 20 : 7, // kalau di currentPage width nya 20, kalau tidak 10
      height: 5, duration: animationDuration,
    );
  }
}
