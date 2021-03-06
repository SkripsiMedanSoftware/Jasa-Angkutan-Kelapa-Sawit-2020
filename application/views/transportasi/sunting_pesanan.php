<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title"><?php echo $sub_judul; ?></h3>
	</div>
	<form action="<?php echo base_url('transportasi/sunting_pesanan/'.$this->uri->segment(3)) ?>" method="post">
		<div class="box-body">
			<div class="col-lg-6">
				<div class="form-group">
					<label>Nama Lengkap</label>
					<input class="form-control" type="text" name="nama_lengkap" placeholder="Nama Lengkap" value="<?php echo set_value('nama_lengkap', $pesanan_transportasi['nama_lengkap']) ?>">
					<?php echo form_error('nama_lengkap', '<span class="help-block error">', '</span>'); ?>
				</div>
				<div class="form-group">
					<label>Kontak Yang Dapat Dihubungi</label>
					<input class="form-control" type="text" name="seluler" placeholder="Kontak Yang Dapat Dihubungi" value="<?php echo set_value('seluler', $pesanan_transportasi['seluler']) ?>">
					<?php echo form_error('seluler', '<span class="help-block error">', '</span>'); ?>
				</div>
				<div class="form-group">
					<label>Jadwal Angkut</label>
					<input class="form-control" type="text" name="jadwal_angkut" placeholder="Jadwal Angkut" value="<?php echo set_value('jadwal_angkut', $pesanan_transportasi['jadwal_angkut']) ?>" id="jadwal_angkut">
					<?php echo form_error('jadwal_angkut', '<span class="help-block error">', '</span>'); ?>
				</div>
				<div class="form-group">
					<label>Penjemputan</label>
					<textarea name="penjemputan" class="form-control" placeholder="Penjemputan"><?php echo set_value('penjemputan', $pesanan_transportasi['penjemputan']) ?></textarea>
					<?php echo form_error('penjemputan', '<span class="help-block error">', '</span>'); ?>
				</div>
				<div class="form-group">
					<label>Catatan</label>
					<textarea name="catatan" class="form-control" placeholder="Catatan untuk admin"><?php echo set_value('catatan', $pesanan_transportasi['catatan']) ?></textarea>
					<?php echo form_error('catatan', '<span class="help-block error">', '</span>'); ?>
				</div>
				<?php if (aktif_sesi()['role'] == 'admin') { ?>
				<div class="form-group">
					<label>Beban Angkut (Kilogram)</label>
					<input class="form-control" type="text" name="beban_angkut" placeholder="Beban Angkut" value="<?php echo set_value('beban_angkut') ?>">
					<?php echo form_error('beban_angkut', '<span class="help-block error">', '</span>'); ?>
				</div>
				<?php } ?>
				<input type="hidden" name="transportasi_id" value="<?php echo $this->uri->segment(3) ?>">
			</div>
		</div>
		<div class="box-footer">
			<a  class="btn btn-default btn-flat" onclick="window.history.back()"><i class="fa fa-arrow-left"></i> Kembali</a>
			&nbsp;&nbsp;
			<button type="submit" class="btn btn-success btn-flat"><i class="fa fa-save"></i> Simpan</button>
		</div>
	</form>
</div>