<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title float-left">Daftar Gaji</h4>
                <div class="d-inline ml-auto float-right">
                    <form action="" method="get">
                    <div class="row">
                        <div class="col">
                            <select name="bulan" id="bulan" class="form-control">
                                <option value="" disabled selected>-- Pilih Bulan --</option>
                                <?php foreach($all_bulan as $bn => $bt): ?>
                                    <option value="<?= $bn ?>" <?= ($bn == $bulan) ? 'selected' : '' ?>><?= $bt ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="col ">
                            <select name="tahun" id="tahun" class="form-control">
                                <option value="" disabled selected>-- Pilih Tahun</option>
                                <?php for($i = date('Y'); $i >= (date('Y') - 10); $i--): ?>
                                    <option value="<?= $i ?>" <?= ($i == $tahun) ? 'selected' : '' ?>><?= $i ?></option>
                                <?php endfor; ?>
                            </select>
                        </div>
                        <div class="col ">
                            <button type="submit" class="btn btn-primary btn-fill btn-block">Tampilkan</button> 
                        </div>
                    </div>
                </form>
                </div>
            </div>
            <div class="card-body">
            <div class="col-xs-12 col-sm-6 ml-auto text-right mb-2">
                        <div class="dropdown d-inline">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="droprop-action" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-print"></i>
                                Export Laporan
                            </button>
                            <div class="dropdown-menu" aria-labelledby="droprop-action">
                                <a href="<?= base_url('gaji/export/?bulan='.$bulan."&tahun=$tahun") ?>" class="dropdown-item" target="_blank"><i class="fa fa-file-pdf-o"></i> PDF</a>
                            </div>
                        </div>
                    </div>
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <th>No.</th>
                            <th>Nama</th>
                            <th>Jumlah Hadir</th>
                            <th>Jumlah Tidak Hadir</th>
                            <th>Persentase Kehadiran</th>
                            <th>Jumlah Gaji</th>
                        </thead>
                        <tbody>
                        <?php if($gaji):?>
                        <?php foreach($gaji as $i => $k): ?>
                            <tr>
                                <td><?= $i+1 ?></td>
                                <td><?= $k['nama'];?></td>
                                <td><?= $k['jumlah_hadir'];?> Hari</td>
                                <td><?= $k['jumlah_tdk_hadir'];?> Hari</td>
                                <td><?= $k['persen_hadir'];?>%</td>
                                <td>Rp. <?= number_format(round($k['uang_diterima']));?></td>
                            </tr>
                        <?php endforeach; ?>
                        <?php else: ?>
                            <tr>
                                <td class="bg-light" colspan="4">Tidak ada data absen</td>
                            </tr>
                        <?php endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

