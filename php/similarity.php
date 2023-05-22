<?php

$koneksi = mysqli_connect("192.168.77.59", "ryan", "4rt1s4n", "twitter_apiv2", 8004) or die("Database Error");
$cocok = mysqli_query($koneksi, "SELECT id, text FROM tweet");

$kalimat1 = '';

$persentase_terdekat = 0;
$kalimat_terdekat = '';
$id_terdekat = '';

$kalimat1_kata = explode(' ', $kalimat1);

while ($baris = mysqli_fetch_assoc($cocok)) {
    $id = $baris['id'];
    $kalimat2 = $baris['text'];

    // Membersihkan karakter @ dan URL
    $kalimat2 = str_replace('@', '', $kalimat2);
    $kalimat2 = preg_replace('/\b(?:https?|ftp):\/\/\S+\b/', '', $kalimat2);

    $kalimat2_kata = explode(' ', $kalimat2);

    $jumlah_kata_sama = 0;
    $total_kata = count($kalimat1_kata);

    foreach ($kalimat1_kata as $kata) {
        if (in_array($kata, $kalimat2_kata)) {
            $jumlah_kata_sama++;
        }
    }

    $persentase_kesamaan = ($jumlah_kata_sama / $total_kata) * 100;

    if ($persentase_kesamaan > $persentase_terdekat) {
        $persentase_terdekat = $persentase_kesamaan;
        $kalimat_terdekat = $kalimat2;
        $id_terdekat = $id;
    }
}

echo "Kalimat pertama: " . $kalimat1 . "<br>";
echo "Kalimat kedua dengan persentase kesamaan paling mendekati: " . $kalimat_terdekat . " (" . $persentase_terdekat . "%)";

    ?>
