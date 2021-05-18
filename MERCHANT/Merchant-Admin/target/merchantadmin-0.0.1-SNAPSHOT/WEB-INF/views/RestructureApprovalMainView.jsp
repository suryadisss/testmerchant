<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib
uri="http://www.springframework.org/tags/form" prefix="form"%> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="_Header_Gentellela.jsp">
  <jsp:param name="title" value="Approval Restructure" />
  <jsp:param name="datatables" value="1" />
  <jsp:param name="jqueryconfirm" value="1" />
</jsp:include>
<body class="nav-md">
  <div class="container body">
    <div class="main_container">
      <jsp:include page="_Side_Navigation.jsp" />
      <jsp:include page="_Top_Navigation.jsp" />

      <div
        class="modal fade"
        id="myModal"
        tabindex="-1"
        role="dialog"
        aria-labelledby="myModalLabel"
        style="z-index: 9999;"
      >
        <div class="modal-dialog modal-lg" role="document">
          <input type="hidden" name="new_edit_status" id="new_edit_status" />
          <input type="hidden" name="accNO" id="accNO" />
          <input type="hidden" name="tot" id="tot" />
          <div class="modal-content">
            <div class="modal-header">
              <button
                type="button"
                class="close"
                data-dismiss="modal"
                aria-label="Close"
              >
                <span aria-hidden="true">&times;</span>
              </button>
              <h4 class="modal-title" id="myModalLabel">Rincian</h4>
            </div>
            <div class="modal-body">
              <div id="detailPayment"></div>
            </div>
            <div class="modal-footer">
              <button class="btn btn-default" data-dismiss="modal">
                Tutup
              </button>
              <button type="button" id="btnTSetuju" class="btn btn-danger">
                Decline
              </button>
              <button type="button" id="approve" class="btn btn-primary">
                Setujui
              </button>
            </div>
          </div>
        </div>
      </div>

      <div class="right_col" role="main">
        <div class="row">
          <div class="col-xs-12 col-sm-12 col-lg-12">
            <div class="x_panel">
              <div class="x_title">
                <h2 id="breadhead"></h2>
                <script type="text/javascript">
                  var context = "${local_server}";
                  document.getElementById("breadhead").innerHTML = getBread(
                    encodeURI(String(window.location.href).split(context)[1])
                  );
                </script>
                <div class="clearfix"></div>
              </div>
              <div class="x_content">
                <table id="ManPay_Table" class="table table-hover" width="100%">
                  <thead>
                    <tr>
                      <td>Acc No</td>
                      <td>Nama</td>
                      <td>Cif</td>
                      <td>Amount</td>
                      <td>Created Date</td>
                      <td>Due Date</td>
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

    <jsp:include page="_Footer_Note.jsp"></jsp:include>
  </div>
</body>
<jsp:include page="_Footer_Gentellela.jsp">
  <jsp:param name="datatables" value="1" />
  <jsp:param name="validate" value="1" />
  <jsp:param name="jqueryconfirm" value="1" />
</jsp:include>

