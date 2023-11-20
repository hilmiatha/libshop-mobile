![image](https://github.com/hilmiatha/libshop-mobile/assets/108039453/e4b68e4d-d1bb-4501-8d65-94daa8131d1e)
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

<details>
<summary> TUGAS 8 </summary>

### Pertanyaan
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

### Jawaban

1. Navigator.push() dan Navigator.pushReplacement() adalah dua metode yang digunakan dalam Flutter untuk menavigasi antara halaman atau layar aplikasi.

    Navigator.push() digunakan untuk menambahkan halaman baru ke dalam tumpukan navigasi, sehingga pengguna dapat kembali ke halaman sebelumnya dengan menekan tombol kembali pada perangkat mereka. Contoh penggunaannya adalah ketika pengguna menekan tombol untuk membuka halaman detail dari suatu item pada daftar, maka halaman detail akan ditambahkan ke dalam tumpukan navigasi.

    Sedangkan Navigator.pushReplacement() digunakan untuk mengganti halaman saat ini dengan halaman baru. Dalam hal ini, ketika pengguna menekan tombol kembali pada perangkat mereka, mereka akan langsung kembali ke halaman sebelumnya sebelum halaman saat ini. Contoh penggunaannya adalah ketika pengguna menyelesaikan suatu tugas pada halaman saat ini dan ingin kembali ke halaman sebelumnya, maka halaman saat ini akan diganti dengan halaman baru yang menampilkan pesan sukses atau ringkasan dari tugas yang telah selesai.

2. Layout widget pada Flutter adalah widget yang digunakan untuk mengatur tata letak atau susunan dari widget-widget lainnya. Berikut adalah beberapa layout widget pada Flutter beserta konteks penggunaannya:

    * Container: Widget ini digunakan untuk membuat kotak yang dapat diatur ukurannya, warnanya, dan dekorasinya. Container juga dapat digunakan untuk mengatur jarak antar widget dengan menggunakan properti padding dan margin.

    * Row dan Column: Widget ini digunakan untuk mengatur tata letak secara horizontal (Row) atau vertikal (Column). Widget-widget yang ditempatkan di dalam Row atau Column akan diatur secara berurutan dari kiri ke kanan (Row) atau dari atas ke bawah (Column).

    * Stack: Widget ini digunakan untuk menumpuk widget-widget di atas satu sama lain. Widget-widget yang ditempatkan di dalam Stack akan ditumpuk sesuai dengan urutan penempatannya.

    * Expanded: Widget ini digunakan untuk mengisi ruang kosong yang tersisa pada Row atau Column. Widget yang ditempatkan di dalam Expanded akan diberikan ukuran yang tersisa setelah widget lainnya sudah diberikan ukuran.

    * ListView: Widget ini digunakan untuk menampilkan daftar widget secara berurutan. ListView dapat digunakan untuk menampilkan daftar yang panjang atau tidak terbatas.

    * GridView: Widget ini digunakan untuk menampilkan daftar widget dalam bentuk grid. GridView dapat digunakan untuk menampilkan daftar yang berisi banyak item dengan ukuran yang sama.

    * Wrap: Widget ini digunakan untuk menampilkan daftar widget dalam bentuk baris yang dapat melintasi beberapa baris. Widget-widget yang ditempatkan di dalam Wrap akan diatur secara berurutan dari kiri ke kanan dan dari atas ke bawah.

    * SizedBox: Widget ini digunakan untuk membuat kotak kosong dengan ukuran tertentu. SizedBox dapat digunakan untuk memberikan jarak antar widget atau untuk membuat widget dengan ukuran yang spesifik.

    Setiap layout widget memiliki kegunaannya masing-masing dan dapat digunakan sesuai dengan kebutuhan dalam membuat tata letak pada aplikasi Flutter.

3. Terdapat 3 elemen input yaitu `name` buku untuk menyimpan nama buku, `amount` untuk menyimpan jumlah buku, dan `description` untuk menyimpan deskripsi buku. Ketiga elemen input ini digunakan untuk mengisi data buku yang akan ditambahkan ke dalam database.

4. Clean Architecture adalah sebuah konsep arsitektur perangkat lunak yang bertujuan untuk memisahkan kode menjadi beberapa lapisan dengan tujuan agar kode menjadi lebih mudah dipahami, diuji, dan diubah. Penerapan Clean Architecture pada aplikasi Flutter dapat dilakukan dengan mengikuti prinsip-prinsip berikut:

    1. Memisahkan kode menjadi beberapa lapisan, yaitu:
        - Presentation Layer: berisi kode yang berhubungan dengan tampilan aplikasi, seperti widget dan state management.
        - Domain Layer: berisi kode yang berhubungan dengan bisnis logic aplikasi, seperti use case dan model.
        - Data Layer: berisi kode yang berhubungan dengan pengambilan dan penyimpanan data, seperti repository dan data source.

    2. Menggunakan Dependency Injection untuk menghubungkan antar lapisan. Dependency Injection adalah sebuah teknik yang digunakan untuk memasukkan objek yang dibutuhkan oleh suatu kelas melalui konstruktor atau setter, sehingga kelas tersebut tidak perlu membuat objek tersebut sendiri.

    3. Menggunakan Interface untuk memisahkan antara implementasi dan definisi. Interface adalah sebuah kontrak yang digunakan untuk mendefinisikan perilaku suatu kelas. Dengan menggunakan interface, kita dapat memisahkan antara implementasi dan definisi, sehingga kode menjadi lebih mudah diuji dan diubah.

    4. Menggunakan Unit Test untuk menguji setiap lapisan secara terpisah. Unit Test adalah sebuah teknik yang digunakan untuk menguji kode secara terpisah, sehingga kita dapat memastikan bahwa setiap lapisan berfungsi dengan baik.

    Dalam penerapan Clean Architecture pada aplikasi Flutter, kita dapat menggunakan beberapa library seperti Provider untuk state management, Dio untuk HTTP request, dan Hive untuk penyimpanan data lokal. Dengan menggunakan library-library tersebut, kita dapat memisahkan kode menjadi beberapa lapisan dan mengikuti prinsip-prinsip Clean Architecture dengan lebih mudah.

5. 
    1. Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru
        * buat direktori baru dengan nama `screens` dan buat file dart baru bernama `shoplist_form.dart` di dalamnya.
        * buatlah stateful widget bernama `ShopFormPage`
        * membuat form dengan global key dengan menambahkan `final _formKey = GlobalKey<FormState>();` serta elemen input yang dibutuhkan, yaitu `name`, `amount`, dan `description`.
        * buatlah form dalam body scaffold dan tambahkan validasi untuk semua elemen input. lalu tambahkan tombol save yang akan menampilkan dialog ketika berhasil disimpan.
        ```
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                        hintText: "Nama Buku",
                        labelText: "Nama Buku",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                        ),
                        ),
                        onChanged: (String? value) {
                        setState(() {
                            _name = value!;
                        });
                        },
                        validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return "Nama tidak boleh kosong!";
                        }
                        return null;
                        },
                    ),
                    ),
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                        hintText: "Jumlah",
                        labelText: "Jumlah",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                        ),
                        ),
                        onChanged: (String? value) {
                        setState(() {
                            _amount = int.parse(value!);
                        });
                        },
                        validator: (String? value) {
                        if (value == null || value.isEmpty) {
                            return "Harga tidak boleh kosong!";
                        }
                        if (int.tryParse(value) == null) {
                            return "Harga harus berupa angka!";
                        }
                        return null;
                        },
                    ),
                ),
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Deskripsi",
                        labelText: "Deskripsi",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    onChanged: (String? value) {
                        setState(() {
                        _description = value!;
                        });
                    },
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                        return "Deskripsi tidak boleh kosong!";
                        }
                        return null;
                    },
                    ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                        if (_formKey.currentState!.validate()) {
                        showDialog(
                            context: context,
                            builder: (context) {
                            return AlertDialog(
                                title: const Text('Buku berhasil tersimpan'),
                                content: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                    Text('Nama: $_name'),
                                    Text('Jumlah: $_amount'),
                                    Text('Nama: $_description'),
                                    ],
                                ),
                                ),
                                actions: [
                                TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                    Navigator.pop(context);
                                    },
                                ),
                                ],
                            );
                            },
                        );
                        onPressed(context);
                        }
                        _formKey.currentState!.reset();
                    },
                    child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                    ),
                    ),
                ),
                ),
            ]),
        ),
        )
        ```
    2. Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.
        * Pada bagian onTap pada `ShopCard`, manfaatkan fungsi dari widget navigator yaitu `Navigator.push()` untuk menambahkan halaman baru ke dalam tumpukan navigasi.
        ```
        if (item.name == "Tambah Item") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ShopFormPage()));
          }
        ```
    3.  Membuat sebuah drawer pada aplikasi 
        * dalam direktori widgets tambahkan file dart baru dengan nama `left_drawer.dart`. buatlah drawer header. Lalu buatlah widget ListTile untuk menyimpan menu-menu yang akan ditampilkan pada drawer. Jangan lupa gunakan widget navigator untuk mengarahkan pengguna ke halaman yang diinginkan.
        ```
        ...
        ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.library_books),
            title: const Text('Lihat Bukumu'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DataBukuPage(),
                  ));
            },
          ),
        ...
        ``` 
6. BONUS
    
    buatlah class `Buku` pada `shoplist_form.dart` untuk menginisiasi objek buku saat menekan tombol save (apabila valid). lalu buat `globals.dart` untuk menyimpan semua variabel global, dalam konteks ini untuk menyimpan list buku yang telah dibuat. Kemudian buat tampilan baru yaitu `data_buku.dart` untuk menampilkan list buku yang telah dibuat. jangan lupa buat ListTile baru di dalam drawer dan lakukan routing untuk menuju page `data_buku.dart`

</details>


<details>
<summary> TUGAS 9 </summary>

### Pertanyaan :
1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter
3.  Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).


