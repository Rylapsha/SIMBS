<?php
require("function2.php");

$id_kategori = $_GET['id'];

if (hapus_data2($id_kategori) > 0) {
    echo "
            <script>
                alert('Data berhasil dihapus dari database!');
                document.location.href = 'index2.php';
            </script>
        ";
} else {
    echo "
            <script>
                alert('Data gagal dihapus dari database!');
                document.location.href = 'index2.php';
            </script>
        ";
}
