<main>
    <div class="content-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="page-head-line">Edit </h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <br />
                    <?php foreach($user as $u){ ?>
                    <form action="<?php echo base_url();?>c_user/update_user" method="post">
                        <div class="form-group">
                          <label for="ID">NIP<font color="red">*</font></label>
                          <input  class="form-control" type="text" name="no_karyawan" value="<?php echo $u->no_karyawan ?>">
                           <input  class="form-control" type="hidden" name="id_karyawan" value="<?php echo $u->id_karyawan ?>">
                        </div>
                        <div class="form-group">
                          <label for="nama">Nama:<font color="red">*</font></label>
                          <input id="nama" type="text"  class="form-control" name="nama" value="<?php echo $u->nama ?>">
                        </div>
                        <div class="form-group">
                          <label for="password">Password:<font color="red">*</font></label>
                          <input id="password" type="password"  class="form-control" name="password" value="<?php echo $u->password ?>">
                        </div>
                        <!-- <div class="form-group">
                          <label for="comfirmpassword">Konfirmasi Password:<font color="red">*</font></td>
                          <input type="password" id="confirmpassword" name="password" style="width:500px" class="form-control">
                        </div> -->
                        <div class="form-group">
                          <label>Status :</label>
                          <select class="form-control" name="status_user" id="status_user">
                            <?php echo "<option value='$u->status_user'>-- $u->status_user --</option>"; ?>
                            <option value="Admin">Admin</option>
                            <option value="Input">Petugas Input</option>
                            <option value="Viewer">Petugas Viewer</option>
                          </select>
                        </div>
                         <div class="form-group" id="area" style="display: none">
                          <label for="area">Area <font color="red">*</font></label>
                          <select id="area" name="id_layanan" class="form-control">
                          <option value="<?php echo $u->id_layanan ?>">--<?php echo $this->m_data_user->get_layanan_byid($u->id_layanan)->lokasi ?>--</option>
                           <?php 
                             foreach($get_layanan as $gl){ 
                             echo "<option  value='$gl->id_layanan'>$gl->lokasi</option>";
                             }
                          ?>
                          </select>
                          <span class="help-block" style="color: red"> <?php $error = form_error('id_layanan');
                          echo "<font style='color: red;font-size: 15px' >$error</font>";?></span> 
                      </div>
                     
                        <hr/>
                          <button type="submit" class="btn btn-default btn-lg">Simpan</button>
                        </label></div>
                      </form>
                    <?php } ?>
                        
                        </div>
                        </div>  
                      </div>
                    </div>
                  </div>
</main>

<script type="text/javascript">
   $('#status_user').on('change', function(){
        var val = this.value;
        if(val == "Viewer"){
          $('#area').attr('style','display:block !important');
        }else {
           $('#area').attr('style','display:none !important');
        }
      });
</script>