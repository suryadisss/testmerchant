<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page='_Header_Gentellela.jsp'>
	<jsp:param name="title" value="Access Level Management Report" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="noityjs" value="1" />
</jsp:include>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">

			<jsp:include page='_Side_Navigation.jsp' />
			<jsp:include page='_Top_Navigation.jsp' />

			<div class="modal fade" id="modalReassignAll" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog " role="document">
				<div class="modal-content">
					<form id="formReassign">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">Rincian Access Level Report</h4>
						</div>
						<div class="modal-body">
							<input type="hidden" id="idNprod" name="idNprod">
							<span class="label label-success">Data terpilih : <b
								class="badge badge-default" id="selecteddt">0</b></span> <input
								type="hidden" name="record" id="record" value="">
								<br>
								<input type="checkbox" id="cceekk" onclick="checkboxx(this.id)"> Saya yakin ingin menyimpan perubahan
								<input type="hidden" id="hidCek" name="flagging" value="">
						
						</div>
						<div class="modal-footer">
							<button class="btn btn-default" data-dismiss="modal">Tutup</button>
							<button type="submit" id="isubmit" class="btn btn-primary" disabled>Simpan perubahan</button>
						</div>
					</form>
				</div>
			</div>
		</div>

			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<!-- <form id="formUnblockApr"> -->
							
							<div class="modal-header">

								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">Access Level Management Report</h4>
							</div>
							<div class="modal-body">
								
								<table id="AppTableDtl" class="display table table-hover table-bordered dt-responsive" width="100%">
						    	<thead>
						    		<tr>
						    			<td><input type="checkbox" class="cekbox" id="cek" />
						    			<input id ='' name ='' value='' type ='hidden'>
						    			</td>
						    			<td>Nama</td>
						    			<td>Deskripsi</td>
						    		</tr>
                  </thead>
                  <tbody id="bodytbl"></tbody>
								</table>
							</div>
							<div class="modal-footer">
							
								<button class="btn btn-default" data-dismiss="modal" onclick="tutupTable()">Tutup</button>
								<!-- <button id="rejectunb" type="button" class="btn btn-warning" onclick="setReject()">Tolak</button> -->
								<button type="submit" id="submitunb" class="btn btn-primary" onclick="simpanPerubahan()">Simpan Perubahan</button>

								<br><br>

							</div>
						
            <!-- </form> -->
					</div>
				</div>
			</div>

			<div class="right_col" role="main">
				<div class="row">
					<div class="col-md-12">
						<div class="x_panel">
							<div class="x_title">
								<h2 id="breadhead"></h2>
								<script type="text/javascript">
									var context = "${local_server}";
									document.getElementById("breadhead").innerHTML = getBread(encodeURI(String(
											window.location.href)
											.split(context)[1]));
								</script>
								<ul class="nav navbar-right panel_toolbox">

								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">


								<table class="display table table-hover" id="tblUnb">
									<thead>
										<tr>
											<td>Nama</td>
											<td>Deskripsi</td>
											<td>Status</td>
											<td>Tindakan</td>
										</tr>
									</thead>
								</table>


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page='_Footer_Note.jsp'></jsp:include>


	</div>
</body>

<jsp:include page='_Footer_Gentellela.jsp'>
	<jsp:param name="title" value="Disbursement" />
	<jsp:param name="datatables" value="1" />
	<jsp:param name="jqueryconfirm" value="1" />
	<jsp:param name="jquerydatepicker" value="1" />
	<jsp:param name="noityjs" value="1" />
</jsp:include>

