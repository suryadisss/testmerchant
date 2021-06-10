<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Report SPK" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
</jsp:include>
<<style>
.kopSurat {
	width : 100%;
	height : 100%;	
}
.imgStampel {
	margin-top : 10px;
	margin-right : 10px;
	float : right;
}
.target {
	margin-right: 5px;
	margin-right : 10px;
}
.lblSpk{
	margin : 0px;
}
.namaCust {
	margin-top : 5px;
	margin-right: 5px;
	float : right;
}
.b_spkReport {
	width : 700px/* 595px */;
	height : 1100px/* 842px */;
	border : 1px solid black;
	left : 50%;
}
.a_spkContainer{
	height: 100%;
  	display: flex;
	align-items: center;
	justify-content: center;	
}
.headSpk{
	width: 100%;
	height : 8%;
	border-bottom: 1px solid black;
}
.bodySpk{
	width: 100%;
	height : 87%;
}
.detAgency {
	width: 100%;
	height :10%;
	/* border : 1px solid black; */
	display: inline-block;
}
.a {
	width: 65%;
	height: 100%;
	float: left;
	/* border-right: 1px solid black; */
	padding : 2px;
}
.af {
	width: 100%;
	height: 100%;
	float: left;
	/* border-right: 1px solid black; */
	padding : 2px;
}
.b {
	width: 35%;
	height: 100%; 
	float : left;
	padding : 2px;
}
.c {
	width: 50%;
	height: 100%;
	float: left;
	/* border-right: 1px solid black; */
	padding : 2px;
}
.d {
	width: 50%;
	height: 100%; 
	float : left;
	padding : 2px;
}
.fotoTarget {
	width: 100%;
	height: 295px;
	margin-top: 10px;
}
.font {
	font-family: "calibri";
	color: black;
}
.spkData {
	margin-left: 5px;
}
.bold {
	font-size: 14pt;
}
.detBorrower {
	width: 100%;
	height :45%;
	/* border : 1px solid black; */
}
.detAddress {
	width: 100%;
	height :35%;
	/* border : 1px solid black; */
}
.stamp {
	width: 100%;
	height :10%;
	/* border : 1px solid black; */
	display: inline-block;
}
.footSpk{
	width: 100%;
	height : 5%;
	/* border-top: 1px solid black; */
	display: inline-block;
}
.data {
	width:190px;
}
.divEc {
	display: inline-block;
	 width: 100%;
	  height: auto; 
}
.tbl {
	width: 50%;
	height:100%;
	float: left;
}
.spc {
	width: 11.133px;
}
</style>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">

			<jsp:include page='_Side_Navigation.jsp' />
			<jsp:include page='_Top_Navigation.jsp' />

			<div class="right_col" role="main">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-lg-12">
						<div class="x_panel">
						<!-- <a href="javascript:demoFromHTML()" class="button">Run Code</a> -->
							<div class="a_spkContainer">
								<div class="b_spkReport">
									<div class="headSpk">
										<img class ="kopSurat" alt="Header Report" src="<c:url value="/resources/images/reportHeader.png"/>">
									</div>
									<div class="bodySpk">
										<div class="detAgency">
											<div class="c">
												<table width="100%" height="100%" class="spkData">
													<tr width="50%">
														<td class="font bold"><b>Agency</b></td>
														<td class="font"><b>:</b></td>
														<td class="font bold"><label class="lblSpk" id="target_agency"></label></td>
													</tr>
													<tr width="50%">
														<td class="font bold"><b>Period</b></td>
														<td class="font"><b>:</b></td>
														<td class="font bold"><label class="lblSpk" id="date_from"></label> s/d <label class="lblSpk" id="date_to"></label></td>
													</tr>
												</table>
											</div>
											<div class="d">
												<table width="100%" height="100%" class="spkData">
													<tr width="50%">
														<td class="font bold"><b>ACC</b></td>
														<td class="font"><b>:</b></td>
														<td class="font bold"><label class="lblSpk" id="no_akun"></label></td>
													</tr>
													<tr width="50%">
														<td class="font bold"><b>AREA</b></td>
														<td class="font"><b>:</b></td>
														<td class="font bold"><label class="lblSpk" id="cst_municipality"></label></td>
													</tr>
												</table>
											</div>
										</div>
										<div class="detBorrower">
											<div class="a">
												<table width="100%" height="100%" class="spkData">
													<tr width="100%">
														<td class="font data">NO KONTRAK</td>
														<td class="font"><b>:</b></td>
														<td class="font"><label class="lblSpk" id="no_kontrak"></label></td>
													</tr>
													<tr>
														<td class="font">NAMA</td>
														<td class="font"><b>:</b></td>
														<td class="font"><label class="lblSpk" id="nama"></label></td>
													</tr>
													<tr>
														<td class="font">USIA</td>
														<td class="font"><b>:</b></td>
														<td class="font"><label class="lblSpk" id="umur"></label></td>
													</tr>
													<tr>
														<td class="font">JENIS KELAMIN</td>
														<td class="font"><b>:</b></td>
														<td class="font"><label class="lblSpk" id="jenis_kelamin"></label></td>
													</tr>
													<tr>
														<td class="font">Nomor VA</td>
														<td class="font"><b>:</b></td>
														<td class="font"><label class="lblSpk" id="va_number"></label></td>
													</tr>
													<tr>
														<td class="font">JUMLAH PINJAMAN</td>
														<td class="font"><b>:</b></td>
														<td class="font">Rp <label class="lblSpk" id="jml_pinj"></label></td>
													</tr>
													<tr>
														<td class="font">SISA POKOK PINJAMAN</td>
														<td class="font"><b>:</b></td>
														<td class="font">Rp <label class="lblSpk" id="sisa_pokok_pinj"></label></td>
													</tr>
													<tr>
														<td class="font">TUNGGAKAN ANGSURAN</td>
														<td class="font"><b>:</b></td>
														<td class="font">Rp <label class="lblSpk" id="tunggakan_angs"></label></td>
													</tr>
													<tr>
														<td class="font">ANGSURAN POKOK</td>
														<td class="font"><b>:</b></td>
														<td class="font">Rp <label class="lblSpk" id="angs_pokok"></label></td>
													</tr>
													<tr>
														<td class="font">TOTAL DENDA</td>
														<td class="font"><b>:</b></td>
														<td class="font">Rp <label class="lblSpk" id="tot_denda"></label></td>
													</tr>
													<tr>
														<td class="font">COLLECTION FEE</td>
														<td class="font"><b>:</b></td>
														<td class="font">Rp <label class="lblSpk" id="collection_fee"></label></td>
													</tr>
													<tr>
														<td class="font">VA FEE</td>
														<td class="font"><b>:</b></td>
														<td class="font">Rp <label class="lblSpk" id="va_number_fee"></label></td>
													</tr>
													<tr>
														<td class="font">DPD/BUCKET</td>
														<td class="font"><b>:</b></td>
														<td class="font"><label class="lblSpk" id="dpd_bucket"></label> Hari</td>
													</tr>
													<tr>
														<td class="font">PRODUk</td>
														<td class="font"><b>:</b></td>
														<td class="font"><label class="lblSpk" id="r_product_name"></label></td>
													</tr>
													<tr>
														<td class="font">TENOR</td>
														<td class="font"><b>:</b></td>
														<td class="font"><label class="lblSpk" id="tenor"></label> Bulan</td>
													</tr>
													<tr>
														<td class="font">ANGSURAN YG SUDAH DIBAYAR</td>
														<td class="font"><b>:</b></td>
														<td class="font"><label class="lblSpk" id="angs_sdh_dibayar"></label></td>
													</tr>
													<tr>
														<td class="font">TGL BAYAR TERAKHIR</td>
														<td class="font"><b>:</b></td>
														<td class="font"><label class="lblSpk" id="tgl_bayar_trakhir"></label></td>
													</tr>
													<tr>
														<td class="font">JUMLAH BAYAR TERAKHIR</td>
														<td class="font"><b>:</b></td>
														<td class="font">Rp <label class="lblSpk" id="tot_last_payment"></label></td>
													</tr>
												</table>
											</div>
											<div class="b">
												<div class="fotoTarget" id="thumbImg"></div>
											</div>
										</div>
										<div class="detAddress">
											<div class="af">
												<table width="100%" height="auto" class="spkData">
													<tr width="50%">
														<td class="font">BARANG YG DIBELI</td>
														<td class="font spc"><b>:</b></td>
														<td class="font" id="produk"><!-- <label class="lblSpk" id="item"></label> --></td>
													</tr>
													<tr width="50%">
														<td class="font data"><b>ALAMAT KONTAK</b></td>
														<td class="font"><b>:</b></td>
														<td class="font"><label class="lblSpk" id="id1"></label></td>
													</tr>
													<tr width="50%">
														<td class="font">ALAMAT DOMISILI</td>
														<td class="font"><b>:</b></td>
														<td class="font"><label class="lblSpk" id="cst_address"></label></td>
													</tr>
													<tr width="50%">
														<td class="font">ALAMAT KTP</td>
														<td class="font"><b>:</b></td>
														<td class="font"><label class="lblSpk" id="cst_address_ktp"></label></td>
													</tr>
													<tr width="50%">
														<td class="font">HANDPHONE 1</td>
														<td class="font"><b>:</b></td>
														<td class="font"><label class="lblSpk" id="hp1"></label></td>
													</tr>
													<tr width="50%">
														<td class="font">PERUSAHAAN</td>
														<td class="font"><b>:</b></td>
														<td class="font"><label class="lblSpk" id="emd_company_name"></label></td>
													</tr>
													<tr width="50%">
														<td class="font">ALAMAT KANTOR</td>
														<td class="font"><b>:</b></td>
														<td class="font"><label class="lblSpk" id="cst_work_address"></label></td>
													</tr>
													<tr width="50%">
														<td class="font">NO TELP KANTOR</td>
														<td class="font"><b>:</b></td>
														<td class="font"><label class="lblSpk" id="cst_work_phone_no"></label></td>
													</tr>
												</table>
													
												<table width="100%" height="auto" class="spkData">
													<tr width="50%">
														<td class="font data">HASIL VISIT</td>
														<td class="font"><b>:</b></td>
														<td class="font"><label class="lblSpk" id="id1"></label></td>
													</tr>
												</table>
											</div>
											<!-- <div class="bf"></div> -->
										</div>
										<div class="stamp">
											<img class ="imgStampel" alt="Header Report" src="<c:url value="/resources/images/Rahasia.png"/>">
										</div>
									</div>
									<div class="footSpk">
										<b class="namaCust"><label class="font bold target" id="target"></label></b>
									</div>
								</div>
							</div>
							<button onclick="print()">Cetak sebagai PDF</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page='_Footer_Note.jsp'></jsp:include>
	</div>
