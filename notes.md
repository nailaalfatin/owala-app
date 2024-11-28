## APA ITU ANDROID LIFE CYCLE
jadi android lifecycle itu kaya perjalanan hidupnya activity or fragment dalam aplikasi android, 
dari mulai pertama kali muncul sampe dia berakhir atau dihancurkan sama sistem. nah, tiap activity 
atau fragment punya beberapa tahap lifecycle yang bikin mereka bisa dikontrol dan dikelola. 
berikut tahap-tahap dasarnya:

=> onCreate()
ini tahap pertama waktu activity baru dibuat. di sini biasanya setup semua yang dibutuhin, 
misal bikin layout sama nyiapin data awal.

=> onStart()
activity lagi bersiap buat keliatan sama user. tapi belum sepenuhnya interaktif, cuma udah mulai 
visible aja di layar.

=> onResume()
activity udah mulai bisa berinteraksi full sama user. di sini biasanya semua animasi atau 
update UI dijalankan karena activity lagi aktif dan fokus.

=> onPause()
dipanggil waktu activity lagi ditimpa atau ketutup sama activity lain (misal dapet call). 
ini tempat buat pause animasi, atau nyimpen data sementara sebelum activity ilang dari layar.

=> onStop()
activity udah gak keliatan di layar sama sekali. biasanya sih semua resource di sini 
bakal di-free up buat ngurangin penggunaan memory.

=> onDestroy()
activity udah bener-bener selesai atau dihancurkan sama sistem. ini tahap buat bersihin
semua data atau nyimpen yang perlu buat next time. setiap method ini dipanggil otomatis 
sama sistem android sesuai kebutuhan activity.


## APA ITU STACK CONCEPT NAVIGATOR.PUSH DAN NAVIGATOR.POP
jadi, konsep Navigator.push sama Navigator.pop di flutter tuh bisa dibilang kayak sistem 
tumpukan atau "stack." bayangin aja kayak tumpukan buku yang lo taro satu-satu, 
terus lo ambil lagi satu-satu juga.

=> Navigator.push
ini fungsinya buat "nambah" halaman (widget) baru di atas halaman yang lagi aktif sekarang. 
tiap kali lo pake Navigator.push, halaman baru bakal ditaro di atas "stack" tadi, jadi 
halaman sebelumnya bakal ada di bawah halaman baru yang muncul. analoginya, lo naro buku 
baru di atas tumpukan.

=> Navigator.pop
nah, kalo Navigator.pop ini kebalikannya. dia buat "ngambil" atau "menghapus" halaman yang 
paling atas dari stack, alias halaman yang lagi lo buka sekarang. pas dipanggil, halaman 
paling atas bakal ditutup, dan otomatis lo bakal balik ke halaman sebelumnya (halaman di 
bawahnya di stack).

contoh kasusnya:
misal lo lagi di HomePage, terus lo mau pindah ke DetailPage. lo bisa panggil 
Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));.
kalo lo mau balik lagi ke HomePage dari DetailPage, tinggal panggil Navigator.pop(context);, 
dan lo bakal balik ke halaman sebelumnya.

jadi intinya, push buat masukin halaman baru ke atas stack, dan pop buat keluar atau balik 
ke halaman sebelumnya.

## Named routing
identik, unik, berbeda

## Quicktype
buat ngubah API JSON ke dart

## Async 
Digunakan untuk menandai fungsi sebagai asynchronous process

## Await 
Digunakan dalam function asyc tersebut untuk menunggu hasil dari operasi asynchronous yang 
dijalankan
contoh: 
1. pemanggilan data dari api
2. proses pembacaan file
3. mengungu respons atau hasil dari halaman sebelumnya yang terkait

## OOP (Object-Oriented Programming) 
Itu punya 4 prinsip utama, biar kode lebih terstruktur & gampang di-manage. ini dia:
Simpelnya:
1. Encapsulation: bungkus data biar aman. (ini dipake sama stateful)
2. Inheritance: turunan class.
3. Polymorphism: beda aksi, satu interface.
4. Abstraction: sembunyiin detail, fokus ke fungsi.

1. ENCAPSULATION
=> Inti: sembunyiin detail data biar nggak bisa diakses sembarangan. cuma bisa lewat method
khusus.
=> Tujuan: data aman & nggak sembarangan diubah.
=> Contoh:
class Person {
  String _name; // private (karena ada _)

  Person(this._name);

  String get name => _name; // getter buat akses
  set name(String newName) => _name = newName; // setter buat ubah
}

2. INHERITANCE
=> Inti: class turunan yang mewarisi property & method dari class lain (parent class).
=> Tujuan: hemat kode & bikin relasi antar class jelas.
=> Contoh:
class Animal {
  void eat() => print("Eating...");
}

class Dog extends Animal {
  void bark() => print("Barking...");
}

void main() {
  var dog = Dog();
  dog.eat(); // dari class Animal
  dog.bark(); // dari class Dog
}

3. POLYMORPHISM
=> Inti: satu method, tapi beda bentuk/aksi tergantung konteks.
=> Tujuan: lebih fleksibel & dynamic.
=> Contoh:
class Animal {
  void makeSound() => print("Animal sound");
}

class Dog extends Animal {
  @override
  void makeSound() => print("Woof!");
}

void main() {
  Animal animal = Dog(); // polimorfisme
  animal.makeSound(); // output: "Woof!"
}

4. ABSTRACTION
=> Inti: sembunyiin detail implementasi & cuma tunjukin fungsi pentingnya aja.
=> Tujuan: user cuma fokus ke apa yang bisa dilakuin, bukan gimana itu bekerja.
=> Contoh:
abstract class Shape {
  void draw(); // abstract method
}

class Circle extends Shape {
  @override
  void draw() => print("Drawing Circle");
}

void main() {
  Shape shape = Circle();
  shape.draw(); // output: "Drawing Circle"
}

## State Management
State management adalah class yang berfungsi untuk membantu mengelola ui, 
membantu mengelola data yang dinamis, membantu mengurangi adanya boiler plate (kode yang 
ditulis secara berulang) agar kode yang ditulis menjadi efisien dan mudah di kelola

## Cara Implementasi State Management (Provider) :
1. kita harus import library nya di pubspec.yaml (provider: ^6.1.2)
2. tambahkan ChangeNotifier di file terkait (liat di folder state-management)
3. adjusting main.dart

## Compile and Runtime
=> Compile adalah proses penerjemahan dari bahasa koding ke bahasa mesin
=> Runtime adalah alatnya

## Perbedaan Setter dan Getter
Ibaratnya si setter itu privat, nah kalo getter itu public

## pubspec.yaml
Buat nyimpen semua konfigurasi aplikasi dan library pihak ke3 yang akan digunakan oleh aplikasi

## Shared Preferences
Untuk menyimpan data secara lokal

## Bank Operator
=> kalo bank operator ditaro di depan itu buat null safety (negasi = atau kebalikan)
=> kalo di belakang itu buat ngasi tau kalo dia itu ga null biar 
cepet langsung di eksekusi (nullable)