### Jawaban :
1. Ya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Namun, membuat model sebelum melakukan pengambilan data JSON memiliki beberapa keuntungan:

    * Type Safety: Dengan membuat model, kita dapat menentukan tipe data yang tepat untuk setiap properti dalam JSON. Ini membantu mencegah kesalahan tipe data saat mengakses data JSON.

    * Code Readability: Dengan model yang jelas, kode menjadi lebih mudah dibaca dan dipahami. Model memberikan struktur yang terorganisir untuk data JSON, sehingga memudahkan pengembang dalam memahami bagaimana data JSON diakses dan digunakan.

    * Autocomplete dan Code Suggestions: Dalam banyak IDE, ketika kita menggunakan model, kita dapat memanfaatkan fitur autocomplete dan saran kode. IDE akan memberikan saran tentang properti yang tersedia dalam model saat kita menulis kode, sehingga mempercepat proses pengembangan.

    * Data Validation: Dengan model, kita dapat menerapkan validasi data. Kita dapat menentukan aturan validasi untuk setiap properti dalam model, sehingga memastikan bahwa data yang diterima sesuai dengan harapan.

    Meskipun kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu, membuat model sebelumnya memiliki banyak manfaat dan disarankan untuk meningkatkan kualitas dan keamanan kode.

2. Kelas CookieRequest adalah kelas yang bertanggung jawab untuk membuat dan mengelola permintaan HTTP yang melibatkan cookie. Ini digunakan untuk mengirim permintaan ke server yang memerlukan informasi cookie untuk otentikasi atau sesi.

    Instance CookieRequest perlu dibagikan ke semua komponen di aplikasi Flutter agar informasi cookie dapat diakses dan digunakan secara konsisten di seluruh aplikasi. Ketika instance CookieRequest dibagikan, semua komponen dapat menggunakan instance yang sama untuk mengirim permintaan HTTP dengan cookie yang sama.

    Ini penting karena ketika aplikasi berinteraksi dengan server, informasi cookie yang diperoleh dari respons server harus disimpan dan digunakan dalam permintaan selanjutnya. Jika setiap komponen memiliki instance CookieRequest yang terpisah, maka setiap komponen akan memiliki informasi cookie yang berbeda, yang dapat menyebabkan masalah dalam otentikasi atau sesi.

    Dengan membagikan instance CookieRequest ke semua komponen, kita memastikan bahwa semua komponen menggunakan informasi cookie yang sama. Ini memastikan konsistensi dalam otentikasi atau sesi di seluruh aplikasi.

