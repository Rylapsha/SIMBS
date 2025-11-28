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

    $kategori = htmlspecialchars($data['kategori']);
    $tanggal_input = $data['tanggal_input'];

    // Cek duplikasi kategori
    $cek = mysqli_query($conn, "SELECT id_kategori FROM kategori WHERE nama_kategori = '$kategori'");
    if (mysqli_num_rows($cek) > 0) {
        // Jika kategori sudah ada, kembalikan -1
        return -1;
    }

    $query = "INSERT INTO kategori (nama_kategori, tanggal_input) VALUES ('$kategori', '$tanggal_input')";
    mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}

function hapus_data2($id_kategori)
{
    global $conn;

    $query = "DELETE FROM kategori WHERE id_kategori = $id_kategori";

    $result = mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}

function ubah_kategori($data)
{
    global $conn;

    $id_kategori    = $data['id_kategori'];
    $kategori       = $data['nama_kategori'];
    $tanggal_input  = $data['tanggal_input'];

    $query = "UPDATE kategori SET
            nama_kategori   = '$kategori',
            tanggal_input = '$tanggal_input'
          WHERE id_kategori = $id_kategori";
    mysqli_query($conn, $query);
    return mysqli_affected_rows($conn);
}

function search_data($keyword, $start = 0, $limit = 2)
{
    global $conn;
    return query("SELECT * FROM kategori 
                  WHERE nama_kategori LIKE '%$keyword%'
                  ORDER BY tanggal_input DESC
                  LIMIT $start, $limit");
}
