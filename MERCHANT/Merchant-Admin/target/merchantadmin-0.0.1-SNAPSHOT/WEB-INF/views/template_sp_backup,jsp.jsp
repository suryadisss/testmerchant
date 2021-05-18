<html>
<head>
<title>HTML to PDF</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<link media="all"
	href="../../resources/libs/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link media="all"
	href="../../resources/libs/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<style type="text/css">
@media all {
	.page-break {
		display: none;
	}
}

@media print {
	.page-break {
		display: block;
		page-break-before: always;
	}
}
</style>
</head>
<body style="font-size: 10pt;">
	<table style="margin-top: 10px; margin-bottom: 10px;">
		<tr>
			<td width="40%"><img
				src="*base_url*/resources/images/background1.png" class="img"
				width="90%" /></td>
			<td align="center"><h4>Surat Pernyataan</h4></td>

		</tr>
	</table>

	<p>Saya yang bertanda-tangan di bawah ini:</p>
	<table style="font-size: 10pt;">
		<tr>
			<td>&nbsp;&nbsp;&nbsp;</td>
			<td colspan="3" align="left">
				<table style="font-size: 10pt;">
					<tr>
						<td>Nama lengkap sesuai identitas</td>
						<td>:</td>
						<td>*nama*</td>
					</tr>
					<tr>
						<td>Identitas, nomor</td>
						<td>:</td>
						<td>KTP, *ktp*</td>
					</tr>
					<tr>
						<td>Umur</td>
						<td>:</td>
						<td>*umur*</td>
					</tr>
					<tr>
						<td>Alamat Email/Surel</td>
						<td>:</td>
						<td>*email*</td>
					</tr>
					<tr>
						<td>Nomor telepon seluler</td>
						<td>:</td>
						<td>*mob*</td>
					</tr>
				</table>



			</td>
			<td width="30%" valign="top" align="right"><img
				src="*img_profil*" width="125px" /></td>
		</tr>


	</table>
	<table style="font-size: 10pt; margin-top: 10px; margin-left: 25px">
		<tr>
			<td valign="top">-</td>
			<td align="top">berikut dengan segala data dan informasi baik
				yang tersedia secara elektronik maupun secara fisik (untuk
				selanjutnya disebut "Penerima Pinjaman")</td>
		</tr>
	</table>


	<p>Dengan ini saya menyatakan bahwa :</p>
	<ol>
		<li>Saya telah mengajukan permohonan pinjaman KiniCintaku serta
			telah membaca dan memahami sepenuhnya segala persyaratan pinjaman
			KiniCintaku.</li>
		<li>Saya bersedia dilakukan pemeriksaan latar belakang baik
			secara langsung atau tidak langsung atas data kredit saya sehubungan
			dengan permohonan pinjaman KiniCintaku termasuk pelaporan data
			pinjaman saya sesuai ketentuan regulator.</li>
		<li>Saya telah menerima sejumlah uang sebagai pinjaman pembiayaan
			KiniCintaku, dengan perhitungan sebagai berikut:<br />
			<table>
				<tbody style="font-size: 10pt;">
					<tr>
						<td width="35%">Harga pembelian barang</td>
						<td width="5%">:</td>
						<td width="5%">Rp.&nbsp;</td>
						<td align="right">*total*</td>
					</tr>
					<tr>
						<td width="35%">Uang muka pembelian barang</td>
						<td width="5%">:</td>
						<td width="5%">Rp.&nbsp;</td>
						<td align="right">*uang_muka*</td>
					</tr>
					<tr>
						<td width="35%">Nilai pembiayaan / pinjaman</td>
						<td width="5%">:</td>
						<td width="5%">Rp.</td>
						<td align="right">*pinjaman*<br /></td>

					</tr>
					<tr>
						<td colspan="4">&nbsp;</td>
					</tr>
					<tr>
						<td width="35%">Biaya Proses</td>
						<td width="5%">:</td>
						<td width="5%" align="left">Rp.</td>
						<td align="right">*biaya_proses*</td>
					</tr>
					<tr>
						<td width="35%">Biaya Asuransi (apabila ada)</td>
						<td width="5%">:</td>
						<td width="5%">Rp.</td>
						<td align="right">*biaya_as*</td>
					</tr>
					<tr>
						<td width="35%">Biaya Penagihan (apabila perlu)</td>
						<td width="5%">:</td>
						<td width="5%">Rp.&nbsp;</td>
						<td align="right">*biaya_pen*</td>
					</tr>
					<tr>
						<td colspan="4">&nbsp;</td>
					</tr>
					<tr>
						<td width="35%">Jangka Waktu Pinjaman</td>
						<td width="5%">:</td>
						<td width="5%"></td>
						<td align="right">*tenor* bulan</td>
					</tr>
					<tr>
						<td width="35%">Suku Bunga</td>
						<td width="5%">:</td>
						<td width="5%"></td>
						<td align="right">*suku_b1* % *suku_b2*</td>
					</tr>
					<tr>
						<td width="35%">Biaya Administrasi Angsuran</td>
						<td width="5%">:</td>
						<td width="5%">Rp.&nbsp;</td>
						<td align="right">*admin*</td>
					</tr>
					<tr>
						<td width="35%">Angsuran /bulan</td>
						<td width="5%">:</td>
						<td width="5%">Rp.&nbsp;</td>
						<td align="right">*install* setiap pembayaran</td>
					</tr>

					<tr>
						<td width="35%">Tanggal Pembayaran / Bulan</td>
						<td width="5%">:</td>
						<td width="5%"></td>
						<td align="right">*date_py*</td>
					</tr>
					<tr>
						<td width="35%">Denda keterlambatan</td>
						<td width="5%">:</td>
						<td width="5%">Rp.</td>
						<td align="right">*denda* /Hari</td>
					</tr>
				</tbody>
			</table>



		</li>
		<li>Saya sanggup untuk melakukan jadwal pembayaran sesuai dengan
			jadwal yang ditetapkan dalam butir 3 diatas, dengan perhitungan pokok
			dan bunga sebagaimana tertera dalam akun saya di KiniCintaku.</li>
		<li>Setiap pembayaran kembali pinjaman ditujukan ke Rekening
			Virtual Account sebagai berikut:<br />
			<table style="font-size: 10pt;">
				<tbody>
					<tr>
						<td width="35%">Nama Bank</td>
						<td width="5%">:</td>
						<td>BANK CENTRAL ASIA</td>
					</tr>
					<tr>
						<td width="35%">Nomor Virtual Account</td>
						<td width="5%">:</td>
						<td>*no_va*</td>
					</tr>
				</tbody>

			</table> <br />

		</li>
		<li>Saya setuju dan sepakat terhadap Perjanjian Pembiayaan
			sebagaimana ternyata dalam nomor kontra *no_kontrak*, Syarat dan Ketentuan Umum,
			dan berikut Surat Pernyataan ini yang berlaku sebagai Lampiran I atas
			Perjanjian Pembiayaan tersebut, beserta bukti pembelian (“receipt”)
			dengan seluruh dokumen terkait lainnya dalam bentuk cetak atau
			elektronik yang merupakan satu kesatuan dengan Perjanjian Pembiayaan<br />
			<br /> <br />
		<br /><br /><br /><br />
			<p class="page-break"></p>
		</li>

		<li>Atas pinjaman KiniCintaku, saya telah menggunakannya untuk
			melakukan pembelian barang sesuai dengan Bukti Pembelian yang
			merupakan bagian tidak terpisahkan dengan Surat Pernyataan ini,
			dengan Rincian Pembelian sebagai berikut : <br />
			<table style="font-size: 10pt;">
				<tbody>
					<tr>
						<td width="35%" align="top">Nama Toko</td>
						<td width="5%" align="top">:</td>
						<td align="left" align="top">*nama_toko*</td>
					</tr>
					<tr>
						<td width="35%" align="top">Receipt No.</td>
						<td width="5%" align="top">:</td>
						<td align="left" align="top"></td>
					</tr>
					<tr>
						<td width="35%" align="top">Nama Barang</td>
						<td width="5%" align="top">:</td>
						<td align="left" align="top">*produk*</td>
					</tr>
					<tr>
						<td width="35%" align="top"><b>Harga pembelian barang</b></td>
						<td width="5%" align="top"><b>:</b></td>
						<td align="left" align="top"><b>Rp. *total*</b></td>
					</tr>
					<tr>
						<td width="35%" align="top">Tanggal Pembelian</td>
						<td width="5%" align="top">:</td>
						<td align="left" align="top">*tanggal_pembelian*</td>
					</tr>

				</tbody>
			</table> <br />


		</li>
		<li>Atas pembelian barang sebagaimana dimaksud dalam butir 6
			diatas, saya telah membayar sejumlah:

			<table style="font-size: 10pt;">
				<tbody>
					<tr>
						<td>a).</td>
						<td align="left" align="top">Rp. *biaya_proses* kepada PT
							Dana Kini Indonesia, untuk biaya proses;</td>
					</tr>
					<tr>
						<td>b).</td>
						<td align="left" align="top">Rp. *uang_muka* kepada PT HCI,
							untuk uang muka pembelian barang;</td>
					</tr>
				</tbody>
			</table>
		</li>
		<li>Saya telah menerima barang sebagaimana dimaksud dalam butir 5
			diatas, dalam keadaan baik, lengkap, dan berfungsi sebagaimana
			layaknya.</li>
	</ol>
	<p>Surat Pernyataan ini dibuat sebagai kelengkapan pinjaman program
		KiniCintaku, terkait pembiayaan melalui perusahaan pinjam meminjam
		yang berbasis teknologi (Peer to Peer Lending) melalui PT Dana Kini
		Indonesia, berkedudukan di Jakarta Barat.</p>
	<p>Surat Pernyataan ini saya buat dengan sebenarnya, dalam keadaan
		sadar, dan tanpa paksaan dari pihak manapun</p>
	<table width="30%" style="margin-top: 10px; font-size: 10pt;">
		<tr>
			<td align="left">*tempat*, *tanggal_pembelian*<br />Penerima
				Pinjaman<br /> <br /> <br />
			<br /> <br /></td>
			<td></td>
			<td align="left"></td>
		</tr>
		<tr>
			<td align="left" valign="top">Materai 6000<br /> <br /> <br />
			<br /> <br /></td>
			<td></td>
			<td align="left"></td>
		</tr>
		<tr>
			<td align="left"><b style="border-bottom: 1.5px solid black;">*nama*</b><hr/></td>
			<td></td>
			<td align="left"></td>
		</tr>

	</table>

</body>
</html>