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
            DAFTAR PENERIMA HONORARIUM PENYEDIA PENDUKUNG TEKNIS DAN ADMINSTRASI PERKANTORAN
            <br>BULAN <?= strtoupper(bulan($bulan) . ' ' . $tahun )?>
        </div>
        <br>
        <table id="table">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Nama</th>
                    <th>Jabatan</th>
                    <th>Persentase <br>Kehadiran</th>
                    <th>Besaran (Rp)</th>
                    <th>BPJS</th>
                    <th>Jumlah <br>Yang Diterima</th>
                    <th>Tanda Tangan</th>
                </tr>
                <tr>
                    <th>1</th>
                    <th>2</th>
                    <th>3</th>
                    <th>4</th>
                    <th>5</th>
                    <th>6</th>
                    <th>7</th>
                    <th>8</th>
                </tr>
            </thead>
        </tbody>
            <?php foreach($gaji as $i => $k): ?>
                <tr>
                <td style="text-align:center"><?= $i+1 ?></td>
                <td><?= $k['nama'];?></td>
                <td><?= $k['divisi'];?> Hari</td>
                <td style="text-align:center"><?= $k['persen_hadir'];?>%</td>
                <td style="text-align:center">Rp. 2,250,000</td>
                <td style="text-align:center">Rp. 32,419</td>
                <td style="text-align:center">Rp. <?= number_format(round($k['uang_diterima'] - 32419));?></td>
                <td></td>
            </tr>
            <?php endforeach; ?>
        </tbody>
        <tfoot>
            <tr>
                <th colspan="4">Jumlah</th>
                <th><?php echo 'Rp. '.number_format(2250000 * 7);?></th>
                <th><?php echo 'Rp. '.number_format(32419 * 7);?></th>
                <th>Rp. <?= number_format(round(($k['uang_diterima'] - 32419)*7));?></th>
                <th></th>
            </tr>
        </tfoot>
        </table>
        <br>
        <table style="width: 100%;font-family: Trebuchet MS, Arial, Helvetica, sans-serif;
                font-size: 10px;">
            <tr style="text-align: center;">
                <td style="text-align:center">
                    Mengetahui<br>
                    Camat Majalaya<br>
                    Selaku Pengguna Anggaran<br><br><br><br><br><br><br><br>
                    <p style="font-weight: 100";>Drs. IKA NUGRAHA<br>
                    NIP. 1965091 199403 1005</p>
                </td>
                <td style="width: 50%;"></td>
                <td style="text-align:center">
                    Majalaya, 
                        <?php 
                            $mydate=getdate(date("U"));
                            echo "$mydate[mday] $mydate[month] $mydate[year]";
                        ?><br>
                    <br><br><br><br><br><br><br><br><br>
                    <p style="font-weight: 100;">SYLVIA APRILLIA<br>
                    NIP. 19810420 201412 2 002</p>
                </td>
            </tr>  
        </table>
        <div class="page_break">
        <div class="p">
            DAFTAR PENERIMA HONORARIUM PENYEDIA PENDUKUNG TEKNIS DAN ADMINSTRASI PERKANTORAN
            <br>BULAN <?= strtoupper(bulan($bulan) . ' ' . $tahun )?>
        </div>
        <br>
        <table id="table">
            <thead>
                <tr>
                    <th>No.</th>
                    <th>Nama</th>
                    <th>Jabatan</th>
                    <!-- <th>Persentase <br>Kehadiran</th> -->
                    <th>Besaran (Rp)</th>
                    <th>BPJS</th>
                    <th>Jumlah <br>Yang Diterima</th>
                    <th>Tanda Tangan</th>
                </tr>
                <tr>
                    <th>1</th>
                    <th>2</th>
                    <th>3</th>
                    <th>4</th>
                    <th>5</th>
                    <th>6</th>
                    <th>7</th>
                    <!-- <th>8</th> -->
                </tr>
            </thead>
        </tbody>
            <?php foreach($gaji as $i => $k): ?>
                <tr>
                <td style="text-align:center"><?= $i+1 ?></td>
                <td><?= $k['nama'];?></td>
                <td><?= $k['divisi'];?> Hari</td>
                <!-- <td style="text-align:center"><?= $k['persen_hadir'];?>%</td> -->
                <td style="text-align:center">Rp. 2,250,000</td>
                <td style="text-align:center">Rp. 32,419</td>
                <td style="text-align:center">Rp. <?= number_format(2250000 - 32419);?></td>
                <td></td>
            </tr>
            <?php endforeach; ?>
        </tbody>
        <tfoot>
            <tr>
                <th colspan="3">Jumlah</th>
                <th><?php echo 'Rp. '.number_format(2250000 * 7);?></th>
                <th><?php echo 'Rp. '.number_format(32419 * 7);?></th>
                <th>Rp. <?= number_format(round(($k['uang_diterima'] - 32419)*7));?></th>
                <th></th>
            </tr>
        </tfoot>
        </table>
        <br>
        <table style="width: 100%;font-family: Trebuchet MS, Arial, Helvetica, sans-serif;
                font-size: 10px;">
            <tr style="text-align: center;">
                <td style="text-align:center">
                    Mengetahui<br>
                    Camat Majalaya<br>
                    Selaku Pengguna Anggaran<br><br><br><br><br><br><br><br>
                    <p style="font-weight: 100";>Drs. IKA NUGRAHA<br>
                    NIP. 1965091 199403 1005</p>
                </td>
                <td style="width: 50%;"></td>
                <td style="text-align:center">
                    Majalaya, 
                        <?php 
                            $mydate=getdate(date("U"));
                            echo "$mydate[mday] $mydate[month] $mydate[year]";
                        ?><br>
                    <br><br><br><br><br><br><br><br><br>
                    <p style="font-weight: 100;">SYLVIA APRILLIA<br>
                    NIP. 19810420 201412 2 002</p>
                </td>
            </tr>  
        </table>
        </div>
    </body>
</html>