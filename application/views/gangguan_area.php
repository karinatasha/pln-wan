<main>

<div class="content-wrapper">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <h4 class="page-head-line">Data Gangguan Area <?php echo $this->m_data_gangguan->get_layanan_byid($id_layanan)->lokasi ?></h4>
      </div>
    </div> <!-- row -->

      <div class="row">
        <div class="col-md-12">
            <!-- <h4></h4> -->
            <p></p>            
            <table id="example" class="table table-striped">
              <thead>
                <tr>
                  <th>No</th>
                  <th>Tanggal</th>
                  <th>Jenis Gangguan</th>
                  <th>Lokasi</th>
                  <th>Penyebab</th>
                  <th>Solusi</th>
                  <th>Progress</th>
                </tr>
              </thead>
              <tbody>
                <?php 
                $no=1;
                foreach($gangguan_area as $ga ) { ?>
                <tr>
                  <td><?php echo $no++  ?></td>
                  <td><button onclick='detail_waktu(<?php echo $ga->id_gangguan ?>)' id="btn-edit" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#ModalX"><?php echo $ga->open_date ?></button></td>
                  <td>
                    <?php if ($ga->id_jenisgangguan=="16") {
                        echo "<p style='color:'>Belum Teridentifikasi</p>";
                         } else { ?>
                             <button onclick='ket_jenisgangguan(<?php echo $ga->id_gangguan ?>)' id="btn-edit" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#ModalY"><?php echo $this->m_data_gangguan->tampil_jenisgangguan_byid($ga->id_jenisgangguan)->jenis_gangguan ?></button>
                    <?php  } ?>
                  </td>
                  <td><?php echo $ga->lokasi_gangguan ?></td>
                  <td><?php echo $ga->penyebab_gangguan ?></td>
                  <td><?php echo $ga->solusi_gangguan ?></td>
                  <td>Progress</td>
                </tr>
              <?php } ?>
              </tbody>
            </table>
        </div> <!-- colmd3 -->
        <div class="col-md-3"></div> 
    </div> <!-- row -->
  </div> <!-- container -->
</div>

<!-- Modal Keterangan Jenis Gangguan -->
              <div class="modal fade" id="ModalY" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                      <div class="modal-content">
                          <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLabel">Keterangan Jenis Gangguan</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                              </button>
                          </div>
                          <div class="modal-body">
                            <div class="">
                              <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                  <tbody>
                                     <tr>
                                        <td><strong>Jenis Gangguan</strong></td>
                                        <td style="" id="jenis_gangguan"></td>
                                    </tr>
                                    <tr>
                                       <td style=""><strong>Keterangan</strong></td>
                                      <td style="" id="ket_gangguan"></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Deskripsi Jenis Gangguan</strong></td>
                                       <td style="" id="deskripsi_jenisgangguan"></td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>

                          </div>
                          </div> <!-- modal body -->
                          <div class="modal-footer">
                              <button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
                          </div>
                      </div>
                  </div>
              </div><!-- modal -->

              <!-- Modal Detail Waktu -->
              <div class="modal fade" id="ModalX" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                      <div class="modal-content">
                          <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLabel">Waktu Gangguan</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                              </button>
                          </div>
                          <div class="modal-body">
                            <div class="">
                              <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                  <tbody>
                                     <tr>
                                        <td><strong>Open Date</strong></td>
                                        <td style="" id="open_date"></td>
                                    </tr>
                                    <tr>
                                       <td style=""><strong>Open Time</strong></td>
                                      <td style="" id="open_time"></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Close Date</strong></td>
                                       <td style="" id="close_date"></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Close Time</strong></td>
                                       <td style="" id="close_time"></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Durasi</strong></td>
                                       <td style="" id="durasi"></td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>

                          </div>
                          </div> <!-- modal body -->
                          <div class="modal-footer">
                              <button type="button" class="btn btn-default" data-dismiss="modal">Tutup</button>
                          </div>
                      </div>
                  </div>
              </div><!-- modal -->


<script type="text/javascript">
    $(document).ready( function () {
    $('#example').DataTable();
} );
    $('#example').dataTable({
  });

    function ket_jenisgangguan(id) {

      $.ajax({
        url: "<?php echo base_url('c_gangguan/gangguan_data') ?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data) {
          console.table(data);
          $('#deskripsi_jenisgangguan').text(data.deskripsi_jenisgangguan);
          $('#jenis_gangguan').text(data.jenis_gangguan);
          $('#ket_gangguan').text(data.ket_gangguan);
          
          $('#ModalY').modal('show');
        },
        error: function(jqXHR, textStatus, errorThrown) {
          console.log('gagal mengambil data');
        }
      });
    }

     function detail_waktu(id) {

      $.ajax({
        url: "<?php echo base_url('c_gangguan/detail_waktu/') ?>/" + id,
        type: "GET",
        dataType: "JSON",
        success: function(data) {
          console.table(data);
          $('#id_gangguan').text(data.id_gangguan);
          $('#open_date').text(data.open_date);
          $('#open_time').text(data.open_time);
          $('#close_date').text(data.close_date);
          $('#close_time').text(data.close_time);
          $('#durasi').text(data.durasi);
          
          $('#ModalX').modal('show');
        },
        error: function(jqXHR, textStatus, errorThrown) {
          console.log('gagal mengambil data');
        }
      });
    }
</script>