</body>
<jsp:include page='_Footer_Gentellela.jsp'>
	<jsp:param name="datatables" value="1" />
	<jsp:param name="validate" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
</jsp:include>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
<script>
    function demoFromHTML() {
        var pdf = new jsPDF('p', 'pt', 'letter');
        // source can be HTML-formatted string, or a reference
        // to an actual DOM element from which the text will be scraped.
        source = $('.a_spkContainer')[0];

        // we support special element handlers. Register them with jQuery-style 
        // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
        // There is no support for any other type of selectors 
        // (class, of compound) at this time.
        specialElementHandlers = {
            // element with id of "bypass" - jQuery style selector
            '#bypassme': function (element, renderer) {
                // true = "handled elsewhere, bypass text extraction"
                return true
            }
        };
        margins = {
            top: 80,
            bottom: 60,
            left: 40,
            width: 522
        };
        // all coords and widths are in jsPDF instance's declared units
        // 'inches' in this case
        pdf.fromHTML(
            source, // HTML string or DOM elem ref.
            margins.left, // x coord
            margins.top, { // y coord
                'width': margins.width, // max width of content on PDF
                'elementHandlers': specialElementHandlers
            },

            function (dispose) {
                // dispose: object with X, Y of the last line add to the PDF 
                //          this allow the insertion of new lines after html
                pdf.save('Test.pdf');
            }, margins
        );
    }
