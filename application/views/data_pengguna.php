<main>
	<div class="container" style="margin-top: 20px; margin-bottom: 20px">
		<div class="row">
           <div class="col-md-12">
              <h1 class="page-head-line">Pengguna </h1>
           </div>
        </div> <!-- row -->
       <div class="row">
       	<div class="col-md-6">
       		  <a href="<?php echo base_url();?>c_user/tambah_user" class="btn btn-primary btn-md"><span class="glyphicon glyphicon-plus-sign"></span> <b>TAMBAH</b> </a>
       	</div> <!-- col 6 -->
       </div> <!-- row -->
       <div class="row">
       	<div class="col-md-12">
       		<div class="table-responsive" style="margin-top: 20px">
                <table id="example" class="table table-striped table-hover">
                   <thead>
                     <tr>
	                     <th>No</th>
                         <th>Nama</th>
                         <th>NIP</th>
                         <th>Password</th>
                         <th>Status</th>
                         <th>Area</th>
                         <th style="width:50px">Aksi</th>
	                 </tr>
                    </thead>
                       <tbody>
                         <?php 
                         $no=1;
                         foreach($user as $u ) {?>
                         <tr>
                         <td><?php echo $no++ ?></td>
                         <td><?php echo $u->nama ?></td>
                         <td><?php echo $u->no_karyawan ?></td>
                         <td><?php echo $u->password ?></td>
                         <td><?php echo $u->status_user ?></td>
                         <td><?php if ($u->id_layanan == '28') {
                               echo "-";
                               } else{
                              		echo $this->m_data_user->get_layanan_byid($u->id_layanan)->lokasi;
                                } ?>
                                	
                         </td>
                         <td>
                           <div class="btn-group">
                            <form method='' action="<?php echo base_url('c_user/edit_user/'.$u->id_karyawan) ?>">
                             <button class='btn btn-primary' type='submit'><i class="far fa-edit"></i></button>
                             </form>
                              <button data-toggle="modal" data-target="#exampleModal" onclick="set_id(<?php echo $u->id_karyawan ?>)" class="btn btn-danger"><i class="far fa-trash-alt"></i></button>
                             </div>
                           </td>
                         </tr>
                           <?php } ?>
                      </tbody>
                  </table>
              </div>

       	</div> <!-- col 12 -->
       </div> <!-- row -->
	</div> <!-- container -->
</main>

<script type="text/javascript">
   $(document).ready( function () {
     $('#example').DataTable(); } );
     $('#example').dataTable({});
 </script>
