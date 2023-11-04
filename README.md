# LibShop
Singkatan dari Library Shop
## Hilmi Atha Putra (2206830050 - PBP B)

<details>
<summary> TUGAS 7 </summary>

### Pertanyaan
1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

### Jawaban
1. Stateless widget dalam Flutter adalah elemen dasar UI yang tidak memerlukan state yang dapat berubah. Widget ini tidak dapat berubah secara dinamis—mereka diinisialisasi dengan data tertentu dan mereka menampilkan UI berdasarkan data tersebut. Setiap kali informasi yang mereka tampilkan perlu diperbarui, Flutter akan menghancurkan widget lama dan menggantinya dengan yang baru yang menggunakan data terbaru. Ini membuat stateless widget menjadi pilihan yang tepat untuk bagian UI yang bersifat statis dan tidak memerlukan interaksi atau perubahan setelah widget tersebut dibuat, seperti ikon, teks, dan tombol yang tidak berubah saat diinteraksi pengguna.

    Di sisi lain, stateful widget sangat penting ketika aspek UI perlu mempertahankan state atau berubah sebagai tanggapan terhadap interaksi pengguna atau data yang berubah dari waktu ke waktu. Sebuah stateful widget memiliki siklus hidup yang memungkinkan pembuatan state saat widget dibuat dan memungkinkan perubahan pada state tersebut sepanjang waktu hidupnya. Ini dilakukan melalui metode setState() yang memberi tahu Flutter bahwa state telah berubah dan UI harus diperbarui untuk mencerminkan perubahan tersebut. Contoh penggunaan stateful widget termasuk form yang interaktif, slider, atau apapun yang memerlukan dialog atau input dari pengguna yang dapat berubah selama widget tersebut ditampilkan.

2. Terdapat 2 file .dart yang dibuat
    * main.dart
        
        Dalam main.dart, aplikasi Flutter dibentuk menggunakan `MaterialApp` sebagai pondasi utama, yang mengatur tema dan navigasi global aplikasi. `ThemeData` diterapkan untuk menyediakan tema yang konsisten melalui aplikasi, di mana `ColorScheme.fromSeed` digunakan untuk menghasilkan skema warna berdasarkan warna benih yang diberikan, yaitu Colors.indigo dalam kasus ini, menciptakan tampilan yang seragam dan menyenangkan secara visual. `AppBarTheme` secara khusus mengkonfigurasi tampilan dari AppBar di seluruh aplikasi, menetapkan background color menjadi indigo yang sama dengan tema. Widget MyApp menggambarkan inti dari aplikasi yang mengarah ke MyHomePage sebagai halaman utama yang akan ditampilkan kepada pengguna ketika aplikasi dibuka.
    * home.dart

        File menu.dart mendefinisikan MyHomePage, sebuah widget stateless yang berfungsi sebagai halaman utama dari aplikasi, menggunakan `Scaffold` untuk memberikan kerangka dasar dengan `AppBar` dan area konten yang dapat discroll dengan `SingleChildScrollView`. Di dalam Scaffold, `GridView.count` digunakan untuk menciptakan layout grid yang menampung elemen-elemen seperti ShopCard, yang merupakan representasi visual dari ShopItem dengan judul dan ikon. Setiap ShopCard adalah widget yang interaktif, dibungkus dalam `Material` dan `InkWell` untuk memberikan efek visual dan feedback sentuhan dengan menampilkan `SnackBar` ketika diklik. Widget `Column` dan `Padding` berperan dalam menyusun dan memberikan ruang antar elemen, sementara `Container`, `Center`, `Icon`, dan `Text` digunakan untuk menampilkan informasi dan ikonografi yang relevan dengan cara yang estetis dan fokus pada pengguna.

3. Checklist

* Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.
    1. Melakukan instalasi flutter dan android studio
    2. Membuat project baru dengan nama libshop
* Membuat tiga tombol sederhana dengan ikon dan teks dan memunculkan snackbar
    1. Buat file dart baru dengan nama `menu.dart` pada folder `lib`
    2. Di awal file `menu.dart`, tambahkan `import 'package:flutter/material.dart';` untuk mengimpor paket Material Design yang menyediakan sebagian besar widget yang digunakan dalam aplikasi Flutter.
    3. Pindahkan kelas `MyHomePage` dari `main.dart` ke file `menu.dart` ini. Kelas ini akan bertanggung jawab untuk tampilan utama aplikasi. Hapus kelas `_MyHomePageState` karena kita akan membuat widget yang tidak memiliki state (stateless).

    ```
    import 'package:flutter/material.dart';

    class MyHomePage extends StatelessWidget {
        MyHomePage({Key? key}) : super(key: key);


        @override
        Widget build(BuildContext context) {
            ...
            return Scaffold(
            ...
        ...
    ```
    
    4. Buat kelas `ShopItem` dan `ShopCard` untuk membuat tombol dan snackbar yang dibutuhkan

    ```
    class ShopItem { //CLASS SHOPITEM
        final String name;
        final IconData icon;

        ShopItem(this.name, this.icon);
        }

    class ShopCard extends StatelessWidget {  //CLASS SHOPCARD
        final ShopItem item;

        const ShopCard(this.item, {super.key}); // Constructor

        @override
        Widget build(BuildContext context) {
            return Material(
            color: Colors.indigo,
            child: InkWell(
                // Area responsive terhadap sentuhan
                onTap: () {
                // Memunculkan SnackBar ketika diklik
                ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("Kamu telah menekan tombol ${item.name}!")));
                },
                child: Container(
                // Container untuk menyimpan Icon dan Text
                padding: const EdgeInsets.all(8),
                child: Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Icon(
                        item.icon,
                        color: Colors.white,
                        size: 30.0,
                        ),
                        const Padding(padding: EdgeInsets.all(3)),
                        Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                        ),
                    ],
                    ),
                ),
                ),
            ),
            );
        }
        
    }
    ```

    5. Modifikasi `MyHomePage` untuk menampilkan tiga tombol yang dibutuhkan

        ```
        class MyHomePage extends StatelessWidget {
            MyHomePage({Key? key}) : super(key: key);
            final List<ShopItem> items = [
                ShopItem("Lihat Item", Icons.checklist),
                ShopItem("Tambah Item", Icons.add_shopping_cart),
                ShopItem("Logout", Icons.logout),
            ];

            @override
            Widget build(BuildContext context) {
                // This method is rerun every time setState is called, for instance as done
                // by the _incrementCounter method above.
                //
                // The Flutter framework has been optimized to make rerunning build methods
                // fast, so that you can just rebuild anything that needs updating rather
                // than having to individually change instances of widgets.
                return Scaffold(
                appBar: AppBar(
                    title: const Text(
                    'Libshop',
                    ),
                ),
                body: SingleChildScrollView(
                    // Widget wrapper yang dapat discroll
                    child: Padding(
                    padding: const EdgeInsets.all(10.0), // Set padding dari halaman
                    child: Column(
                        // Widget untuk menampilkan children secara vertikal
                        children: <Widget>[
                        const Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                            // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                            child: Text(
                            'Library Shop', // Text yang menandakan toko
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                            ),
                            ),
                        ),
                        // Grid layout
                        GridView.count(
                            // Container pada card kita.
                            primary: true,
                            padding: const EdgeInsets.all(20),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            children: items.map((ShopItem item) {
                            // Iterasi untuk setiap item
                            return ShopCard(item);
                            }).toList(),
                        ),
                        ],
                    ),
                    ),
                ),
                );
            }
            }
        ```

  










</details>