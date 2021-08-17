<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title><?= $title_pdf;?></title>
        <style>
            #table {
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                font-size: 10px;
                border-collapse: collapse;
                width: 100%;
            }

            #table td, #table th {
                border: 1px solid black;
                padding: 5px;
            }

            #table tr:nth-child(even){background-color: #fff;}

            #table tr:hover {background-color: #fff;}

            #table th {
                padding-top: 10px;
                padding-bottom: 10px;
                text-align: center;
                background-color: #fff;
                color: black;
                
            }
            .page_break { page-break-before: always; }
            .p { 
                text-align: center;
                font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
                font-size: 10px;
                font-weight: 100;
                border-collapse: collapse;
                width: 100%;
            }
        </style>
    </head>
<body>
    <div class="p">
           REKAP ABSENSI PEGAWAI HONORER KECAMATAN MAJALAYA
            <br>BULAN <?= strtoupper(bulan($bulan) . ' ' . $tahun )?>
    <br>
    <table>
        <tr>
            <td>Nama</td><td>:<?= $karyawan->nama ?></td>
        </tr>
        <tr>
            <td>Bulan</td><td>: <?= bulan($bulan) . ' ' . $tahun ?></td>
        </tr>
    </table>
    </div>
    <table id="table">
        <thead>
            <tr>
                <th>No</th>
                <th>Tanggal</th>
                <th>Jam Masuk</th>
                <th>Jam Keluar</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach($hari as $i => $h): ?>
                <?php
                    $absen_harian = array_search($h['tgl'], array_column($absen, 'tgl')) !== false ? $absen[array_search($h['tgl'], array_column($absen, 'tgl'))] : '';
                ?>
                <tr <?= (in_array($h['hari'], ['Sabtu', 'Minggu'])) ? 'class="bg-dark text-white"' : '' ?> <?= ($absen_harian == '') ? 'class="bg-danger text-white"' : '' ?>>
                    <td style="text-align:center;width:fit-content"><?= ($i+1) ?></td>
                    <td><?= $h['hari'] . ', ' . $h['tgl'] ?></td>
                    <?= (in_array($h['hari'], ['Sabtu', 'Minggu'])) ? '<td bgcolor="red">Libur Akhir Pekan</td>' : '<td>'.check_jam(@$absen_harian['jam_masuk'], 'masuk').'</td>'?></td>
                    <?= (in_array($h['hari'], ['Sabtu', 'Minggu'])) ? '<td bgcolor="red">Libur Akhir Pekan</td>' :  '<td>'.check_jam(@$absen_harian['jam_pulang'], 'pulang').'</td>' ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</body>
</html>