<script>
  function generateDatatables() {
    var e = $.ajax({
        type: "GET",
        url: "${local_server}/restructure/getApprovalRestructure",
        async: !1,
        success: function (e) {
          console.log(e);
        },
      }).responseText,
      t = JSON.parse(e),
      n = [],
      a = 0;
    return (
      (t.success = !0) &&
        (console.log(t),
        $.each(t.data, function (e, t) {
          var c = new Object();
          $.each(t.loan, function (e, t) {
            //c.ptm_pay_no = null != t.ptm_pay_no ? t.ptm_pay_no : "",
            (c.rpy_acc_no = null != t.rpy_acc_no ? t.rpy_acc_no : ""),
              (c.rpy_total_paid_amt =
                null != t.rpy_total_paid_amt ? t.rpy_total_paid_amt : ""),
              (c.rpy_total_waive_amt =
                null != t.rpy_total_waive_amt ? t.rpy_total_waive_amt : ""),
              (c.rpy_created_date =
                null != t.rpy_created_date ? t.rpy_created_date : ""),
              (c.rpy_cif = null != t.rpy_cif ? t.rpy_cif : ""),
              //c.loan_prd_code = null != t.loan_prd_code ? t.loan_prd_code : "",
              (c.rpy_amount = null != t.rpy_amount ? t.rpy_amount : "");
          }),
            $.each(t.profile, function (e, t) {
              (c.cst_cif = null != t.cst_cif ? t.cst_cif : ""),
                (c.cst_email = null != t.cst_email ? t.cst_email : ""),
                (c.cst_nik = null != t.cst_nik ? t.cst_nik : ""),
                (c.cst_spv_nik = null != t.cst_spv_nik ? t.cst_spv_nik : ""),
                (c.cst_fname = null != t.cst_fname ? t.cst_fname : ""),
                (c.cst_lname = null != t.cst_lname ? t.cst_lname : "");
            }),
            (n[a] = c),
            a++;
        })),
      n
    );
  }

  function checkExists(e) {
    var t = !1;
    return $(e).length && (t = !0), t;
  }

  function convertDateAPI(val) {
    if (val != null && val != "") {
      var monthNames = [
        "Januari",
        "Februari",
        "Maret",
        "April",
        "Mei",
        "Juni",
        "Juli",
        "Agustus",
        "September",
        "Oktober",
        "November",
        "Desember",
      ];
      var value = new Date(val.replace(/(\d{2})-(\d{2})-(\d{4})/, "$2/$1/$3"));
      var tgl = value.getDate();
      var bln = value.getMonth(); //+1;
      var thn = value.getFullYear();
      var dat = tgl + " " + monthNames[bln] + " " + thn;
      return dat;
    } else {
      return "";
    }
  }

  function toRp(e) {
    if ("null" == e) return "-";
    for (
      var t = parseInt(e, 10).toString().split("").reverse().join(""),
        n = "",
        a = 0;
      a < t.length;
      a++
    )
      (n += t[a]), (a + 1) % 3 === 0 && a !== t.length - 1 && (n += ",");
    return "" + n.split("").reverse().join("");
  }

  $(document).ready(function () {
    $.ajax({
      type: "GET",
      url: "${local_server}/restructure/getApprovalRestructure",
      async: !1,
      success: function (e) {
        console.log(e);
        console.log(e.data);
        $("#ManPay_Table").DataTable({
          data: e.data,
          order: [[5, "desc"]],
          lengthMenu: [
            [10, 25, 50, 100, 200, 300, -1],
            [10, 25, 50, 100, 200, 300, "All"],
          ],
          columns: [
            {
              data: "rst_acc_no",
              render: function (e, t, n) {
                return n.rst_acc_no;
              },
            },

            {
              data: "cust_name",
              render: function (e, t, n) {
                return n.cust_name;
              },
            },
            {
              data: "rst_cif",
              render: function (e, t, n) {
                return n.rst_cif;
              },
            },
            {
              data: "rst_amount",
              className: "txtRigth",
              render: function (e, t, n) {
                return toRp(n.rst_amount);
              },
            },
            {
              data: "rst_created_date",
              className: "txtRigth",
              render: function (e, t, n) {
                var edit = "";

                var a = n.rst_created_date.toString();
                var b = a.substring(0, 10);
                edit += b;
                return edit;
              },
            },
            {
              data: "rst_due_date",
              className: "txtRigth",
              render: function (e, t, n) {
                var edit = "";

                var a = n.rst_due_date.toString();
                var b = a.substring(0, 10);
                edit += b;
                return edit;
              },
            },
            {
              data: "rst_pay_status",
              render: function (e, t, n) {
                return n.rst_pay_status;
              },
            },
            {
              render: function (e, t, n) {
                var a =
                  '<button class="edit btn btn-xs btn-success" id="' +
                  n.rst_acc_no +
                  '" value="' +
                  n.rst_acc_no +
                  '" ><i class=" fa fa-edit"></i></button>';
                return a;
              },
              orderable: !1,
            },
          ],
        });
      },
    });

    $("#ManPay_Table").on("click", "button.edit", function (e) {
      $("#myModal").modal("show");
      getDetailRepayment(this.id);
      $("#accNO").val(this.id);
    });

    $("#approve").on("click", function () {
      var d = {};
      d["accNO"] = $("#accNO").val();
      d["total"] = $("#tot").val();
      $.ajax({
        type: "POST",
        url: "${local_server}/restructure/ManualApprove",
        data: d,
        async: true,
        beforeSend: function () {
          $("#approve").prop("disabled",true);
          $("#approve").html(
            "<i class='fa fa-circle-o-notch fa-spin'></i>  Please wait .."
          );
        },
        success: function (res) {
          console.log(res);
          if (res.status == "Success") {
            $.confirm({
              title: "Success",
              content: "Data Telah Di Setujui.",
              buttons: {
                somethingElse: {
                  text: "OK",
                  btnClass: "btn-success",
                  keys: ["enter"],
                  action: function () {
                    console.log("berhasil");
                    console.log(res.status, "status res");
                    location.reload();
                  },
                },
              },
            });
          } else {
            $.alert(res.message);
            $("#btnSave").html("Save");
            $("#btnSave").removeClass("disabled");
            $("#btnCancel").removeClass("disabled");
            $("button[type=submit]").prop("disabled", false);
            return false;
          }
        },
      });
    });

    $("#btnTSetuju").on("click", function () {
      var d = {};
      d["accNO"] = $("#accNO").val();
      d["total"] = $("#tot").val();
      $.ajax({
        type: "POST",
        url: "${local_server}/restructure/ManualDecline",
        data: d,
        async: true,
        success: function (res) {
          console.log(res);
          if (res.status == "Success") {
            $.confirm({
              title: "Success",
              content: "Data Telah Dibatalkan.",
              buttons: {
                somethingElse: {
                  text: "OK",
                  btnClass: "btn-success",
                  keys: ["enter"],
                  action: function () {
                    console.log("berhasil decline");
                    console.log(res.status, "status res");
                    location.reload();
                  },
                },
              },
            });
          } else {
            $.alert(res.message);
            $("#btnSave").html("Save");
            $("#btnSave").removeClass("disabled");
            $("#btnCancel").removeClass("disabled");
            $("button[type=submit]").prop("disabled", false);
            return false;
          }
        },
      });
    });

    function getDetailRepayment(e) {
      $.ajax({
        type: "POST",
        url: "${local_server}/restructure/getDetailRestructure",
        data: "accNO=" + e,
        async: true,
        success: function (e) {
          console.log("getDetailRepayment");
          console.log(e);
          generateDetailPayment(e);
        },
      });
    }

    function generateDetailPayment(obj) {
      var html = "";
      var total = 0;

      if (typeof obj.data != "undefined") {
        for (var n = 0; n < obj.data.data_header.length; n++) {
          html += '<fieldset style="padding:10px" class="scheduler-border">';

          html += '<div class="form-inline pull-left">';
          html += '<div class="form-group mx-sm-5">';
          html += "<label><strong>Acc No Restructure</strong></label>";
          html +=
            "<label><strong> : " +
            obj.data.data_header[n].rst_acc_no +
            "</strong></label>";
          html += "</div><br>";
          html += '<div class="form-group mx-sm-5">';
          html += "<label><strong>Tenor Before Restructure</strong></label>";
          html +=
            "<label><strong> : " +
            obj.data.data_header[n].rst_tenor_before +
            "</strong></label>";
          html += "</div><br>";
          html += '<div class="form-group mx-sm-5">';
          html += "<label><strong>Bunga Before Restructure</strong></label>";
          html +=
            "<label><strong> : " +
            obj.data.data_header[n].rst_interest_before +
            " %</strong></label>";
          html += "</div><br>";
          html += '<div class="form-group mx-sm-5">';
          html += "<label><strong>Tenor After Restructure</strong></label>";
          html +=
            "<label><strong> : " +
            obj.data.data_header[n].rst_tenor_after +
            "</strong></label>";
          html += "</div><br>";
          html += '<div class="form-group mx-sm-5">';
          html += "<label><strong>Bunga After Restructure</strong></label>";
          html +=
            "<label><strong> : " +
            obj.data.data_header[n].rst_interest_after +
            " %</strong></label>";
          html += "</div><br>";
          html += '<div class="form-group mx-sm-5">';
          html += "<label><strong>Jumlah Pembayaran Goodwill</strong></label>";
          html +=
            "<label><strong> : " +
            toRp(obj.data.data_header[n].rst_goodwill) +
            "</strong></label>";
          html += "</div>";
          html += "</div>";

          html += "</fieldset>";

          html +=
            '<table id="tbl' +
            i +
            '" class="table table-hover table-bordered" width="100%">';
          html += "<thead>";
          html += '<tr align="center">';
          html += '<th scope="col">Deskripsi</th>';
          html += '<th scope="col">Tagihan</th>';
          html += '<th scope="col">Good Will</th>';
          html += '<th scope="col">Waiving</th>';
          html += '<th scope="col">Restructure</th>';
          html += "</tr>";
          html += "</thead>";

          for (var i = 0; i < obj.data.data_allocate.length; i++) {
            html += "<tbody>";

            html += "<tr>";
            html +=
              '<td width="20%">' +
              obj.data.data_allocate[i].pcm_description +
              "</td>";
            html +=
              '<td width="20%">' +
              toRp(obj.data.data_allocate[i].rta_amount) +
              "</td>";
            html +=
              '<td width="20%">' +
              toRp(obj.data.data_allocate[i].rta_goodwill_amt) +
              "</td>";
            html +=
              '<td width="20%">' +
              toRp(obj.data.data_allocate[i].rta_waive_amt) +
              "</td>";
            html +=
              '<td width="20%">' +
              toRp(obj.data.data_allocate[i].rta_restructure_amt) +
              "</td>";
            html += "</tr>";
          }

          html += "</tbody>";
          html += "<tfoot>";
          html += "<tr>";
          html += "<td><strong>TOTAL</strong></td>";
          html +=
            '<td><strong><span style="float:left">Rp </span><span style="float:right">' +
            toRp(obj.data.data_header[n].rst_amount) +
            "</span></strong></td>";
          html +=
            '<td><strong><span style="float:left">Rp </span><span style="float:right">' +
            toRp(obj.data.data_header[n].rst_goodwill) +
            "</span></strong></td>";
          if (obj.data.data_header[n].rst_total_waive_amt == null) {
            html +=
              '<td><strong><span style="float:left">Rp </span><span style="float:right">0</span></strong></td>';
          } else {
            html +=
              '<td><strong><span style="float:left">Rp </span><span style="float:right">' +
              toRp(obj.data.data_header[n].rst_total_waive_amt) +
              "</span></strong></td>";
          }

          html +=
            '<td><strong><span style="float:left">Rp </span><span style="float:right">' +
            toRp(obj.data.data_header[n].rst_plafond_restructure) +
            "</span></strong></td>";
          html += "</tr>";
          html += "</tfoot>";
          html += "</table>";

          html += '<div class="row">';
          html += '<div class="col-md-4">';
          html += '<table width="100%">';
          html += "<tr>";
          html += "<td><strong>Old Loan Principal</strong></td>";
          html += "<td> : </td>";

          var pemOldLP =
            (obj.data.data_header[n].rst_old_loan_principal /
              obj.data.data_header[n].rst_plafond_restructure) *
            100;
          var toStringOldLP = pemOldLP.toString();
          var substrOldLP = toStringOldLP.substring(0, 5);
          var perOldLP = substrOldLP;

          html +=
            '<td><strong><span style="float:left">Rp</span><span style="float:right">' +
            toRp(obj.data.data_header[n].rst_old_loan_principal) +
            " (" +
            perOldLP +
            "%)</span></strong></td>";
          html += "</tr>";
          html += "<tr>";
          html += "<td><strong>Restructure Principal</strong></td>";
          html += "<td> : </td>";

          var pemResP =
            (obj.data.data_header[n].rst_restructure_principal /
              obj.data.data_header[n].rst_plafond_restructure) *
            100;
          var toStringResP = pemResP.toString();
          var substrResP = toStringResP.substring(0, 5);
          var perResP = substrResP;

          html +=
            '<td><strong><span style="float:left">Rp</span><span style="float:right">' +
            toRp(obj.data.data_header[n].rst_restructure_principal) +
            " (" +
            perResP +
            "%)</span></strong></td>";

          html += "</tr>";
          html += "</table>";
          html += "</div>";
          html += "</div>";
          html +=
            '</br><table id="tbl' +
            i +
            '" class="table table-hover table-bordered" width="100%">';
          html += "<thead>";
          html += '<tr align="center">';
          html += '<th scope="col">Cicilan ke</th>';
          //html += '<th scope="col">Bunga/ Bulan</th>';
          html += '<th scope="col">Installment</th>';
          html += '<th scope="col">Pokok</th>';
          html += '<th scope="col">Bunga</th>';
          html += '<th scope="col">Outstanding</th>';
          html += '<th scope="col">Pokok Lama</th>';
          html += '<th scope="col">Bunga Lama</th>';
          html += '<th scope="col">Statement Date</th>';
          html += '<th scope="col">Due Date</th>';
          html += "</tr>";
          html += "</thead>";

          if (obj.data.data_installment.length != 0) {
            for (var i = 0; i < obj.data.data_installment.length; i++) {
              html += "<tbody>";

              html += "<tr>";
              html +=
                '<td width="5%">' +
                obj.data.data_installment[i].rni_month +
                "</td>";
              html +=
                '<td width="10%">' +
                toRp(obj.data.data_installment[i].rni_installment) +
                "</td>";
              html +=
                '<td width="10%">' +
                toRp(obj.data.data_installment[i].rni_principal) +
                "</td>";
              html +=
                '<td width="10%">' +
                toRp(obj.data.data_installment[i].rni_interest) +
                "</td>";
              html +=
                '<td width="10%">' +
                toRp(obj.data.data_installment[i].rni_outstanding_balance) +
                "</td>";
              html +=
                '<td width="10%">' +
                toRp(obj.data.data_installment[i].rni_old_principal) +
                "</td>";
              html +=
                '<td width="10%">' +
                toRp(obj.data.data_installment[i].rni_old_interest) +
                "</td>";

              var aa = obj.data.data_installment[
                i
              ].rni_installment_date.toString();
              var bb = aa.substring(0, 10);
              html += '<td width="13%">' + bb + "</td>";

              var aaa = obj.data.data_installment[i].rni_due_date.toString();
              var bbb = aaa.substring(0, 10);
              html += '<td width="12%">' + bbb + "</td>";
              var a = obj.data.data_installment[i].rni_interest_pct;
              var b = a.toString();
              var c = b.substring(0, 4);
              var d = b.substring(0, 5);
              var e = (d * 100).toString();
              var f = e.substring(0, 3);
              //html += '<td width="10%">' + f + "%" + "</td>";

              html += "</tr>";

              html += "</tbody>";
            }

            html += "</table>";
          } else {
            html += "<table>There is no data.</table>";
          }

          //   html +=
          //     '<table id="simulation_table" class="table table-hover" width="100%">';
          //   html += "	<thead>";
          //   html += "		<tr>";
          //   html += '			<td width="20%">Outstanding</td>';
          //   html += '			<td width="20%">Bunga/ Bulan</td>';
          //   html += '			<td width="10%">Pokok</td>';
          //   html += '			<td width="10%">Bunga</td>';
          //   html += '			<td width="10%">Installment</td>';
          //   html += '			<td width="10%">Pokok Lama</td>';
          //   html += '			<td width="10%">Bunga Lama</td>';
          //   html += '			<td width="5%">Periode</td>';
          //   html += '			<td width="10%">Statement</td>';
          //   html += '			<td width="10%">Due</td>';
          //   html += "		</tr>";
          //   html += "	</thead>";
          //   html += "</table>";

          // console.log(obj.data.data_installment,"aa");

          //   $("#simulation_table").dataTable({
          //     //data: $.parseJSON(JSON.stringify(obj.data.data_installment)),
          //     data: obj.data.data_installment,
          //     scrollX: true,
          //     order: [[8, "asc"]],
          //     columns: [
          //       {
          //         data: "rni_outstanding_balance",
          //         orderable: false,
          //         render: function (data, type, row) {
          //         	console.log(data, "ini data");
          //         	console.log(row, "ini row");

          //           var edit = "";
          //           edit += toRp(row.rni_outstanding_balance);
          //           return edit;
          //         },
          //       },
          //       {
          //         data: "rni_interest_pct",
          //         orderable: false,
          //         render: function (data, type, row) {
          //           var a = row.rni_interest_pct;
          //           var b = a.toString();
          //           var c = b.substring(0, 4);

          //           var d = b.substring(0, 5);

          //           var e = (d * 100).toString();
          //           var f = e.substring(0, 3);

          //           console.log(d, "d");

          //           var edit = "";
          //           edit += f + "%";
          //           return edit;
          //         },
          //       },
          //       {
          //         data: "rni_principal",
          //         orderable: false,
          //         render: function (data, type, row) {
          //           var edit = "";
          //           edit += toRp(row.rni_principal);
          //           return edit;
          //         },
          //       },
          //       {
          //         data: "rni_interest",
          //         orderable: false,
          //         render: function (data, type, row) {
          //           var edit = "";
          //           edit += toRp(row.rni_interest);
          //           return edit;
          //         },
          //       },
          //       {
          //         data: "rni_installment",
          //         orderable: false,
          //         render: function (data, type, row) {
          //           var edit = "";
          //           edit += toRp(row.rni_installment);
          //           return edit;
          //         },
          //       },

          //       {
          //         data: "rni_old_principal",
          //         orderable: false,
          //         render: function (data, type, row) {
          //           var edit = "";
          //           edit += toRp(row.rni_old_principal);
          //           return edit;
          //         },
          //       },
          //       {
          //         data: "rni_old_interest",
          //         orderable: false,
          //         render: function (data, type, row) {
          //           var edit = "";

          //           edit += toRp(row.rni_old_interest);
          //           return edit;
          //         },
          //       },
          //       {
          //         data: "rni_periode",
          //         orderable: false,
          //         render: function (data, type, row) {
          //           var edit = "";
          //           edit += row.rni_periode;
          //           return edit;
          //         },
          //       },
          //       {
          //         data: "rni_installment_date",
          //         orderable: false,
          //         render: function (data, type, row) {
          //           var edit = "";

          //           var a = row.rni_installment_date.toString();
          //           var b = a.substring(0, 9);
          //           edit += b;
          //           return edit;
          //         },
          //       },
          //       {
          //         data: "rni_due_date",
          //         orderable: false,
          //         render: function (data, type, row) {
          //           var edit = "";

          //           var a = row.rni_due_date.toString();
          //           var b = a.substring(0, 9);
          //           edit += b;
          //           return edit;
          //         },
          //       },
          //     ],
          //   });
        }

        $("#tot").val(total);
        $("#detailPayment").empty();
        $("#detailPayment").append(html);
      } else {
        $.alert(obj.message);
      }
    }
  });
</script>