3. Untuk mengambil data dari JSON dan menampilkannya di Flutter, Anda dapat mengikuti langkah-langkah berikut:

    * Membaca data JSON: Pertama, Anda perlu mengambil data JSON dari sumbernya. Ini bisa berupa API endpoint, file JSON lokal, atau sumber data lainnya. Anda dapat menggunakan package http untuk mengirim permintaan HTTP ke API endpoint dan mendapatkan respons JSON. Jika Anda memiliki file JSON lokal, Anda dapat menggunakan package dart:convert untuk membaca file tersebut.

    * Parsing data JSON: Setelah Anda mendapatkan respons JSON, langkah selanjutnya adalah mem-parsing data tersebut agar dapat digunakan di Flutter. Anda dapat menggunakan package dart:convert untuk mengubah respons JSON menjadi objek Dart yang dapat Anda gunakan di aplikasi Flutter. Misalnya, Anda dapat menggunakan metode jsonDecode() untuk mengubah respons JSON menjadi objek Dart.

    * Membuat model data: Untuk mempermudah penggunaan data JSON di aplikasi Flutter, Anda dapat membuat model data yang sesuai dengan struktur JSON. Model data ini akan mewakili entitas atau objek dalam JSON. Anda dapat membuat kelas Dart dengan properti yang sesuai dengan struktur JSON dan metode untuk mengonversi objek Dart menjadi JSON dan sebaliknya. Ini akan membantu dalam mengakses dan memanipulasi data JSON dengan lebih mudah.

    * Menampilkan data di Flutter: Setelah Anda memiliki data JSON yang sudah diparsing dan model data yang sesuai, Anda dapat menampilkannya di aplikasi Flutter. Anda dapat menggunakan widget seperti ListView, GridView, atau DataTable untuk menampilkan data dalam bentuk daftar, grid, atau tabel. Anda dapat mengakses properti dari objek model data untuk menampilkan nilai-nilai yang relevan di widget.

