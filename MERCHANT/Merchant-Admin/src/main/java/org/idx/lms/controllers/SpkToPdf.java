package org.idx.lms.controllers;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.idx.lms.libs.ConfigApps;
import org.idx.lms.libs.FileReader;
import org.idx.lms.libs.RestServiceUnirest;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;

import ch.qos.logback.core.subst.Token;

@Controller
@RequestMapping("spk_pdf")
public class SpkToPdf {

	@Autowired
	ServletContext context;

	private ConfigApps con = new ConfigApps();
	private String SESSION_ID = "";
	private String RSHID = "";
	private String SERVER_PHP = con.getConfigValue("ServerPHP");
	private String API_SERVER_CORE = con.getConfigValue("ServerAPI-CORE");
	private String API_SERVER = con.getConfigValue("ServerAPI");
	private String API_CUSTOMER = con.getConfigValue("ServerAPI-CUST");
	private String API_LMS = con.getConfigValue("ServerAPI-LMS");
	private String API_NOTIF = con.getConfigValue("ServerAPI-NOTIF");
	private String API_REPORT = con.getConfigValue("ServerAPI-REPORT");
	private String LOCAL_SERVER = con.getConfigValue("ServerLocal");
	private String PATH_PDF_SPK = con.getConfigValue("CustomPathUploadSPK");
	private String PATH_PDF = con.getConfigValue("CustomPathUpload");
	private String IMG_SERVER = con.getConfigValue("URL_ACCESS_IMG");
	private String PATH_PDF_URL = con.getConfigValue("PATERN_URL_SP_PDF");
	private String API_IMS = con.getConfigValue("ServerAPI-IMS");
	private String LINK_IMG = con.getConfigValue("Link-IMG");
	private String Link_HEAD = con.getConfigValue("Link-Header");
	private String Link_FOOT = con.getConfigValue("Link-Rahasia");

	String getCurID(String obj) {
		double harga = Double.parseDouble((String) obj);
		DecimalFormat df = (DecimalFormat) DecimalFormat.getCurrencyInstance();
		DecimalFormatSymbols dfs = new DecimalFormatSymbols();
		dfs.setCurrencySymbol("");
		dfs.setMonetaryDecimalSeparator(',');
		dfs.setGroupingSeparator('.');
		df.setDecimalFormatSymbols(dfs);
		String[] as = df.format(harga).split(",");

		return as[0];
	}
	
	String spTgl(String obj) {
		String[] x = obj.split("T");
		return x[0];
	}

	String gender(String obj) {
		if(obj=="M"||obj.equals("M")) {
			return "Laki Laki";
		}else {
			return "Perempuan";
		}
	}
	String getCurID2(String obj) {
		double harga = Double.parseDouble((String) obj);
		DecimalFormat df = (DecimalFormat) DecimalFormat.getCurrencyInstance();
		DecimalFormatSymbols dfs = new DecimalFormatSymbols();
		dfs.setCurrencySymbol("");
		dfs.setMonetaryDecimalSeparator(',');
		dfs.setGroupingSeparator('.');
		df.setDecimalFormatSymbols(dfs);
		String[] as = df.format(harga).split(",");
		if (harga >= 0) {

			return as[0];
		} else {
			return "-" + as[0].toString().replaceAll("\\(", "").replaceAll("\\)", "");
		}

	}

	String cost(String cost) {
		String[] ret = cost.split(";");
		return ret[0];
	}

	private String getHeader(JSONObject jsonSourceHeader, String param) {
		String retn = null;
		// if (!jsonSourceHeader.isNull("data_header")) {
		JSONArray c = jsonSourceHeader.getJSONArray("data_header");
		for (int i = 0; i < c.length(); i++) {
			JSONObject obj = c.getJSONObject(i);

			if (obj.get("rptd_field_name").equals(param)) {
				retn = obj.get("rptd_field_alias").toString();
			}
		}
		// }

		if (retn == null) {
			retn = param;
		}
		return retn;
	}

