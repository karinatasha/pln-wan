<main>

<div class="content-wrapper">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <h4 class="page-head-line">Dashboard Admin</h4>
      </div>
    </div> <!-- row -->

      <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <!-- <h4></h4> -->
            <p></p>            
            <table id="example" class="table table-striped">
              <thead>
                <tr>
                  <th>Area</th>
                  <th>Jumlah Gangguan</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach($layanan as $l ) { ?>
                <tr>
                  <td><?php echo $l->lokasi ?></td>
                  <td><?php echo $this->m_data_layanan->count_gangguan($l->id_layanan); ?></td>
                </tr>
              <?php } ?>
              </tbody>
            </table>
        </div> <!-- colmd3 -->
        <div class="col-md-3"></div> 
    </div> <!-- row -->
  </div>
</div>

<script type="text/javascript">
    $(document).ready( function () {
    $('#example').DataTable();
} );
    $('#example').dataTable({
  });
</script>