4. Mekanisme autentikasi antara Flutter dan Django melibatkan beberapa langkah. Berikut adalah langkah-langkah umum yang terjadi dalam proses autentikasi dari input data akun pada Flutter hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter:

    Pengguna memasukkan data akun pada aplikasi Flutter, seperti nama pengguna dan kata sandi.
    Aplikasi Flutter mengirim permintaan HTTP ke server Django yang berisi data akun yang dimasukkan oleh pengguna.
    Server Django menerima permintaan dan memeriksa data akun yang diterima.
    Django menggunakan mekanisme autentikasi bawaan atau pustaka autentikasi pihak ketiga, seperti Django REST Framework, untuk memverifikasi data akun yang diterima.
    Jika data akun valid, Django akan menghasilkan token akses atau sesi yang unik untuk pengguna tersebut.
    Server Django mengirimkan token akses atau sesi kembali ke aplikasi Flutter sebagai respons.
    Aplikasi Flutter menyimpan token akses atau sesi yang diterima untuk digunakan dalam permintaan selanjutnya.
    Setiap kali pengguna ingin mengakses menu atau fitur yang memerlukan autentikasi, aplikasi Flutter akan menyertakan token akses atau sesi dalam permintaan HTTP ke server Django.
    Server Django memeriksa keabsahan token akses atau sesi yang diterima dari aplikasi Flutter.
    Jika token akses atau sesi valid, server Django mengizinkan akses ke menu atau fitur yang diminta.
    Server Django mengirimkan data menu atau fitur yang diminta kembali ke aplikasi Flutter sebagai respons.
    Aplikasi Flutter menampilkan menu atau fitur yang diterima dari server Django kepada pengguna.
    Dalam proses ini, token akses atau sesi digunakan untuk mengidentifikasi dan mengotentikasi pengguna di setiap permintaan yang dilakukan oleh aplikasi Flutter ke server Django. Token ini memastikan bahwa hanya pengguna yang terotentikasi yang dapat mengakses menu atau fitur yang memerlukan autentikasi.





</details>