</script> -->
<script>
	//start : action search
	$(document)
			.ready(
					function() {
						getDetailSpk();
						getDetailProduct();
						getDetailCust();
						getDetailEc();
						generate_data_image();
						getNamaTarget();
						generateAgency();
					});
	//end : action search
	//start : edit

	
/* 	function print1() {
		$.ajax({
			type : "GET",
			url : "${local_server}/spk_pdf/spk_out/${cif}",
			dataType : "json",
			async : true,
			success : function(res) {
				console.log("Sukses gan !");
			}
		});
	} */

	function print() {
		$.ajax({
			type : "GET",
			asyn : true,
			contentType : 'application/json',
			url : "${local_server}/spk_pdf/spk_out/${cif}",
			dataType : "json",
			async : true,
			success : function(data) {
				window.open(data.data[0].path);
						/* if(data.status == "Success"){
							window.open(data.data[0].path,'_blank');
							console.log("Sukses !");
						}	 */					
			}
		});
	}
	
/* 	function cekPDF2(val) {
		$
				.ajax({
					type : 'GET',
					asyn : true,
					contentType : 'application/json',
					url : '${local_server}/inquiry/getsubmision/' + val.id,
					dataType : 'json',
					success : function(data) {
						if (data.status == "Success") {
							if (data.hasOwnProperty('data')
									&& data.data.length > 0) {
								if (data.data[0].hasOwnProperty('ads_field_3')) {
									if (data.data[0].ads_field_3 != null
											&& data.data[0].ads_field_3 != "") {
										window.open(data.data[0].ads_field_3,
												'_blank');

									} else {
										$.alert("File not found")
									}
								} else {
									$.alert("File not found")
								}

							} else {
								$.alert("File not found")
							}
						} else {
							$.alert("File not found")
						}
					}
				});
	} */
	
	function printdebug() {
		$.ajax({
			type : "GET",
			url : "${local_server}/read_file/pdf_out/${85366}",
			dataType : "json",
			async : true,
			success : function(res) {
				console.log("Sukses gan !");
			}
		});
	}
	
	function getDetailSpk() {
		$.ajax({
			type : "POST",
			url : "${local_server}/spk_data/getspkinfo/${cif}",
			dataType : "json",
			async : true,
			success : function(res) {
				/* $.each(res.data.lender[0], function(i, o) {

					$("#cst_" + i).html(o);

				}); */
				$.each(res.SPK[0], function(i, o) {
					if (i == "jenis_kelamin") {
						o = gender(o);
					} else if (i == "va_number") {
						o = o;
					} else if (i == "jml_pinj") {
						o = toRp(o);
					} else if (i == "sisa_pokok_pinj") {
						o = toRp(o);
					} else if (i == "tunggakan_angs") {
						o = toRp(o);
					} else if (i == "angs_pokok") {
						o = toRp(o);
					} else if (i == "tot_denda") {
						o = toRp(o);
					} else if (i == "collection_fee") {
						o = toRp(o);
					} else if (i == "va_number_fee") {
						o = toRp(o);
					} else if (i == "tot_last_payment") {
						o = toRp(o);
					} else if (i == "tgl_bayar_trakhir") {
						o = spTgl(o);
					} else if (i == "no_akun"){
						o = noAkun(o);
					} else if (i == "dpd_bucket"){
						o = toRp(o);
					}
					
					$("#" + i).html(o);

				});
			}
		});
	}
	
	function generateAgency(){
		$.ajax({
			type : "POST",
			url : "${local_server}/spk_data/getspkAgent/${cif}",
			dataType : "json",
			async : true,
			success : function(res) {
				/* $.each(res.data.lender[0], function(i, o) {

					$("#cst_" + i).html(o);

				}); */
				$.each(res[0], function(i, o) {
					if (i == "target_agency") {
						$("#target_agency").html(o);
					}else if (i == "date_from") {
						$("#date_from").html(o);
					}else if (i == "date_to") {
						$("#date_to").html(o);
					}

				});
			}
		});
	}
	
	function generate_data_image(){
		$.ajax({
			type : "POST",
			url : "${local_server}/spk_data/getspkinfo/${cif}",
			dataType : "json",
			async : true,
			success : function(res) {
				/* $.each(res.data.lender[0], function(i, o) {

					$("#cst_" + i).html(o);

				}); */
				$.each(res.selfie_branch[0], function(i, o) {
					if (i == "path"){
						var html = "";
						html += "<img class= 'fotoTarget' src= '"+o+"' alt='Image Not Found'>";
						document.getElementById("thumbImg").innerHTML = html;
					}
					$("#" + i).html(o);

				});
			}
		});
	}
	
	function getDetailCust() {
		$.ajax({
			type : "POST",
			url : "${local_server}/spk_data/getspkinfo/${cif}",
			dataType : "json",
			async : true,
			success : function(res) {
				/* $.each(res.data.lender[0], function(i, o) {

					$("#cst_" + i).html(o);

				}); */
				$.each(res.cust_detail[0], function(i, o) {
					$("#" + i).html(o);

				});
			}
		});
	}
	
	function getNamaTarget() {
		$.ajax({
			type : "POST",
			url : "${local_server}/spk_data/getspkinfo/${cif}",
			dataType : "json",
			async : true,
			success : function(res) {
				$.each(res.SPK[0], function(i, o) {
					if (i == "nama") {
						$("#target").html(o);
					}
					
				});
			}
		});
	}
	
	function getDetailEc() {
		$.ajax({
			type : "POST",
			url : "${local_server}/spk_data/getspkinfo/${cif}",
			dataType : "json",
			async : true,
			success : function(res) {
				/* $.each(res.data.lender[0], function(i, o) {

					$("#cst_" + i).html(o);

				}); */
				$.each(res.emergency_contact[0], function(i, o) {
					
					$("#" + i).html(o);

				});
				
				
			}
		});
	}
	
	function getDetailProduct() {
		$.ajax({
			type : "POST",
			url : "${local_server}/spk_data/getspkinfo/${cif}",
			dataType : "json",
			async : true,
			success : function(res) {
				var allProd = res.product_purchase.detail.length;
				if(allProd > 5){
					var difProd = allProd - 5;
					var prod = allProd - difProd;
				}else if(allProd <= 5){
					var prod = allProd;
				}
				
				var html= "";
				
				if(prod != 1){
					for (j=0; j< prod; j++){					
						/* $("#" + i).html(o); */
						html += "<label class='lblSpk' id='item'>"+res.product_purchase.detail[j].item+"</label>";
						html += ", ";
					}
					html += "etc";
				}else if (prod >= 1){
					html += "<label class='lblSpk' id='item'>"+res.product_purchase.detail[0].item+"</label>";
				}
				
				document.getElementById("produk").innerHTML = html;
			}
		});
	}
	
	function runSearch(e) {
	    if (e.keyCode == 13) {
	    	$("#btnSearch")
			.click();
	        return false;
	    }
	}
		
	function editRule(val) {
		window.location.href = "${local_server}/spk_data/det/" + val;
	}
	function spTgl(val) {
		if (val != null) {
			var x = val.split("T");
			var date = x[0];
			var time = x[1];
			return date;
		} else {
			return "";
		}
	}
	
	function gender(val) {
		if (val == "M") {
			return "Laki - laki";
		} else {
			return "Perempuan";
		}
	}
	
	function noAkun(val) {
		var accNo = val;
		var res = accNo.substring(10);
		return res;
		
	}
	
	function toRp(angka) {
		if (angka != null) {
			var angkaPositif = (angka < 0) ? String(angka).replace("-", "")
					: angka;
			var ang = String(angkaPositif).split('.');
			var rev = parseInt(ang[0], 10).toString().split('').reverse().join(
					'');
			var rev2 = '';
			for (var i = 0; i < rev.length; i++) {
				rev2 += rev[i];

				if ((i + 1) % 3 === 0 && i !== (rev.length - 1)) {

					rev2 += ',';

				}
			}

			var x = (angka < 0) ? "-" : "";
			//ang[1] = (ang[1] != null) ? "," + ang[1] : ",00"
			return x + rev2.split('').reverse().join('');
		} else {
			return '0'
		}

	}
	
	function spTgl(val) {
		if (val != null) {
			var x = val.split("T");
			var date = x[0];
			var time = x[1];
			return date;
		} else {
			return "-";
		}
	}
	
	function chkNullBlank(val) {
		if (val == null || val == "") {
			return "-";
		} else {
			return val;
		}
	}

	//end edit
</script>
</html>