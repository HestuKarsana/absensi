<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<?= base_url('assets/css/w3pro.css') ?>" rel="stylesheet" />
<body>

<div class="w3-container w3-card">
  <h2 sty>E - Absensi</h2>
</div>

<div class="w3-cell-row">
  <div class="w3-cell">
    <img src="<?= base_url('assets/img/profil/1564293217.png')?>" class="w3-circle">
  </div>
  <div class="w3-cell ">
    <!-- <?php print_r($_SESSION);?> -->
    <p><?php echo $_SESSION['nama'];?></p>
      <p><?php echo $_SESSION['divisi'];?></p>
  </div>
</div>
<hr>
</body>
</html>