	@RequestMapping(value = "/createFile/{type}", method = RequestMethod.POST)
	public ResponseEntity<byte[]> createReportXLS(@PathVariable("type") String type, HttpSession session,
			HttpServletRequest request) throws Exception {
		byte[] output = null;

		HttpHeaders responseHeaders = new HttpHeaders();

		String path = context.getRealPath("/WEB-INF/tmp/");
		DateFormat df = new SimpleDateFormat("ddMMyyyy_HHmmss");
		String date = df.format(new Date());

		String session_id = session.getAttribute("session_id").toString();

		String prm_code = request.getParameter("code");
		String prm_condition = request.getParameter("condition");
		if (type.equalsIgnoreCase("xlsx")) {
			JSONObject json = new JSONObject(new RestServiceUnirest().requestPost(this.API_REPORT + "/Viewer/Exec",
					session.getAttribute("accesskey").toString(),
					new JSONObject().put("code", prm_code).put("condition", prm_condition).toString()));

			if (json.getString("status").equals("Success")) {

				if (!json.isNull("data")) {

					String path_file = context.getRealPath("/WEB-INF/tmp/") + session_id + "_" + date
							+ "_tmp_report.xlsx";

					XSSFWorkbook workbook = new XSSFWorkbook();
					XSSFSheet sheet = workbook.createSheet("Report Views");

					int rowNum = 0;
					System.out.println("Creating excel (Report)..");
					int headerCount = 0;

					JSONArray c = json.getJSONArray("data");
					JSONArray d = json.getJSONArray("data_header");

					for (int i = 0; i < c.length(); i++) {

						JSONObject obj = new JSONObject(c.getJSONObject(i).toString());
						int colNum = 0;

						if (i == 0) {
							Row row = sheet.createRow(rowNum++);
							for (int z = 0; z < d.length(); z++) {
								JSONObject objda = d.getJSONObject(z);
								Cell cell = row.createCell(colNum++);
								cell.setCellValue(objda.get("rptd_field_alias").toString());
							}
						}

						colNum = 0;
						Row row = sheet.createRow(rowNum++);
						for (int u = 0; u < d.length(); u++) {
							JSONObject objdt = d.getJSONObject(u);
							String field = objdt.get("rptd_field_name").toString();
							Cell cell = row.createCell(colNum++);
							if (!obj.isNull(field)) {
								cell.setCellValue(obj.get(field).toString());
							} else {
								cell.setCellValue(" ");
							}
						}

					}

					/*
					 * for (String num : lineData) { Row row = sheet.createRow(rowNum++); String[]
					 * numItem = num.split(";"); int colNum = 0; for (Integer i = 0; i <
					 * numItem.length; i++) { Cell cell = row.createCell(colNum++);
					 * cell.setCellValue(numItem[i]);
					 * 
					 * }
					 * 
					 * }
					 */

					try {
						FileOutputStream outputStream = new FileOutputStream(path_file);
						workbook.write(outputStream);
						workbook.close();
						File objFile = new File(path_file);
						output = Files.readAllBytes(objFile.toPath());
						objFile.delete();

						DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd");
						LocalDate localDate = LocalDate.now();

						responseHeaders.set("charset", "utf-8");
						responseHeaders.setContentType(
								MediaType.valueOf("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"));
						responseHeaders.setContentLength(output.length);
						responseHeaders.set("Content-disposition",
								"attachment; filename=reportview_" + dtf.format(localDate) + ".xlsx");

						return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.OK);

					} catch (FileNotFoundException e) {
						return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.NOT_FOUND);
					} catch (IOException e) {
						return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.NOT_FOUND);
					}
				} else {
					return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.NOT_FOUND);
				}

			} else {
				return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.NOT_FOUND);
			}

		} else if (type.equalsIgnoreCase("xls")) {
			return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.NOT_FOUND);
		} else {
			return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.NOT_FOUND);
		}

	}

	@RequestMapping(value = "/spk_out/{cif}", method = RequestMethod.GET)
	public @ResponseBody String pdf_out(@PathVariable("cif") String cif, HttpSession session, HttpServletRequest req) {
		String name ="";
		DateFormat df = new SimpleDateFormat("ddMMyyyy_HHmmss");
		String date = df.format(new Date());
		String pathOrigin = context.getRealPath("/WEB-INF/views/");
		String path = "C:\\\\xampp\\\\htdocs\\\\";
		
		Calendar calendar = Calendar.getInstance(TimeZone.getDefault());
		int day = calendar.get(Calendar.DATE);
		// Note: +1 the month for current month
		int month = calendar.get(Calendar.MONTH);
		int year = calendar.get(Calendar.YEAR);
		String[] bln = { "Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September",
				"Oktober", "November", "Desember" };

		String tglsek = day + " " + bln[month] + " " + year;

		JSONObject jReturn = new JSONObject();

		float left = 30;
		float right = 30;
		float top = 5;
		float bottom = 0;
		Document document = new Document(PageSize.A4, left, right, top, bottom);
		try {

			JSONObject jtemp = new JSONObject(new RestServiceUnirest().requestPost(
					this.API_SERVER + "/Summary/SPK", session.getAttribute("accesskey").toString(),
					new JSONObject().put("acc_no", cif).toString()));
					
			JSONArray jdataspk = jtemp.getJSONArray("SPK");

			if (jdataspk.length() > 0) {

				String agency = session.getAttribute("agency").toString();
				String dateFrom = session.getAttribute("dateFrom").toString();
				String dateTo = session.getAttribute("dateTo").toString();
				
				String no_akun = (!jdataspk.getJSONObject(0).isNull("no_akun"))
						? jdataspk.getJSONObject(0).get("no_akun").toString()
						: "";
				String dpd_bucket = (!jdataspk.getJSONObject(0).isNull("dpd_bucket"))
						? jdataspk.getJSONObject(0).get("dpd_bucket").toString()
						: "-";
				String va_number = (!jdataspk.getJSONObject(0).isNull("va_number"))
						? jdataspk.getJSONObject(0).get("va_number").toString()
						: "-";		
				String sisa_pokok_pinj = (!jdataspk.getJSONObject(0).isNull("sisa_pokok_pinj"))
						? getCurID(jdataspk.getJSONObject(0).get("sisa_pokok_pinj").toString())
						: "0";
				String jml_pinj = (!jdataspk.getJSONObject(0).isNull("jml_pinj")) 
						? getCurID(jdataspk.getJSONObject(0).get("jml_pinj").toString())
						: "0";
				String tenor = (!jdataspk.getJSONObject(0).isNull("tenor"))
						? jdataspk.getJSONObject(0).get("tenor").toString()
						: "0";
				String angs_sdh_dibayar = (!jdataspk.getJSONObject(0).isNull("angs_sdh_dibayar"))
						? jdataspk.getJSONObject(0).get("angs_sdh_dibayar").toString()
						: "";
				String no_kontrak = (!jdataspk.getJSONObject(0).isNull("no_kontrak"))
						? jdataspk.getJSONObject(0).get("no_kontrak").toString()
						: "";

				String nama = (!jdataspk.getJSONObject(0).isNull("nama"))
						? jdataspk.getJSONObject(0).get("nama").toString()
						: "";

				String umur = (!jdataspk.getJSONObject(0).isNull("umur"))
						? jdataspk.getJSONObject(0).get("umur").toString()
						: "";
				String jenis_kelamin = (!jdataspk.getJSONObject(0).isNull("jenis_kelamin"))
						? gender(jdataspk.getJSONObject(0).get("jenis_kelamin").toString())
						: "";
				String hp1 = (!jdataspk.getJSONObject(0).isNull("hp1"))
						? jdataspk.getJSONObject(0).get("hp1").toString()
						: "";
				String tunggakan_angs = (!jdataspk.getJSONObject(0).isNull("tunggakan_angs"))
						?  getCurID(jdataspk.getJSONObject(0).get("tunggakan_angs").toString())
						: "0";
				String angs_pokok = (!jdataspk.getJSONObject(0).isNull("angs_pokok"))
						? getCurID(jdataspk.getJSONObject(0).get("angs_pokok").toString())
						: "0";

				String tot_denda = (!jdataspk.getJSONObject(0).isNull("tot_denda"))
						?  getCurID(jdataspk.getJSONObject(0).get("tot_denda").toString())
						: "0";

				String collection_fee = (!jdataspk.getJSONObject(0).isNull("collection_fee"))
						? getCurID(jdataspk.getJSONObject(0).get("collection_fee").toString())
						: "0";
				String va_number_fee = (!jdataspk.getJSONObject(0).isNull("va_number_fee"))
						? getCurID(jdataspk.getJSONObject(0).get("va_number_fee").toString())
						: "0";
				String tot_last_payment = (!jdataspk.getJSONObject(0).isNull("tot_last_payment"))
						?  getCurID(jdataspk.getJSONObject(0).get("tot_last_payment").toString())
						: "0";
				String tgl_bayar_trakhir = (!jdataspk.getJSONObject(0).isNull("tgl_bayar_trakhir"))
						? spTgl(jdataspk.getJSONObject(0).get("tgl_bayar_trakhir").toString())
						: "-";
				String r_product_name = (!jdataspk.getJSONObject(0).isNull("r_product_name"))
						? jdataspk.getJSONObject(0).get("r_product_name").toString()
						: "";
				String emd_company_name = (!jdataspk.getJSONObject(0).isNull("emd_company_name"))
						? jdataspk.getJSONObject(0).get("emd_company_name").toString()
						: "";
				
				JSONArray jdatacustdet = jtemp.getJSONArray("cust_detail");
				
				String cst_address = (!jdatacustdet.getJSONObject(0).isNull("cst_address"))
						? jdatacustdet.getJSONObject(0).get("cst_address").toString()
						: "";
						
				String cst_work_address = (!jdatacustdet.getJSONObject(0).isNull("cst_work_address"))
						? jdatacustdet.getJSONObject(0).get("cst_work_address").toString()
						: "";
				
				String cst_work_phone_no = (!jdatacustdet.getJSONObject(0).isNull("cst_work_phone_no"))
						? jdatacustdet.getJSONObject(0).get("cst_work_phone_no").toString()
						: "";	
						
				JSONArray jdataEmergCon = jtemp.getJSONArray("emergency_contact");	
				
				int allEc = jdataEmergCon.length();
				String emcname2 ="";
				String emcphone2 = "";
				String emcaddress2 ="";
				String emcconnection2 ="";
				String emcname ="";
				String emcphone = "";
				String emcaddress ="";
				String emcconnection ="";
				if(allEc > 0) {
					emcname = (!jdataEmergCon.getJSONObject(0).isNull("emcname"))
							? jdataEmergCon.getJSONObject(0).get("emcname").toString()
							: "";
						
					emcphone = (!jdataEmergCon.getJSONObject(0).isNull("emcphone"))
							? jdataEmergCon.getJSONObject(0).get("emcphone").toString()
							: "";
					
					emcaddress = (!jdataEmergCon.getJSONObject(0).isNull("emcaddress"))
							? jdataEmergCon.getJSONObject(0).get("emcaddress").toString()
							: "";
							
					emcconnection = (!jdataEmergCon.getJSONObject(0).isNull("emcconnection"))
							? jdataEmergCon.getJSONObject(0).get("emcconnection").toString()
							: "";
				}
							
				if(allEc > 1) {
					emcname2 += (!jdataEmergCon.getJSONObject(1).isNull("emcname"))
								? jdataEmergCon.getJSONObject(1).get("emcname").toString()
								: "";
							
					emcphone2 += (!jdataEmergCon.getJSONObject(1).isNull("emcphone"))
								? jdataEmergCon.getJSONObject(1).get("emcphone").toString()
								: "";
						
					emcaddress2 += (!jdataEmergCon.getJSONObject(1).isNull("emcaddress"))
								? jdataEmergCon.getJSONObject(1).get("emcaddress").toString()
								: "";
								
					emcconnection2 += (!jdataEmergCon.getJSONObject(1).isNull("emcconnection"))
								? jdataEmergCon.getJSONObject(1).get("emcconnection").toString()
								: "";
				}	
				JSONObject jdataProduct = jtemp.getJSONObject("product_purchase");
				JSONArray jdataProductDet = jdataProduct.getJSONArray("detail");
				
				int allProd = jdataProductDet.length();
				String item ="";
				int prod = 0;
				if(allProd > 5) {
					int difProd = allProd - 5;
					prod = allProd - difProd;
					if(prod != 1) {
						for(int j=0; j<prod; j++) {
							item += jdataProductDet.getJSONObject(j).get("item").toString();
							item += ", ";
						}item +="etc";
					}else if (prod >= 1) {
						item += jdataProductDet.getJSONObject(0).get("item").toString();
					}
				}else if (allProd <= 5){
					prod = allProd;
					if(prod != 1) {
						for(int j=0; j<prod; j++) {
							item += jdataProductDet.getJSONObject(j).get("item").toString();
							item += ", ";
						}item +="etc";
					}else if (prod >= 1) {
						item += jdataProductDet.getJSONObject(0).get("item").toString();
					}
				}
				
				
				/*String item = (!jdataProductDet.getJSONObject(0).isNull("item"))
						? jdataProductDet.getJSONObject(0).get("item").toString()
						: "";*/
				
				JSONArray jdataselfie = jtemp.getJSONArray("selfie_branch");
				
				String cst_municipality = (!jdataselfie.getJSONObject(0).isNull("cst_municipality"))
						? jdataselfie.getJSONObject(0).get("cst_municipality").toString()
						: "";
						
				String cst_address_ktp = (!jdataselfie.getJSONObject(0).isNull("cst_address_ktp"))
						? jdataselfie.getJSONObject(0).get("cst_address_ktp").toString()
						: "";
						
				String imgCust = (!jdataselfie.getJSONObject(0).isNull("path"))
						? jdataselfie.getJSONObject(0).get("path").toString()
						: "";

						
					/*float left = 30;
					float right = 30;
					float top = 60;
					float bottom = 0;
					Document document = new Document(PageSize.A4, left, right, top, bottom);*/
					FileReader oFR = new FileReader(pathOrigin + "SuratPerintahKerja.html");
					String content = oFR.getFileValue();
					content = content.replaceAll("\\*no_akun\\*", no_akun).replaceAll("\\*cst_municipality\\*",cst_municipality)
							.replaceAll("\\*header\\*", this.Link_HEAD)
							.replaceAll("\\*footer\\*", this.Link_FOOT)
							.replaceAll("\\*nama\\*", nama)
							.replaceAll("\\*ktp\\*", cst_municipality).replaceAll("\\*no_kontrak\\*", no_kontrak)
							.replaceAll("\\*umur\\*", umur).replaceAll("\\*mob\\*", umur)
							.replaceAll("\\*jenis_kelamin\\*", jenis_kelamin).replaceAll("\\*jml_pinj\\*",jml_pinj)
							.replaceAll("\\*sisa_pokok_pinj\\*", sisa_pokok_pinj)
							.replaceAll("\\*tunggakan_angs\\*", tunggakan_angs).replaceAll("\\*angs_pokok\\*", angs_pokok)
							.replaceAll("\\*tot_denda\\*", tot_denda).replaceAll("\\*collection_fee\\*", collection_fee)
							.replaceAll("\\*va_number_fee\\*", va_number_fee).replaceAll("\\*va_number\\*", va_number)
							.replaceAll("\\*dpd_bucket\\*", dpd_bucket).replaceAll("\\*r_product_name\\*", r_product_name)
							.replaceAll("\\*tenor\\*", tenor).replaceAll("\\*angs_sdh_dibayar\\*",angs_sdh_dibayar)
							.replaceAll("\\*tgl_bayar_trakhir\\*", tgl_bayar_trakhir).replaceAll("\\*tot_last_payment\\*", tot_last_payment)
							.replaceAll("\\*item\\*", item).replaceAll("\\*cst_address\\*", cst_address)
							.replaceAll("\\*cst_address_ktp\\*", cst_address_ktp).replaceAll("\\*hp1\\*", hp1)
							.replaceAll("\\*emd_company_name\\*", emd_company_name)
							.replaceAll("\\*cst_work_address\\*",cst_work_address).replaceAll("\\*imgprofile\\*", imgCust)
							.replaceAll("\\*cst_work_phone_no\\*", cst_work_phone_no).replaceAll("\\*emcname\\*", emcname)
							.replaceAll("\\*emcconnection\\*", emcconnection).replaceAll("\\*emcphone\\*", emcphone)
							.replaceAll("\\*emcaddress\\*", emcaddress).replaceAll("\\*target_agency\\*", agency)
							.replaceAll("\\*date_from\\*", dateFrom).replaceAll("\\*date_to\\*", dateTo)
							.replaceAll("\\*emcname2\\*", emcname2).replaceAll("\\*emcconnection2\\*", emcconnection2)
							.replaceAll("\\*emcphone2\\*", emcphone2).replaceAll("\\*emcaddress2\\*", emcaddress2);
					
					System.out.println(content);
					String file_name = cif + "_" + date + "_surat_perintah_kerja.pdf";
					File flx = new File(/*"C:\\\\xampp\\\\htdocs\\\\"*/ PATH_PDF_SPK + file_name);
					String a = flx.toString();
					String b = a.replace("/var/public/danakini/images", IMG_SERVER);
					OutputStream file = new FileOutputStream(flx); //ini code yang buat pdf kosong ke folder
					PdfWriter writer = PdfWriter.getInstance(document, file); 
					StringBuilder htmlString = new StringBuilder();
					htmlString.append(content);
					document.open();
					InputStream is = new ByteArrayInputStream(htmlString.toString().getBytes());
					XMLWorkerHelper.getInstance().parseXHtml(writer, document, is);
					document.close(); //data di input ke dalam file pdf
					file.close();
					flx.setReadable(true, false);
					flx.setExecutable(true, false);
					flx.setWritable(true, false);
					String pdfURL = /*IMG_SERVER*/path + file_name;
					//testing
					pdfURL = "C:\\xampp\\htdocs\\0000000000220260_22072019_084216_surat_perintah_kerja.pdf";
					File fileOut = new File(PATH_PDF_SPK + file_name);
					
					jReturn = new JSONObject(new RestServiceUnirest().requestPost(
							this.API_SERVER + "/Summary/Download-SPK", session.getAttribute("accesskey").toString(),
							new JSONObject().put("p_userid","a").put("p_path", b).toString()));
							//new JSONObject().put("p_userid","a").put("p_path", flx).toString()));
					
					//jReturn.
					//jReturn.put("success", true).put("message", pdfURL);
					if (jReturn.getString("status").equals("Success")) {
						if (flx.exists()) {
							name = "Success saved PDF file";
						} else {
							name = "Error creating PDF";
						}

					} else {
						name = "Failed to store PDF file";

					}
					
					/*jReturn.put("success", true).put("message", "Success saved PDF file").put("pdf_location",
							img_save);*/
			} else {
				jReturn.put("success", false).put("message", "Can't creating PDF file, Customer Data is Empty");
			}

		} catch (MalformedURLException e) {
			jReturn.put("success", false).put("message", "Can't creating PDF file");

			e.printStackTrace();
		} catch (IOException e) {
			jReturn.put("success", false).put("message", "Can't creating PDF file");
			e.printStackTrace();
		} catch (DocumentException e) {
			jReturn.put("success", false).put("message", "Can't creating PDF file");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jReturn.toString();

	}

	@RequestMapping(value = "{id}", method = RequestMethod.GET)
	public @ResponseBody String dashboard(@PathVariable("id") String id, HttpSession session, HttpServletRequest req) {
		String name = "";
		DateFormat df = new SimpleDateFormat("ddMMyyyy_HHmmss");
		String date = df.format(new Date());
		String path = context.getRealPath("/WEB-INF/views/");

		Calendar calendar = Calendar.getInstance(TimeZone.getDefault());
		int day = calendar.get(Calendar.DATE);
		// Note: +1 the month for current month
		int month = calendar.get(Calendar.MONTH);
		int year = calendar.get(Calendar.YEAR);
		String[] bln = { "Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September",
				"Oktober", "November", "Desember" };

		String tglsek = day + " " + bln[month] + " " + year;

		try {

			JSONObject jtemp = new JSONObject(new RestServiceUnirest().requestPost(
					this.API_SERVER + "/rproduct/selectbyid", session.getAttribute("accesskey").toString(),
					new JSONObject().put("rsh_id", id).toString()));

			JSONArray jdata = jtemp.getJSONArray("data");

			String cst_fname = (!jdata.getJSONObject(0).isNull("cst_fname"))
					? jdata.getJSONObject(0).get("cst_fname").toString()
					: "";
			String cst_lname = (!jdata.getJSONObject(0).isNull("cst_lname"))
					? jdata.getJSONObject(0).get("cst_lname").toString()
					: "";
			String cst_ktp = (!jdata.getJSONObject(0).isNull("cst_ktp"))
					? jdata.getJSONObject(0).get("cst_ktp").toString()
					: "";
			String cst_age = (!jdata.getJSONObject(0).isNull("age")) ? jdata.getJSONObject(0).get("age").toString()
					: "";
			String cst_phone_mobile = (!jdata.getJSONObject(0).isNull("cst_phone_mobile"))
					? jdata.getJSONObject(0).get("cst_phone_mobile").toString()
					: "";
			String cst_email = (!jdata.getJSONObject(0).isNull("cst_email"))
					? jdata.getJSONObject(0).get("cst_email").toString()
					: "";
			String ads_field_1 = (!jdata.getJSONObject(0).isNull("ads_field_1"))
					? jdata.getJSONObject(0).get("ads_field_1").toString()
					: "";

			String ads_field_3 = (!jdata.getJSONObject(0).isNull("ads_field_3"))
					? jdata.getJSONObject(0).get("ads_field_3").toString()
					: "";

			String va_number = (!jdata.getJSONObject(0).isNull("va_number"))
					? jdata.getJSONObject(0).get("va_number").toString()
					: "";
			String branch_name = (!jdata.getJSONObject(0).isNull("branch_name"))
					? jdata.getJSONObject(0).get("branch_name").toString()
					: "";
			String r_amount = (!jdata.getJSONObject(0).isNull("r_amount"))
					? getCurID(jdata.getJSONObject(0).get("r_amount").toString())
					: "";
			String r_amount_double = (!jdata.getJSONObject(0).isNull("r_amount"))
					? jdata.getJSONObject(0).get("r_amount").toString()
					: "";
			String do_paid = (!jdata.getJSONObject(0).isNull("dp_paid"))
					? getCurID(jdata.getJSONObject(0).get("dp_paid").toString())
					: "";

			String do_paid_double = (!jdata.getJSONObject(0).isNull("dp_paid"))
					? jdata.getJSONObject(0).get("dp_paid").toString()
					: "";

			String r_purpose = (!jdata.getJSONObject(0).isNull("r_purpose"))
					? getCurID(jdata.getJSONObject(0).get("r_purpose").toString())
					: "";
			String cost_onetime_value = (!jdata.getJSONObject(0).isNull("cost_onetime_value"))
					//? getCurID(cost(jdata.getJSONObject(0).get("cost_onetime_value").toString()))
					? getCurID(jdata.getJSONObject(0).get("cost_onetime_value").toString())
					: "0";
			String cost_onetime_value_double = (!jdata.getJSONObject(0).isNull("cost_onetime_value"))
					//? cost(jdata.getJSONObject(0).get("cost_onetime_value").toString())
					? jdata.getJSONObject(0).get("cost_onetime_value").toString()
					: "0";
			String r_tenor = (!jdata.getJSONObject(0).isNull("r_tenor"))
					? jdata.getJSONObject(0).get("r_tenor").toString()
					: "";
			String interest_amount_promo = (!jdata.getJSONObject(0).isNull("interest_amount_promo"))
					? jdata.getJSONObject(0).get("interest_amount_promo").toString()
					: "";
			String interest_calc = (!jdata.getJSONObject(0).isNull("interest_calc"))
					? jdata.getJSONObject(0).get("interest_calc").toString()
					: "";
			String cost_monthly_value = (!jdata.getJSONObject(0).isNull("cost_monthly_value"))
					? getCurID(cost(jdata.getJSONObject(0).get("cost_monthly_value").toString()))
					: "";
			String r_installment = (!jdata.getJSONObject(0).isNull("r_installment"))
					? getCurID(jdata.getJSONObject(0).get("r_installment").toString())
					: "";
			String c_pic_img = (!jdata.getJSONObject(0).isNull("c_pic_img"))
					? jdata.getJSONObject(0).get("c_pic_img").toString()
					: "";
					
			String trx_name = (!jdata.getJSONObject(0).isNull("trx_name"))
					? jdata.getJSONObject(0).get("trx_name").toString()
					: "";
				//	String trx_name = jdata.getJSONObject(0).getString("trx_name").toString();
					
			double denda = (!jdata.getJSONObject(0).isNull("r_installment"))
					? Double.parseDouble(jdata.getJSONObject(0).get("r_installment").toString())
					: 0;
			double pen_val = (!jdata.getJSONObject(0).isNull("penalty_value"))
					? Double.parseDouble(jdata.getJSONObject(0).get("penalty_value").toString())
					: 0;					
			
			//denda = denda * 0.001;
			denda = denda * pen_val / 100;
			double nilai_tunai = (Double.parseDouble(do_paid_double) + Double.parseDouble(cost_onetime_value_double));

			double nilai_merchant = Double.parseDouble(r_amount_double) - nilai_tunai;
			
			
			
			String booking_code = (!jdata.getJSONObject(0).isNull("booking_code"))
					? jdata.getJSONObject(0).get("booking_code").toString()
					: "";

			JSONObject jProduk = new JSONObject(new RestServiceUnirest().requestPost(
					this.API_SERVER + "/ProductPurchase/GetProduct", session.getAttribute("accesskey").toString(),
					new JSONObject().put("bookingcode", booking_code)
							.put("branchcode", session.getAttribute("branchcode").toString()).toString()));

			JSONArray jRproduk = jProduk.getJSONObject("data").getJSONArray("detail");
			String cat_produk = "";

			ArrayList<String> arrCat = new ArrayList<String>();

			int result = 0;
			for (int i = 0; i < jRproduk.length(); i++) {
				JSONObject obj = jRproduk.getJSONObject(i);
				String x = obj.getString("category");
				if (!arrCat.contains(x)) {
					arrCat.add(x);
				}
				result += obj.getInt("amount");

			}
			int j = 0;
			for (int i = 0; i < arrCat.size(); i++) {

				if (i == (arrCat.size() - 1)) {
					cat_produk += arrCat.get(i);
				} else {
					cat_produk += arrCat.get(i) + ", <br/>";
				}
				/*if (j == 3) {
					cat_produk += "<br/>";
					j = 0;
				}*/
				j++;

			}
			// cat_produk += "Helo word, Hahah";
			/*
			 * int result = 0; for (int i = 0; i < jRproduk.length(); i++) { JSONObject obj
			 * = jRproduk.getJSONObject(i); if (i == (jRproduk.length() - 1)) { cat_produk
			 * += obj.getString("category"); } else { cat_produk +=
			 * obj.getString("category") + ", "; } result += obj.getInt("amount");
			 * 
			 * }
			 */
			
			double install = (!jdata.getJSONObject(0).isNull("r_installment"))
					? Double.parseDouble(jdata.getJSONObject(0).get("r_installment").toString())
					: 0;
			install = install + 5000;

			JSONObject jParse = new JSONObject(new RestServiceUnirest().requestGet(
					this.API_SERVER + "/parse/history/" + id, session.getAttribute("accesskey").toString()));

			JSONArray jDparse = jParse.getJSONArray("data");
			String rsh_date = (!jDparse.getJSONObject(0).isNull("rsh_date"))
					? jDparse.getJSONObject(0).get("rsh_date").toString()
					: "";

			File filex = new File(PATH_PDF + getNameFile(ads_field_3));
			if (filex.exists()) {
				filex.delete();
			}
			float left = 30;
			float right = 30;
			float top = 60;
			float bottom = 0;
			Document document = new Document(PageSize.A4, left, right, top, bottom);
			FileReader oFR = new FileReader(path + "template_print_sp_head.html");
			String content = oFR.getFileValue();
			content = content.replaceAll("\\*nama\\*", cst_fname + " " + cst_lname)
					.replaceAll("\\*base_url\\*", this.LOCAL_SERVER + req.getContextPath())
					.replaceAll("\\*ktp\\*", cst_ktp).replaceAll("\\*email\\*", cst_email)
					.replaceAll("\\*umur\\*", cst_age).replaceAll("\\*mob\\*", cst_phone_mobile)
					.replaceAll("\\*total\\*", r_amount).replaceAll("\\*uang_muka\\*", do_paid)
					.replaceAll("\\*pinjaman\\*", r_purpose).replaceAll("\\*biaya_proses\\*", cost_onetime_value)
					.replaceAll("\\*biaya_as\\*", "0").replaceAll("\\*biaya_pen\\*", "0")
					.replaceAll("\\*tenor\\*", r_tenor).replaceAll("\\*suku_b1\\*", interest_amount_promo)
					.replaceAll("\\*suku_b2\\*", interest_calc).replaceAll("\\*admin\\*", cost_monthly_value)
					.replaceAll("\\*install\\*", getCurID(install + "")).replaceAll("\\*denda\\*", getCurID("" + denda))
					.replaceAll("\\*nama_toko\\*", branch_name).replaceAll("\\*tanggal_pembelian\\*", tglsek)
					.replaceAll("\\*produk\\*", cat_produk).replaceAll("\\*tempat\\*", ads_field_1)
					.replaceAll("\\*img_profil\\*", c_pic_img).replaceAll("\\*date_py\\*", rsh_date)
					.replaceAll("\\*nilai_merchant\\*", getCurID(nilai_merchant + ""))
					.replaceAll("\\*pt\\*", trx_name)
					.replaceAll("\\*nilai_tunai\\*", getCurID(nilai_tunai + "")).replaceAll("\\*no_va\\*", va_number)
					.replaceAll("\\*no_kontrak\\*", va_number.substring(5));
			System.out.println(content);
			String file_name = id + "_" + date + "_surat_pernyataan.pdf";
			File flx = new File(PATH_PDF + file_name);
			OutputStream file = new FileOutputStream(flx);
			PdfWriter writer = PdfWriter.getInstance(document, file);
			StringBuilder htmlString = new StringBuilder();
			htmlString.append(content);
			document.open();
			InputStream is = new ByteArrayInputStream(htmlString.toString().getBytes());
			XMLWorkerHelper.getInstance().parseXHtml(writer, document, is);
			document.close();
			file.close();
			flx.setReadable(true, false);
			flx.setExecutable(true, false);
			flx.setWritable(true, false);
			String img_save = IMG_SERVER + PATH_PDF_URL + file_name;
			JSONObject json = new JSONObject(new RestServiceUnirest().requestPost(
					this.API_SERVER + "/kinicintaku/update", session.getAttribute("accesskey").toString(),
					new JSONObject().put("rsh_id", Integer.parseInt(id)).put("ads_field_3", img_save).toString()));

			File fileOut = new File(PATH_PDF + file_name);
			if (json.getString("status").equals("Success")) {
				if (fileOut.exists()) {
					name = "Success saved PDF file";
				} else {
					name = "Error creating PDF";
				}

			} else {
				name = "Failed to store PDF file";

			}

			System.out.println("PDF Created!");

		} catch (MalformedURLException e) {
			name = "Error creating PDF";
			e.printStackTrace();
		} catch (IOException e) {
			name = "Error creating PDF";
			e.printStackTrace();
		} catch (DocumentException e) {
			name = "Error creating PDF";
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return name;

	}

	@RequestMapping(value = "/download/filename/{id}.pdf", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getDownloadData2(@PathVariable("id") String id, HttpSession session,
			HttpServletRequest request) throws Exception {

		byte[] output = null;

		HttpHeaders responseHeaders = new HttpHeaders();

		String path_file = PATH_PDF + id;// context.getRealPath("/WEB-INF/tmp/") + this.SESSION_ID + "_" +
											// "tmp_billing.xlsx";

		try {
			File objFile = new File(path_file + ".pdf");
			if (objFile.exists()) {
				output = Files.readAllBytes(objFile.toPath());

				responseHeaders.set("charset", "utf-8");
				responseHeaders.setContentType(MediaType.valueOf("application/pdf"));
				responseHeaders.setContentLength(output.length);
				responseHeaders.set("Content-disposition", "attachment; filename=" + id + ".pdf");

				return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.OK);

			} else {
				return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.NOT_FOUND);

			}
		} catch (FileNotFoundException e) {
			return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.NOT_FOUND);
		} catch (IOException e) {
			return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.NOT_FOUND);
		}

	}

	private String getNameFile(Object nameFile) {
		String[] nama;
		if (nameFile != null && nameFile != "") {
			nama = nameFile.toString().split("/");
			return nama[nama.length - 1].toString();
		} else {
			return "";
		}

	}

	private String getInitialName(String name) {
		Pattern p = Pattern.compile("((^| )[A-Za-z])");
		Matcher m = p.matcher(name);
		String initials = "";
		while (m.find()) {
			initials += m.group().trim();
		}
		return initials.toUpperCase();
	}

	@RequestMapping(value = "/download/{id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getDownloadData(@PathVariable("id") String id, HttpSession session,
			HttpServletRequest request) throws Exception {

		byte[] output = null;

		HttpHeaders responseHeaders = new HttpHeaders();

		JSONObject json = new JSONObject(new RestServiceUnirest().requestPost(this.API_SERVER + "/kinicintaku/ttable",
				session.getAttribute("accesskey").toString(), new JSONObject().put("rsh_id", id).toString()));

		if (json.getString("status").equals("Success")) {
			if (!json.isNull("data")) {
				JSONArray jdata = json.getJSONArray("data");

				String ads_field_3 = (!jdata.getJSONObject(0).isNull("ads_field_3"))
						? jdata.getJSONObject(0).get("ads_field_3").toString()
						: "";

				String path_file = PATH_PDF + getNameFile(ads_field_3);// context.getRealPath("/WEB-INF/tmp/") +
																		// this.SESSION_ID +
				// "_" + "tmp_billing.xlsx";

				try {
					File objFile = new File(path_file);
					output = Files.readAllBytes(objFile.toPath());

					responseHeaders.set("charset", "utf-8");
					responseHeaders.setContentType(MediaType.valueOf("application/pdf"));
					responseHeaders.setContentLength(output.length);
					responseHeaders.set("Content-disposition", "attachment; filename=" + getNameFile(ads_field_3) + "");

					return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.OK);

				} catch (FileNotFoundException e) {
					return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.NOT_FOUND);
				} catch (IOException e) {
					return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.NOT_FOUND);
				}
			} else {
				return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.NOT_FOUND);
			}

		} else {
			return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.NOT_FOUND);
		}

	}

	@RequestMapping(value = "/monthly_statement/{id}", method = RequestMethod.POST)
	public ResponseEntity<byte[]> monthly_statement(@PathVariable("id") String id, HttpSession session,
			HttpServletRequest req) throws Exception {

		String decode = new String(Base64.decodeBase64(id));
		String prm_month = req.getParameter("monthid");
		String[] arr_month = prm_month.split("/");
		int monthid = Integer.parseInt(arr_month[0]);
		int yearid = Integer.parseInt(arr_month[1]);
		HttpHeaders responseHeaders = new HttpHeaders();
		byte[] output = null;

		String name = "";
		DateFormat df = new SimpleDateFormat("ddMMyyyy_HHmmss");
		String date = df.format(new Date());
		String path_template = context.getRealPath("/WEB-INF/views/");
		String path_temp = context.getRealPath("/WEB-INF/tmp/");

		Calendar calendar = Calendar.getInstance(TimeZone.getDefault());
		int day = calendar.get(Calendar.DATE);
		// Note: +1 the month for current month
		int month = calendar.get(Calendar.MONTH);
		int year = calendar.get(Calendar.YEAR);
		String[] bln = { "Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September",
				"Oktober", "November", "Desember" };

		String tglsek = day + " " + bln[month] + " " + year;

		try {

			float left = 30;
			float right = 30;
			float top = 60;
			float bottom = 100;
			Document document = new Document(PageSize.LETTER, left, right, top, bottom);
			FileReader oFR = new FileReader(path_template + "template_pdf_monthly_statement.html");
			String content = oFR.getFileValue();

			String file_name = id + "_tmp_" + date + "_monthly_statement.pdf";
			File flx = new File(path_temp + file_name);

			if (!flx.exists()) {

				JSONObject jParse = new JSONObject(
						new RestServiceUnirest().requestPost(this.API_IMS + "/v1.0/Market/MonthlyStatement",
								session.getAttribute("accesskey").toString(), new JSONObject().put("cif_lender", decode)
										.put("month", monthid).put("year", yearid).toString()));

				JSONArray data = jParse.getJSONArray("data");

				StringBuffer renderTable = new StringBuffer();
				renderTable.append("<table style=\"font-size: 8pt;\" width=\"100%\" cellspacing=0 cellpadding=5>");
				renderTable.append(
						"<thead><tr style=\"background-color: #c7c9cc;\"><td width=\"3%\">No</td><td width=\"15%\">Tanggal</td><td>Jenis Transaksi</td><td>Catatan</td><td align=\"right\">Amount</td><td align=\"right\">Balance</td></tr></thead>");
				renderTable.append("<tbody>");
				int no = 1;
				int count = 0;
				int countx = 0;
				for (int i = 0; i < data.length(); i++) {
					JSONObject obj = data.getJSONObject(i);

					String color = (i % 2 == 0) ? "#eaf0f9" : "#dae3f2";
					String date_transaction = (!obj.isNull("date_transaction")) ? obj.getString("date_transaction")
							: "";
					String desc_info = (!obj.isNull("desc_info")) ? obj.getString("desc_info") : "";
					String notes = (!obj.isNull("notes")) ? obj.getString("notes") : "";

					renderTable.append("<tr style=\"background-color: " + color + ";\">");
					renderTable.append("<td align=\"right\" valign=\"top\">" + no + "</td>");
					no++;
					renderTable.append("<td valign=\"top\">" + date_transaction.replaceAll("T", " ") + "</td>");
					renderTable.append("<td valign=\"top\">" + desc_info + "</td>");
					renderTable.append("<td valign=\"top\">" + notes + "</td>");
					renderTable.append(
							"<td align=\"right\" valign=\"top\">" + getCurID2(obj.get("amount").toString()) + "</td>");
					renderTable.append("<td  align=\"right\" valign=\"top\">" + getCurID2(obj.get("balance").toString())
							+ "</td>");
					renderTable.append("</tr>");
					count++;
					countx++;

					if (countx == 37 || count == 33) {
						renderTable.append("</tbody>");
						renderTable.append("</table>");
						renderTable.append("<p class=\"page-break\"></p>");
						renderTable
								.append("<table style=\"font-size: 8pt;\" width=\"100%\" cellspacing=0 cellpadding=5>");
						renderTable.append(
								"<thead><tr style=\"background-color: #c7c9cc;\"><td width=\"3%\">No</td><td width=\"15%\">Tanggal</td><td>Jenis Transaksi</td><td>Catatan</td><td align=\"right\">Amount</td><td align=\"right\">Balance</td></tr></thead>");
						renderTable.append("<tbody>");

						countx = 0;
					}

					/*
					 * if() { renderTable.append("</tbody>"); renderTable.append("</table>");
					 * renderTable.append("<p class=\"page-break\"></p>"); renderTable.
					 * append("<table style=\"font-size: 8pt;\" width=\"100%\" cellspacing=0 cellpadding=5>"
					 * ); renderTable.
					 * append("<thead><tr style=\"background-color: #c7c9cc;\"><td>No</td><td>Tanggal</td><td>Jenis Transaksi</td><td>Catatan</td><td align=\"right\">Amount</td><td align=\"right\">Balance</td></tr></thead>"
					 * ); renderTable.append("<tbody>"); countx =0; }
					 */

				}
				renderTable.append("</tbody>");
				renderTable.append("</table>");
				JSONArray summary = jParse.getJSONArray("summary");
				renderTable.append("&nbsp;");
				renderTable.append("<table style=\"font-size: 8pt;\" width=\"40%\" cellspacing=0 cellpadding=5>");
				renderTable.append(
						"<thead><tr style=\"background-color: #c7c9cc;\"><td>Keterangan</td><td align=\"right\">Jumlah</td></tr></thead>");
				renderTable.append("<tbody>");

				JSONObject obj = summary.getJSONObject(0);

				renderTable.append(
						"<tr style=\"background-color: #eaf0f9;\"><td valign=\"top\">Saldo Awal</td><td align=\"right\" valign=\"top\">"
								+ getCurID2( obj.isNull("start_balance")? "0": obj.get("start_balance").toString())+ "</td></tr>");
				renderTable.append(
						"<tr style=\"background-color: #dae3f2;\"><td valign=\"top\">Mutasi Kredit</td><td align=\"right\" valign=\"top\">"
								+ getCurID2(obj.isNull("kredit")? "0":obj.get("kredit").toString()) + "</td></tr>");
				renderTable.append(
						"<tr style=\"background-color: #eaf0f9;\"><td valign=\"top\">Mutasi Debit</td><td align=\"right\" valign=\"top\">"
								+ getCurID2(obj.isNull("debit")? "0":obj.get("debit").toString()) + "</td></tr>");
				renderTable.append(
						"<tr style=\"background-color: #dae3f2;\"><td valign=\"top\">Saldo Akhir</td><td align=\"right\" valign=\"top\">"
								+ getCurID2(obj.isNull("end_balance")? "0":obj.get("end_balance").toString()) + "</td></tr>");

				renderTable.append("</tbody>");
				renderTable.append("</table>");

				content = content.replaceAll("\\*table_statement\\*", renderTable.toString()).replaceAll("\\*bulan\\*",
						bln[monthid - 1]);

				OutputStream file = new FileOutputStream(flx);
				PdfWriter writer = PdfWriter.getInstance(document, file);
				StringBuilder htmlString = new StringBuilder();
				htmlString.append(content);

				document.open();
				InputStream is = new ByteArrayInputStream(htmlString.toString().getBytes());
				XMLWorkerHelper.getInstance().parseXHtml(writer, document, is);
				document.close();
				file.close();
				flx.setReadable(true, false);
				flx.setExecutable(true, false);
				flx.setWritable(true, false);

				output = Files.readAllBytes(flx.toPath());

				flx.delete();

				responseHeaders.set("charset", "utf-8");
				responseHeaders.setContentType(MediaType.valueOf("application/pdf"));
				responseHeaders.setContentLength(output.length);
				responseHeaders.set("Content-disposition", "attachment; filename=monthly_statement.pdf");

				return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.OK);

			} else {
				flx.delete();
				return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.EXPECTATION_FAILED);

			}

		} catch (MalformedURLException e) {

			return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.EXPECTATION_FAILED);

		} catch (IOException e) {
			return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.EXPECTATION_FAILED);

		} catch (DocumentException e) {
			return new ResponseEntity<byte[]>(output, responseHeaders, HttpStatus.EXPECTATION_FAILED);

		}

	}
	
	
	

}
