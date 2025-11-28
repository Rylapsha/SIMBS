<?php
$conn = mysqli_connect("localhost", "root", "", "simbs");

function query($query)
{
    global $conn;

    $result = mysqli_query($conn, $query);
    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }
    return $rows;
}

function tambah_data($data)
{
    global $conn;

    $judul = $data['judul'];
    $deskripsi = $data['deskripsi'];
    $penulis = $data['penulis'];
    $penerbit = $data['penerbit'];
    $tahun_terbit = $data['tahun_terbit'];
    $id_kategori = $data['id_kategori'];
    $tanggal_input = $data['tanggal_input'];

    $query = "INSERT INTO buku 
    (judul, deskripsi, penulis, penerbit, tahun_terbit, id_kategori, tanggal_input) 
    VALUES 
    ('$judul', '$deskripsi', '$penulis', '$penerbit', '$tahun_terbit', '$id_kategori', '$tanggal_input')";

    mysqli_query($conn, $query);
    return mysqli_affected_rows($conn);
}

function hapus_data($id)
{
    global $conn;

    $query = "DELETE FROM buku WHERE id_buku = $id";

    $result = mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}

function ubah_data($data)
{
    global $conn;

    $id = $data["id_buku"];
    $judul = $data["judul"];
    $deskripsi = $data["deskripsi"];
    $penulis = $data["penulis"];
    $penerbit = $data["penerbit"];
    $tahun_terbit = $data["tahun_terbit"];
    $id_kategori = $data["id_kategori"];
    $tanggal_input = $data["tanggal_input"];

    $query = "UPDATE buku SET 
                judul = '$judul',
                deskripsi = '$deskripsi',
                penulis = '$penulis',
                penerbit = '$penerbit',
                tahun_terbit = '$tahun_terbit',
                id_kategori = '$id_kategori',
                tanggal_input = '$tanggal_input'
              WHERE id_buku = $id";

    mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}


function search_data($keyword)
{
    global $conn;
    $keyword = mysqli_real_escape_string($conn, $keyword);

    $query = "
        SELECT buku.*, kategori.nama_kategori
        FROM buku
        INNER JOIN kategori ON buku.id_kategori = kategori.id_kategori
        WHERE 
            buku.judul LIKE '%$keyword%' OR
            kategori.nama_kategori LIKE '%$keyword%' OR
            buku.penulis LIKE '%$keyword%' OR
            buku.penerbit LIKE '%$keyword%' OR
            buku.tahun_terbit LIKE '%$keyword%'";

    return query($query);
}

function register($data_register)
{
    global $conn;

    $username = strtolower($data_register['username']);
    $email = $data_register['email'];
    $password = mysqli_real_escape_string($conn, $data_register['password']);
    $confirm_password = mysqli_real_escape_string($conn, $data_register['confirm_password']);

    // cek panjang password minimal 8 karakter
    if (strlen($password) < 8) {
        return "Password harus mengandung minimal 8 karakter!";
    }

    // cek username sudah ada atau belum
    $query = mysqli_query($conn, "SELECT username FROM user WHERE username = '$username'");
    $result = mysqli_fetch_assoc($query);
    if ($result != NULL) {
        return "username sudah terdaftar, gunakan yang lain";
    }
    if ($result != NULL) {
        return "username sudah terdaftar, gunakan yang lain";
    }

    if ($password !== $confirm_password) {
        return "Konfirmasi password tidak sesuai!";
    }

    //cek email sudah ada atau belum
    $query = mysqli_query($conn, "SELECT email FROM user WHERE email = '$email'");
    $result = mysqli_fetch_assoc($query);
    if ($result != NULL) {
        return "email sudah terdaftar, gunakan yang lain";
    }

    // enkripsi password
    $password = password_hash($password, PASSWORD_DEFAULT);

    // tambahkan user baru ke database
    mysqli_query($conn, "INSERT INTO user (id_user, username, email, password) VALUES('', '$username', '$email', '$password')");

    return true;
}

function login($data)
{
    global $conn;


    $username = $data['username'];
    $password = $data['password'];


    // cek username sudah ada atau belum
    $query = "SELECT * FROM user WHERE username = '$username'";
    $result = mysqli_query($conn, $query);


    // var_dump($result);
    // die;


    // Cek user ada atau tidak
    if (mysqli_num_rows($result) === 1) {
        $row = mysqli_fetch_assoc($result);


        // var_dump($row);
        // die;


        // Verify password
        if (password_verify($password, $row["password"])) {
            $_SESSION["login"] = true;
            $_SESSION["username"] = $row["username"];
            // echo "masuk sini";
            return true;
        } else {
            // echo "tidak masuk";
            return "Password salah!";
        }
    } else {
        return "Username salah/tidak ditemukan!"; 
    }
}
