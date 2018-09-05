<?php 

class C_user extends CI_Controller{

	function __construct(){
		parent::__construct();		
		$this->load->model('m_data_user');
        $this->load->helper('url');
	}

	function user(){
		if ($_SESSION["status_user"] == 'Admin') {
			$data=array(
				'title'=>'Pengguna - PLN',
				'status_user' => $this->session->userdata('status_user'),
				'user' => $this->m_data_user->tampil_user()
			);
			$this->load->view('element/header', $data);
	  		$this->load->view('formuser',$data);
	 		$this->load->view('element/footer');
		} else {
		    redirect('c_main');
		}
	}

	function tambah_user(){
		if ($_SESSION["status_user"] == 'Admin') {
			$data=array(
			'title'=>'Pengguna - PLN',
			'status_user' => $this->session->userdata('status_user'),
			'get_layanan' => $this->m_data_user->get_layanan(),
			'user' => $this->m_data_user->tampil_user()
			);
			$this->load->view('element/header', $data);
	  		$this->load->view('registerpage',$data);
	 		$this->load->view('element/footer');
		} else {
		    redirect('c_main');
		}
	}

	function tambah_aksi_user(){
		$this->form_validation->set_rules('nama','Nama','required');
		$this->form_validation->set_rules('no_karyawan','NIP','required');
		$this->form_validation->set_rules('password','Password','required');
		$this->form_validation->set_rules('konfirm_pass','Konfirmasi Password','required');
		$this->form_validation->set_rules('status_user','Status','required');
		$this->form_validation->set_rules('id_layanan','Area','required');

		if ($this->form_validation->run()) {
			$nama = $this->input->post('nama');
			$password = $this->input->post('password');
			$konfirm_pass = $this->input->post('konfirm_pass');
			$status_user = $this->input->post('status_user');
			$no_karyawan = $this->input->post('no_karyawan');
			$id_layanan = $this->input->post('id_layanan');
			if ($password == $konfirm_pass) {
				if ($this->m_data_user->cek_id_karyawan($no_karyawan) == 0) {
					$data=array(
					'nama' => $nama,
					'no_karyawan' => $no_karyawan,
					'password' => $password,
					'status_user' => $status_user,
					'id_layanan' => $id_layanan
					);
					$this->m_data_user->input_user($data, 'tb_user');
					redirect('c_user/user');
					echo " <script>
		                     alert('Registrasi sukses. Akun berhasil didaftarkan');
		                     window.location='user'
		                    </script>";
					} else{
					echo " <script>
	                     alert('Registrasi gagal. ID karyawan sudah terdaftar');
	                     window.location='tambah_user'
	                    </script>"; }

			} else {
				echo " <script>
	                     alert('Registrasi gagal. Password dan Konfirmasi password tidak sama');
	                     window.location='tambah_user'
	                    </script>"; }
			 	
		} else {
			$data=array (
			'title'=>'Pengguna - PLN',
        	'status_user' => $this->session->userdata('status_user'),
            'error_validation' => validation_errors(),
            'get_layanan' => $this->m_data_user->get_layanan(),
            //'user' => $this->m_data_user->tampil_user()
        	);
        $this->load->view('element/header',$data);	
		$this->load->view('registerpage',$data);
		$this->load->view('element/footer');
			}
			
	}

		
	

	function hapus_user($id){
		$data = array(
		'isDelete' => 'yes',
		'no_karyawan' => '00'
		);
		$where = array(
		'id_karyawan' => $id);
		$this->m_data_user->update_data($where,$data,'tb_user');
		redirect('c_user/user');
	}

	// function hapus_user($id){
	// 	$where = array('id_karyawan' => $id);
	// 	$this->m_data_user->hapus_user($where,'tb_user');
	// 	redirect('c_user/user');
	// }

	function edit_user($id){
		if ($_SESSION["status_user"] == 'Admin') {
			$where = array('id_karyawan' => $id);
			$data=array (
				'title'=>'Pengguna - PLN',
				'status_user' => $this->session->userdata('status_user'),
				'get_layanan' => $this->m_data_user->get_layanan(),
	        	'user' => $this->m_data_user->edit_data($where,'tb_user')->result()
	        	);
			$this->load->view('element/header', $data);
			$this->load->view('form_edit_user',$data);
			$this->load->view('element/footer');
		} else {
		    redirect('c_main');
		}
	}

	function update_user(){
		$id_karyawan = $this->input->post('id_karyawan');
		$no_karyawan = $this->input->post('no_karyawan');
		$nama = $this->input->post('nama');
		$password = $this->input->post('password');
		$status_user = $this->input->post('status_user');
		$id_layanan = $this->input->post('id_layanan');

		$data = array(
			'nama' => $nama,
			'password' => $password,
			'status_user' => $status_user,
			'no_karyawan' =>$no_karyawan,
			'id_layanan' => $id_layanan
		);

		$where = array(
			'id_karyawan' => $id_karyawan
		);

		$this->m_data_user->update_data($where,$data,'tb_user');
		redirect('c_user/user');
	}

}