<script>
	$(document)
			.ready(
					function() {

            // tblBU();
            

						$('#tblUnb')
								.DataTable(
										{
											ajax : {
												url : '${local_server}/access_level_management_product/getlistlevel', 
												type : 'GET'
											},
											columns : [
													{

														data : 'lu_level_name'
														
													},
													{
														data : 'lu_level_description'
													},
													{
														data : 'lu_status' 
													},
													{
														render : function(data,
																type, row) {
															var edit = "";

															edit = '<button class="view btn btn-xs btn-success" id="'+row.u_level_code+'" value="'+row.u_level_code+'" ><i class=" fa fa-edit"></i></button>'; 

															return edit;
														},
														orderable : false
													} ]

										});

						$('#tblUnb').on("click", "button.view", function() {
							$("#myModal").modal("show");
							$("#idNprod").val(this.id);
							unblockTable(this.id);
						});

						$("#formReassign")
						.submit(
								function(e) {
									$
											.confirm({
												title : 'Please Confirm',
												content : 'Are you sure you want to continue this process ?',
												buttons : {
													cancel : function() {
														$
																.alert('Canceled');
													},
													somethingElse : {
														text : 'YES, CONTINUE',
														btnClass : 'btn-green',
														keys : [
																'enter',
																'shift' ],
														action : function() {
															submitFormRassign();
														}
													}
												}
											});

									e.preventDefault()
								});

						// $("#formReassign")
						// 		.submit(
						// 				function(e) {

            //           var t="access_level_management_product/dopost";

				    //           $.ajax({
				    //           	type:"POST",
				    //           	url:t,
				    //           	data:$("#formReassign").serialize(),
				    //           	cache:!1,
				    //           	complete: function(e,t){
				              		
				    //           		if("Error/Failed"!==t&&e.responseText){

            //                 		var n = JSON.parse(e.responseText);
            //                 		console.log("aabsudu");
            //                 		console.log(n);
            //                 		console.log(e);
				    //               		if (n.status == "Success") {
				    //               		$.confirm({
				    //               			title : "",
				    //               			content : "Saved",
				    //               			buttons : {
				    //               				somethingElse : {
				    //               					text : "OK",
				    //               					btnClass : "btn-success",
				    //               					keys : [ "enter" ],
				    //               					action : function() {
				    //               						console.log("test berhasil");
            //                           console.log(n);
            //                           console.log(n.status);
				    //               						 window.location.reload();
				    //               					}
				    //               				}
				    //               			}
				    //               		});
				    //               		} else {
                              			
				    //               			 $.alert("Failed to Save");
				    //               		}
				    //           		}else console.log(t); console.log(e); console.log(e.responseText);
				    //           	}
				    //           }),e.preventDefault()

						// 					// $
						// 					// 		.confirm({
						// 					// 			title : 'Konfirmasi!',
						// 					// 			content : 'Anda yakin ingin menyetujui pencairan ini ?',
						// 					// 			buttons : {
						// 					// 				Batal : function() {
						// 					// 					$
						// 					// 							.alert('Berhasil dibatalkan!');
						// 					// 				},
						// 					// 				somethingElse : {
						// 					// 					text : 'Ya, Setujui',
						// 					// 					btnClass : 'btn-primary',
						// 					// 					keys : [ 'enter' ],
						// 					// 					action : function() {
						// 					// 						setUnblockSub();
						// 					// 					}
						// 					// 				}
						// 					// 			}
						// 					// 		});

						// 					// e.preventDefault();


						// 				});

					});

	function tutupTable(){
		window.location.reload();
	}

	function submitFormRassign() {
		var t = "${local_server}/access_level_management_product/dopost";
		$
				.ajax({
					type : "POST",
					url : t,
					data : $("#formReassign").serialize(),
					cache : !1,
					beforeSend : function() {
						$('button[type=submit]').prop('disabled', false);
					},
					complete : function(e, t) {
						if ("error" !== t && e.responseText) {
							$('button[type=submit]').prop('disabled', true);
							// $("#myModal").modal("hide");
							var n = JSON.parse(e.responseText);
							if (n.status == "Success") {
								$
										.confirm({
											title : "",
											content : n.message,
											buttons : {
												somethingElse : {
													text : "OK",
													btnClass : "btn-success",
													keys : [ "enter" ],
													action : function() {
														console.log("berhasil");
														window.location.reload();
														// $("#tblReassign").DataTable().ajax
														// .reload();
														// $("#modalReassignAll").modal("hide");
														// $("#btn-dis-all").addClass("disabled").prop("disabled",true);
													}
												}
											}
										})
							}
						} else
							console.log(t)
					}
				})
	}

/* 					function simpanPerubahan(){
						$('#myModal').hide();
						$("#formReassign")[0].reset();
						var t = 0;
        if ($.each($(".cekbox:checked"), function(e, n) {
                t++
            }), t > 0) {
            var n = new Array;
            console.log("ini e");
            $("input:checked").each(function() {
            	var checked = $('input:checked').val(); //nambah this biar keambil semua
              	var tes = $('input:checked').prop("checked");
              	console.log(tes);
              	//var checked1 = checked.split(/[\s#.]+/);
              	var checked1 = checked.split("_");
              	var splitName = checked1[0];
              	//var splitFlag = checked1[1];
              	//n = checked;
              	var tar = splitName.toString() + "_true";
              	var ter = splitName.toString() + "_false";
              	if(tes == true){
              		//$('#CB'+checked+'').val(splitName+"_true");
              		//n.push($(this).val());
                    n.push(tar);
              	}else{
              		//$('#CB'+checked+'').val(splitName+"_false");
              		n.push(ter);
              	}
            });
            var x = String(n).replace("on,","").split(",");
            $("#record").val(n)
            $("#selecteddt").text(x.length)
            $("#modalReassignAll").modal("show");
        } else $.alert("Please select the data first!")

					} */
	function simpanPerubahan(){
		$('#myModal').hide();
		//$("#formReassign")[0].reset();
		var t = 0;
        if ($.each($(".cekbox:checked"), function(e, n) {
                t++
            }), t > 0) {
        	 var n = new Array;
             $("input:checked").each(function() {
                 n.push($(this).val())
             });
            var x = String(n).replace("on,","").split(",");
            $("#record").val(n)
            $("#selecteddt").text(x.length)
            $("#modalReassignAll").modal("show");
        } else $.alert("Please select the data first!")

	}

	function setUnblockSub() {
		
		$
				.ajax({
					type : "POST",
					url : "${local_server}/disbursement_batch/approve/disb", 
					data : $( "#formUnblockApr" ).serialize(),
					cache : false,
					beforeSend : function() {
						$("#submitunb").html("<i class='fa fa-circle-o-notch fa-spin'></i>  Processing ..");
						$("#submitunb,#rejectunb").prop("disabled", true);
					},
					complete : function(xhr, status) {
						
						if (status === 'error' || !xhr.responseText) {
							console.log(status);
						} else {
							$("#submitunb").html("Setuju");
							$("#myModal").modal("hide");
							var data = JSON.parse(xhr.responseText);
							if (data.status == "Success") {
								$("#bcl").html("");
								$.confirm({
									title : "Sukses",
									content : "Berhasil disimpan",
									buttons : {
										somethingElse : {
											text : 'OK',
											btnClass : 'btn-success',
											keys : [ 'enter' ],
											action : function() {
												$("#submitunb,#rejectunb").prop("disabled", false);
												$('#tblUnb').DataTable().ajax
														.reload();
											}
										}

									}
								});
							} else {
								$.alert(data.message);
								$("#submitunb,#rejectunb").prop("disabled", false);
							}

						}
					}

				});

	}

	function unblockTable(id){
				var e = $('#AppTableDtl').DataTable({
							ajax: {
								type : 'POST',
								asyn : true,
								url : '${local_server}/access_level_management_product/getlistleveledit/' + id,
								dataType : 'json'
							},
            	order: [[1, 'asc']],
            	columns:[
              {
                render: function(data, type, row) {

		      				if(row.flag == false){
										//return '<input type="checkbox" class="cekbox" name="matrixVal[]" value="'+row.name+'">'
										
								 var ht = "";
		      					 ht += "<input type='checkbox' class='cekbox' name='matrix' id='"+row.name+"' value='"+row.name+"'>";
									
		      					 ht += "<input id ='"+row.name+"' name ='matrixVal' value='' type ='hidden'>";
		      					 return ht;

										
										
										// var ht = "";
            			  console.log("aaaa");
		      					// ht += "<input type='checkbox' name='matrix' id='"+row.name+"' onclick='checkbox(this.id)' value='false'>";
									
		      					// ht += "<input id ='CB"+row.name+"' name ='matrixVal' value='false' type ='hidden'>";
		      					// return ht;
		      				}else{
										//return '<input type="checkbox" class="cekbox" name="matrixVal[]" value="'+row.name+'" checked>'
										
								 var ht = "";
		      					 ht += "<input type='checkbox' class='cekbox' name='matrix' id='"+row.name+"' value='"+row.name+"' checked>";
									
		      					 ht += "<input id ='"+row.name+"' name ='matrixVal' value='' type ='hidden'>";
		      					 return ht;
										
										// var ht ="";
		      					// ht += "<input type='checkbox' name='matrix' id='"+row.name+"' onclick='checkbox(this.id)' value='true' checked>";
									
		      					// ht += "<input id ='CB"+row.name+"' name ='matrixVal' value='true' type ='hidden'>";
										// return ht;
		      				}
                }
              },
              {
                render: function(data, type, row) {
											return  '<td><input id="namaa" name="namaa" value="'+row.name+'" type="hidden"/>'+row.name+'</td>';
								}
              },
              {
            	  data: 'rpthname'
              }
            ]
					});


					var t = new $.fn.dataTable.TableTools(e, {
					        sSwfPath: "",
					        sRowSelector: "td:not(:last-child)",
					        sRowSelect: "multi",
					        sPaginationType: "full_numbers",
					        fnRowSelected: function(e) {
					            try {
					                $(e).find("input[type=checkbox]").get(0).checked = !0;
					                var t = -1;
					                $.each($(".cekbox"), function(e, n) {
					                    t++
					                });
					                var n = 0;
					                $.each($(".cekbox:checked"), function(e, t) {
					                    n++
					                }), t == n && 0 == document.getElementById("cek").checked && (document.getElementById("cek").checked = !0), 0 != n && $("#btn-dis-all").removeClass("disabled").prop("disabled",false)
					            } catch (a) {}
					        },
					        fnRowDeselected: function(e) {
					            try {
					                $(e).find("input[type=checkbox]").get(0).checked = !1;
					                var t = -1;
					                $.each($(".cekbox"), function(e, n) {
					                    t++
					                });
					                var n = 0;
					                $.each($(".cekbox:checked"), function(e, t) {
					                    n++
					                }),
					                0 == n && $("#btn-dis-all").addClass("disabled").prop("disabled",true), t == n && 1 == document.getElementById("cek").checked && (document.getElementById("cek").checked = !1)
					            } catch (a) {}
					        },
					        sSelectedClass: "success"
					    });
					    $("th input[type=checkbox], td input[type=checkbox]").prop("checked", !1), $("#AppTableDtl > thead > tr > td input[type=checkbox]").eq(0).on("click", function() {
					        var e = this.checked,
					            n = 0;
					        $.each($(".cekbox:checked"), function(e, t) {
					            n++
					        }), $(this).closest("table").find("tbody > tr").each(function() {
					            var a = this;
					            e ? (t.fnSelect(a), $("#btn-dis-all").removeClass("disabled").prop("disabled",false)) : (t.fnDeselect(a), n >= 1 && $("#btn-dis-all").addClass("disabled").prop("disabled",true))
					        })
					    });
						
						 $("#AppTableDtl").on("click", "tr td input[type=checkbox]", function() {
							        var e = $(this).closest("tr").get(0),
							            n = 0;
							        $.each($(".cekbox:checked"), function(e, t) {
							            n++
							        });
							        var a = -1;
							        $.each($(".cekbox"), function(e, t) {
							            a++
							        }), this.checked ? (t.fnSelect(e), n > 0 && $("#btn-dis-all").removeClass("disabled").prop("disabled",false), a == n && 0 == document.getElementById("cek").checked && (document.getElementById("cek").checked = !0)) : (t.fnDeselect(e), n > 0 && 1 == document.getElementById("cek").checked && 1 == n && (document.getElementById("cek").checked = !1, $("#btn-dis-all").addClass("disabled").prop("disabled",true)))
							    });




		// $.ajax({
		// 		type : 'POST',
		// 		asyn : true,
		// 		url : '${local_server}/access_level_management_product/getlistleveledit/' + id,
		// 		dataType : 'json',
		// 		success : function(data){
    //       console.log(data);
    //       var obj = $.parseJSON(JSON.stringify(data.data));
    //       console.log(obj);
    //       var pj_length = obj.length;
    //       var count = 0;
    //       console.log(pj_length);
    //       for(count=0; count<pj_length; count++){
    //         if(obj[count].flag = "false"){
    //           console.log("hurray false");
    //           console.log(obj[count].name);

    //         }
    //         else if (obj[count].flag = "true"){
    //           console.log("trueee");
    //         }
    //     	  console.log(obj[count].flag);
    //       }
    //       console.log(data.data[0].flag);


    //       var x = $.parseJSON(JSON.stringify(data.data));
    //       console.log("alohaaa");
		//       console.log(x);
          
		//       var ht = "";
		//       $.each(x, function(i, o) {
		//       	ht += "<tr>";
		//       	ht += "<td><input id='namaa' name='namaa' value='"+o.name+"' type='hidden'/>"+o.name+"</td>";
		//       	if(o.flag == false){
    //           console.log("aaaa");
		//       		ht += "<td>" 
		//       		// ht += "<label class='switch'>";
		//       		ht += "<input type='checkbox' name='matrix' id='"+o.name+"' onclick='checkbox(this.id)' value='false'>";
		//       		// ht += "<span class='slider round'></span>";
		//       		// ht += "</label>";
		//       		ht += "<input id ='CB"+o.name+"' name ='matrixVal' value='false' type ='hidden'>";
		//       		ht += "</td>";
		//       	}else{
		//       		ht += "<td>"
		//       		// ht += "<label class='switch'>";
		//       		ht += "<input type='checkbox' name='matrix' id='"+o.name+"' onclick='checkbox(this.id)' value='true' checked>";
		//       		// ht += "<span class='slider round'></span>";
		//       		// ht += "</label>";
		//       		ht += "<input id ='CB"+o.name+"' name ='matrixVal' value='true' type ='hidden'>";
		//       		ht += "</td>";
		//       	}
		//       	ht += "</tr>";
		//       });
		//       $("#bodytbl").empty().append(ht);			

	}

  // function tblBU(){
	// $.ajax({
  //   type : 'POST',
	// 			asyn : true,
	// 			url : '${local_server}/access_level_management_product/getlistleveledit',
	// 			dataType : 'json',
	// 			success : function(data){
  //         var x = JSON.parse(data);
  //         console.log("aloha");
	// 	      console.log(x);
	// 	      var ht = "";
	// 	      $.each(x.data, function(i, o) {
	// 	      	ht += "<tr>";
	// 	      	ht += "<td><input id='' name='' value='"+o.name+"' type='hidden'/>"+o.name+"</td>";
	// 	      	if(o.flag == false){
  //             console.log("aaaa");
	// 	      		ht += "<td>" 
	// 	      		// ht += "<label class='switch'>";
	// 	      		ht += "<input type='checkbox' name='matrix' id='"+o.name+"' onclick='checkbox(this.id)' value='false'>";
	// 	      		// ht += "<span class='slider round'></span>";
	// 	      		// ht += "</label>";
	// 	      		// ht += "<input id ='"+o.gpt_alias+"_"+o.gpm_location+"_matrixVal' name ='matrixVal' value='true' type ='hidden'>";
	// 	      		ht += "</td>";
	// 	      	}else{
	// 	      		ht += "<td>"
	// 	      		// ht += "<label class='switch'>";
	// 	      		ht += "<input type='checkbox' name='matrix' id='"+o.name+"' onclick='checkbox(this.id)' value='true'>";
	// 	      		// ht += "<span class='slider round'></span>";
	// 	      		// ht += "</label>";
	// 	      		// ht += "<input id ='"+o.gpt_alias+"_"+o.gpm_location+"_matrixVal' name ='matrixVal' value='false' type ='hidden'>";
	// 	      		ht += "</td>";
	// 	      	}
	// 	      	ht += "</tr>";
	// 	      });
	// 	      $("#bodytbl").empty().append(ht);
  //       },
	// 			failure : function(errMsg) {
	// 				alert("call failed");
	// 			}
  //   });
  // }

  function checkboxx(obj){
	  document.getElementById("isubmit").disabled = false;
    console.log("checkbox");
    console.log(obj);
    var nArray = new Array;
  	//var checked = $('#'+obj+':checked').val();
  	
  	var checked = $('#'+obj+':checked').val();
  	var idObj = obj;
  	console.log(idObj);
  	var tes = $('#'+obj+':checked').prop("checked");
  	console.log(tes);
  	if(tes == true){
  		$('#hidCek').val("true");
  	}else{
  		$('#hidCek').val("false");
  	}
  }


  function matrix(obj){
	//var obj = "true";
	var ret = "";
  console.log("haii");
  console.log(obj.name);
  if(obj.flag == false){
    console.log("aaaa");
		ret += "<input type='checkbox' name='matrix' id='"+obj.name+obj.flag+"' onclick='checkbox(this.id)' value='false'>";
    return ret;
	}else{
		ret += "<input type='checkbox' name='matrix' id='"+obj.name+obj.flag+"' onclick='checkbox(this.id)' value='true'>";
    return ret;
	}
	// if(obj == false){
	// 	// ret += '<label class="switch">';
	// 	ret += '<input type="checkbox">';
	// 	// ret += '<span class="slider round"></span>';
	// 	// ret += '</label>';
	// 	return ret;
	// }else{
	// 	// ret += '<label class="switch">';
	// 	ret += '<input type="checkbox">';
	// 	// ret += '<span class="slider round"></span>';
	// 	// ret += '</label>';
	// 	return ret;
	// }
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

  // function disabledCbx() {
  //   document.getElementById("cbxCentang").disabled = true;
  // }
	
	function toRp(angka) {
		if (angka != null) {
			var ang = String(angka).split('.');
			var rev = parseInt(ang[0], 10).toString().split('').reverse().join(
					'');
			var rev2 = '';
			for (var i = 0; i < rev.length; i++) {
				rev2 += rev[i];
				if ((i + 1) % 3 === 0 && i !== (rev.length - 1)) {
					rev2 += ',';
				}
			}
			//ang[1] = (ang[1] != null) ? "," + ang[1] : ",00"
			return '' + rev2.split('').reverse().join('');
		} else {
			return '0'
		}

	}
	
	function productName(obj) {
		if (obj == 'A01') {
			return 'KiniCintaku';
		} else if (obj == 'A02'){
			return 'KiniFlexi';
		}else if (obj=='A03'){
			return 'KiniUsaha';
		}else{
			return 'Undefined';
		}

	}
	
</script>

</html>

