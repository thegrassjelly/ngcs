<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="CreateATAP.aspx.cs" Inherits="NCGDSasp.Admin.ATAP.CreateATAP" enableEventValidation="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
       <asp:ScriptManager runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
		<div class="container-fluid">
			<section class="content-header">
				<h1>
					Create ATAP
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Create ATAP | <asp:Label ID="lblID" runat="server" ></asp:Label></li>
				</ol>
			</section>
			<section class="content">
				<div class="box box-default">
					<div class="box-body">
						<br>
						<div class="row">
				            <div class="col-xs-12">
				              
				                	<div class="col-xs-12 col-sm-6 form-horizontal">
				                		<div class="form-group">
									    	<label class="control-label col-sm-4" for="atapNumber">ATAP Number :</label>
									    	<div class="col-sm-8">
									      		<input type="text" class="form-control" id="atapNumber" value="" placeholder="Ex. 13213133" />
									    	</div>
									  	</div>
									  	<div class="form-group">
									    	<label class="control-label col-sm-4" for="address">Address :</label>
									    	<div class="col-sm-8">
									      		<input type="text" class="form-control" id="address" value="" placeholder="Ex. Cagayan de Oro City, Philippines" />
									    	</div>
									  	</div>
									  	<div class="form-group">
									    	<label class="control-label col-sm-4" for="to">To :</label>
									    	<div class="col-sm-8">
									      		<input type="text" class="form-control" id="to" value="" placeholder="Ex. Dan Walker" />
									    	</div>
									  	</div>
									  	<div class="form-group">
									    	<label class="control-label col-sm-4" for="agency">Paying Agency :</label>
									    	<div class="col-sm-8">
									    		    <asp:DropDownList ID="ddlAgency" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Agency" DataValueField="HomeAgencyID"></asp:DropDownList>
				                                          
				                                               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT * FROM [HomeAgency] where creationStatus='Approved'"></asp:SqlDataSource>
				                                          
									    	</div>
									    </div>
									    <div class="form-group">
									    	<label class="control-label col-sm-4" for="agencyCode">Agency (Area Code) :</label>
									    	<div class="col-sm-8">
									    		<input type="text" class="form-control" id="agencyCode" value="" placeholder="Ex. "/>
									    	</div>
									    </div>
				                	</div>
				                	<div class="col-xs-12 col-sm-6 form-horizontal">
				                		<div class="form-group">
									    	<label class="control-label col-sm-4" for="amountOfBond">Amount of Bond :</label>
									    	<div class="col-sm-8">
									    		<input type="text" class="form-control" id="amountOfBond" runat="server" value="0" placeholder="Ex. 1000" readonly>
									    	</div>
									    </div>
				                		<div class="form-group">
									    	<label class="control-label col-sm-4" for="datePrepared">Date Prepared :</label>
									    	<div class="col-sm-8">
									    		<div class="input-group date">
	                                                <input type="text" class="form-control pull-right" id="datePrepared">
	                                                <div class="input-group-addon">
	                                                    <i class="fa fa-calendar"></i>
	                                                </div>
	                                            </div>
									    	</div>
									    </div>
									    <div class="form-group">
									    	<label class="control-label col-sm-4" for="totalAmountPayable">Total Amount Payable :</label>
									    	<div class="col-sm-8">
									    		<input type="text" class="form-control" id="totalAmountPayable" runat="server" value="0" placeholder="Ex. 1000" readonly/>
									    	</div>
									    </div>
									    <div class="form-group">
									    	<label class="control-label col-sm-4" for="approvedBy">Approved By :</label>
									    	<div class="col-sm-8">
									    		<input type="text" class="form-control" id="approvedBy" placeholder="Ex. Dan Walker" />
									    	</div>
									    </div>
									    <div class="form-group">
									    	<label class="control-label col-sm-4" for="file">Attach Files :</label>
									    	<div class="col-sm-8">
                       		
                                                <asp:FileUpload ID="FileUpload1" class="form-control" runat="server" /><asp:Button ID="btnUpload" runat="server" Text="Button" visible="false" OnClick="btnUpload_Click"/>
				                                      </div>
									    </div>
				                	</div>
				                	<div class="col-xs-12 text-right">
				                		<hr>
				                		<button class="btn btn-sm btn-default bondBtn" type="button">
				                			Compute Bond Premium
				                		</button>
				                		<br>
				                		<br>
				                	</div>
				                	<div class="col-xs-12">
				                		<hr>
				                		<table class="table table-striped table-bordered">
				                			<thead>
				                				<tr>
				                					<th>Name</th>
				                					<th>Position</th>
				                					
				                					<th>Risk No.</th>
				                					<th>Approve Amount in Bond</th>
				                					<th>Bonding Date</th>
				                					<th>Cancelled Date</th>
				                				</tr>
				                			</thead>
				                			<tbody id="main-data">
				                				 <asp:ListView ID="lvFundSource" runat="server" >
                                       
                                                <ItemTemplate>
                                                    <tr>
                                                           <asp:Literal ID="ltCollectionID" runat="server" Text='<%# Eval("atapofficerID") %>' Visible="false" />
                                                    
                                                        <td><%# Eval("officerName") %></td>
                                                         <td><%# Eval("position") %></td>
                                                           <td><%# Eval("riskNumber") %></td>
                                                  
                                                         <td><%# Eval("totalBondPremium","{0: #,###.00}") %></td>
                                                          <td><%# Eval("dateEffectivity","{0:dd/MM/yyyy}") %></td>
                                                          <td><%# Eval("cancellationDate","{0:dd/MM/yyyy}") %></td>
                                                
                                                       
                                    
                                                

                                                    </tr>
                                                </ItemTemplate>
                                                <EmptyDataTemplate>
                                                    <tr>
                                                        <td colspan="10">
                                                            <h2 class="text-center">No records found.</h2>
                                                        </td>
                                                    </tr>
                                                </EmptyDataTemplate>
                                            </asp:ListView>
				                			</tbody>
				                		</table>
				                	</div>
		                            <div class="col-xs-12 text-right">
		                            	<hr>
		                            	<button type="button" class="btn btn-primary" id="addConfirmationButton">Submit for Confirmation </button>
		                            </div>
		                      
				            </div>
				        </div>
					</div>
				</div>
			</section>
		</div>

<div id="referenceModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="referenceModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header bg-primary">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title">Bond Premium Computation</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-xs-12 col-sm-6 form-horizontal">
						<div class="form-group">
					    	<label class="control-label col-sm-5" for="dateEffectivity">Date of Effectivity :</label>
					    	<div class="col-sm-7">
					    		<div class="input-group date">
                                    <input type="text" class="form-control pull-right" id="dateEffectivity">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                </div>
					    	</div>
					  	</div>
					  	<div class="form-group">
					    	<label class="control-label col-sm-5" for="applicationType">Application Type :</label>
					    	<div class="col-sm-7">
					    		<select class="form-control" id="applicationType">
					    			<option disabled="" selected="">-- Select Type --</option>
                                    <option value="New">New</option>
                                    <option value="Renewal">Renewal</option>
                            	</select>
					    	</div>
					    </div>
					</div>
					<div class="col-xs-12 col-sm-6 form-horizontal">
						<div class="form-group">
					    	<label class="control-label col-sm-5" for="riskNumber">Risk Number :</label>
					    	<div class="col-sm-7">
					    		<input type="text" id="riskNumber" class="form-control" value="" placeholder="1231" />
					    	</div>
					    </div>
					</div>
					<div class="col-xs-12">
						<hr>
					    <h5><strong>Officer Information</strong></h5>
					    <hr>
					</div>
					<div class="col-xs-12 col-sm-6 form-horizontal">
					    <div class="form-group">
					    	<label class="control-label col-sm-5" for="officerName">Name of Officer :</label>
					    	<div class="col-sm-7">
					    		<input type="text" class="form-control" id="officerName" placeholder="Ex. Dan Walker" />
					    	</div>
					    </div>
					    <div class="form-group">
					    	<label class="control-label col-sm-5" for="sex">Sex :</label>
					    	<div class="col-sm-7">
					    		<select class="form-control" id="sex">
					    			<option disabled="" selected="">-- Select Gender --</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                            	</select>
					    	</div>
					    </div>
					</div>
					<div class="col-xs-12 col-sm-6 form-horizontal">
					    <div class="form-group">
					    	<label class="control-label col-sm-5" for="position">Position :</label>
					    	<div class="col-sm-7">
					    		<input type="text" class="form-control" id="position" placeholder="Ex. Officer" />
					    	</div>
					    </div>
					    <div class="form-group">
					    	<label class="control-label col-sm-5" for="tin">TIN :</label>
					    	<div class="col-sm-7">
					    		<input type="text" class="form-control" id="tin" placeholder="Ex. 1234567890" />
					    	</div>
					    </div>
					</div>
					<div class="col-xs-12">
						<hr>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th style="width: 20%;">Type of Accountability</th>
									<th style="width: 15%;">Description</th>
									<th style="width: 10%;">Amount of Accountability</th>
									<th style="width: 10%;">Amount of Bond</th>
									<th style="width: 10%;">Bond Premium</th>
									<td class="text-center" style="width: 5%"></td>
								</tr>
							</thead>
							<tbody id="data">
								
							</tbody>
						</table>
						<div class="col-xs-12 text-right">
							<button class="btn btn-sm btn-default" type="button" id="addData">
								<i class="fa fa-plus fa-fw"></i> Add 
							</button>
						</div>
					</div>
					<div class="col-xs-12">
						<hr>
						<div class="col-xs-12 col-sm-8 col-sm-offset-4 form-horizontal">
							<div class="form-group">
						    	<label class="control-label col-sm-5">Existing Bond Premium :</label>
						    	<div class="col-sm-7">
						    		<input type="number" class="form-control" id="existingBondPremium" placeholder="Ex. 1000" />
						    	</div>
						    </div>
						    <div class="form-group">
						    	<label class="control-label col-sm-5">Remaining Number of Days :</label>
						    	<div class="col-sm-7">
						    		<input type="number" class="form-control" id="remainingDays" placeholder="Ex. 120" />
						    	</div>
						    </div>
						    <div class="form-group">
						    	<label class="control-label col-sm-5">Remaining Bond Premium :</label>
						    	<div class="col-sm-7">
						    		<input type="number" class="form-control" id="remainingBondPremium" disabled placeholder="Ex. 1000" />
						    	</div>
						    </div>
						    <br><br>
						    <div class="form-group">
						    	<label class="control-label col-sm-5">Total Bond Premium :</label>
						    	<div class="col-sm-7">
						    		<input type="number" class="form-control" id="totalBondPremium" disabled placeholder="Ex. 1000" />
						    	</div>
						    </div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer text-right">
				<button class="btn btn-primary" id="submitOfficerData" onclick='getOfficers();'>
					Submit
				</button>

			</div>

		</div>
	</div>
</div>
 
 
<script>
 
$(document).ready(function() {

	//var atapId = '<?php echo $_SESSION['cMLIDAtap']; ?>';
    $('#atapNumber').val("<%=lblID.Text%>");
    $('#riskNumber').val("<%=lblID.Text%>");
    $('#datePrepared').datepicker({ autoclose: true, todayHighlight: true, language: 'es' });
    $('#datePrepared').datepicker('update', new Date());

    $('#dateEffectivity').datepicker({ autoclose: true, todayHighlight: true, language: 'es' });
    $('#dateEffectivity').datepicker('update', new Date());

    $(".bondBtn").click(function(){
     	$('#referenceModal').modal('show');
    });

    var cash = [
    	{
    		range: "5001-9000",
    		amount: 0.75,
    		premimum: 150
    	}, 
    	{
    		range: "9001-12000",
    		amount: 9000,
    		premimum: 150
    	}, 
    	{
    		range: "12001-15000",
    		amount: 11250,
    		premimum: 168.75
    	}, 
    	{
    		range: "15001-18000",
    		amount: 13500,
    		premimum: 202.50,
    	},
    	{ 
    		range: "18001-20000",
    		amount: 16750,
    		premimum: 251.25
    	}  
    ];

    var formula = 1;

    $('#existingBondPremium').keyup(function () {
    	var existing = $(this).val();
    	var days = $('#remainingDays').val();
    	var remaining = parseFloat(existing * parseInt(days));
    	$('#remainingBondPremium').val(remaining);
    	calculateTotalBond(remaining);
    });

    $('#remainingDays').keyup(function () {
    	var days = $(this).val();
    	var existing = $('#existingBondPremium').val();
    	var remaining = parseFloat(existing * parseInt(days));
    	$('#remainingBondPremium').val(remaining);
    	calculateTotalBond(remaining);
    });

    $('#addData').click(function() {
    	var data = '<tr class="officer-data" id="data-' + countData() + '">'+
									'<td>'+
										'<select class="form-control acountability">'+
											'<option value="Cash Accountability">Cash Accountability</option>'+
											'<option value="Property Accountability">Property Accountability</option>'+
											'<option value="Accountable Forms">Accountable Forms</option>'+
										'</select>'+
									'</td>'+
									'<td>'+
										'<input type="text" class="form-control description" placeholder="Ex. Description"/>'+
									'</td>'+
									'<td>'+
										'<input type="number" placeholder="Ex. 100" value="0" class="form-control accountability-amount"/>'+
									'</td>'+
									'<td>'+
										'<input type="number" placeholder="Ex. 100" value="0" class="form-control amountBond" disabled=""/>'+
									'</td>'+
									'<td>'+
										'<input type="number" placeholder="Ex. 100" value="0" class="form-control premiumBond" disabled=""/>'+
									'</td>'+
									'<td class="text-center" style="vertical-align: middle;">'+
										'<button class="btn btn-xs btn-danger deleteData">' +
												'<i class="fa fa-trash fa-fw"></i>' +
										'</button>' +
									'</td>'+
								'</tr>';

		$(data).appendTo('#data');
		//selectAccountability();
		computeBond();
		deleteData();
    });

    function calculateTotalBond() {
    	var subTotal = 0;
    	var remaining = $('#remainingBondPremium').val();
    	$('.officer-data').each(function () {
    		subTotal += $(this).find('.premiumBond').val();
    	});

		$('#totalBondPremium').val(subTotal - remaining);    
    }

    function countData() {
    	var total = 0;

    	$('.officer-data').each(function () {
    		total++;
    	});

    	return total + 1;
    }

    function deleteData() {
    	$('.deleteData').click(function () {
    		$(this).closest('tr').remove();
    	});
    }

    //function selectAccountability() {
    //	$('.acountability').change(function() {
    //		if ($(this).val() == 'Cash Accountability') {
    //			formula = 1
    //		} else if ($(this).val() == 'Property Accountability') {
    //			formula = 2
    //		} else {
    //			formula = 3
    //		}
    //	});
    //}

    function computeBond() {
    	var amountBond = 0;
    	var premiumBond = 0;
    	$('.accountability-amount').keyup(function () {
    		var amount = $(this).val();
    		if (formula == 1) {
    			if (amount <= 9000) {
    				amountBond = amount * 0.75;
    				premiumBond = 150;
    			} else {
    				for (var i = 1; i < cash.length; i++) {
	    				var value = cash[i].range.split('-');
	    				var from = 	parseFloat(value[0]);
	    				var to = parseFloat(value[1]);
	    					
	    				if (amount >= from && amount <= to) {
	    					amountBond = cash[i].amount;
	    					premiumBond = cash[i].premimum;
	    					break;
	    				}
	    			}
    			}
    		} else if (formula == 2) {
    			amountBond = amount * 0.3;
    			premiumBond = amount + 0.015;
    		} else {
    			amountBond = amount * 0.1;
    			premiumBond = amount + 0.015;
    		}

    		var row = $(this).closest('tr').attr('id');

    		$('#' + row).find('.amountBond').val(amountBond);
    		$('#' + row).find('.premiumBond').val(premiumBond);
    		calculateTotalBond();
    	});
    }

    $('#submitOfficerData').click(function () {
         var JSONObject  ={ officerData : [] }
      
         $('.officer-data').each(function () {
            
    	    JSONObject.officerData.push({
    	        acountability: $(this).find('.acountability').val(),
    			description: $(this).find('.description').val(),
    			amount: $(this).find('.accountability-amount').val(),
    			bond: $(this).find('.amountBond').val(),
    			premium: $(this).find('.premiumBond').val(),
    		})
    	});

    	var dateEffectivity = $('#dateEffectivity').val();
    	var applicationType = $('#applicationType').val();
    	var riskNumber = $('#riskNumber').val();
    	var officerName = $('#officerName').val();
    	var sex = $('#sex').val();
    	var position = $('#position').val();
    	var tin = $('#tin').val();
    	var existingBond = $('#existingBondPremium').val();
    	var remainingDays = $('#remainingDays').val();
    	var remainingBondPremium = $('#remainingBondPremium').val();
    	var totalBondPremium = $('#totalBondPremium').val();

    	//var params = {
    	//	date_effectivity: dateEffectivity,
    	//	application_type: applicationType,
    	//	risk_number: riskNumber,
    	//	officer_name: officerName,
    	//	sex: sex,
    	//	position: position,
    	//	tin: tin,
    	//	existing_bond: existingBond,
    	//	remaining_days: remainingDays,
    	//	remaining_bond_premium: remainingBondPremium,
    	//	total_bond_premium: totalBondPremium,
    	//	data: officerData
    	//}
    	var ords = [];
    	$('.officer-data').each(function () {
    	    
    	    ords.push({
    	      //  GoodsId: $(this).attr("goodsId"),
    	        //   Amount: $(this).val()

    	        acountability: $(this).find('.acountability').val(),
    	        description: $(this).find('.description').val(),
    	        amount: $(this).find('.accountability-amount').val(),
    	        bond: $(this).find('.amountBond').val(),
    	        premium: $(this).find('.premiumBond').val()
    	    });
    	});
        var data1 = {
            date_effectivity: dateEffectivity,
            application_type: applicationType,
            risk_number: riskNumber,
            officer_name: officerName,
            sex: sex,
            position: position,
            tin: tin,
            existing_bond: existingBond,
            remaining_days: remainingDays,
            remaining_bond_premium: remainingBondPremium,
            total_bond_premium: totalBondPremium,
         
            data: ords
        };
    	$.ajax({
    	   
    	    type: "POST",
    	    url: 'CreateATAP.aspx/SubmitOfficerData',
    	    data: JSON.stringify({
    	        date_effectivity: dateEffectivity,
    	        application_type: applicationType,
    	        risk_number: riskNumber,
    	        officer_name: officerName,
    	        sex: sex,
    	        position: position,
    	        tin: tin,
    	        existing_bond: existingBond,
    	        remaining_days: remainingDays,
    	        remaining_bond_premium: remainingBondPremium,
    	        total_bond_premium: totalBondPremium,

    	        data: ords
    	      
    	    }),
    	    contentType: "application/json; charset=utf-8",
    		dataType: "json",
    		success: function (response) {
    		  
    			$('#data').empty();
    			$('#riskNumber').val();
    			$('#officerName').val();
    			$('#sex').val();
    			$('#position').val();
    			$('#tin').val();
    			$('#existingBondPremium').val(0);
    			$('#remainingDays').val(0);
    			$('#remainingBondPremium').val(0);
    			$('#totalBondPremium').val(0);
    			$('#referenceModal').modal('hide');	
                  

    			var dates = dateEffectivity.split("/");
    			dates[2] = parseInt(dates[2]) + 1;

    			var cacellationDate = dates[0] + '/' + dates[1] + '/' + dates[2];

    			var mainData = '<tr>'+
    								'<td>' + officerName + '</td>'+
    								'<td>' + position + '</td>'+
    								'<td></td>'+
    								'<td>' + atapId + '</td>'+
    								'<td>' + totalBondPremium + '</td>'+
    								'<td>' + dateEffectivity + '</td>'+
    								'<td>' + cacellationDate + '</td>'+
    							'</tr>';

    			$(mainData).appendTo('#main-data');



    			var oldBond = $('#amountOfBond').val();
    			var newBond = parseFloat(oldBond) + parseFloat(totalBondPremium);
    			$('#amountOfBond').val(newBond);
    			var totalPayable = parseFloat(newBond * 0.015).toFixed(2);
    			$('#totalAmountPayable').val(totalPayable);
                var pageId = '<%=  Page.ClientID %>';
    		    __doPostBack(pageId, argumentString);
    		    window.location = response;
    		
    		},
    		error: function (XMLHttpRequest, textStatus, errorThrown) {
    		    debugger;
    	}
    	})

    
    });

    $('#addConfirmationButton').click(function () {
        $('#btnUpload').trigger('click');
    	var atapNo = $('#atapNumber').val();
    	var address = $('#address').val();
    	var to = $('#to').val();
    	var agency = "<%=ddlAgency.SelectedValue%>";
    	var agencyCode = $('#agencyCode').val();
    	var amountOfBond = $('#amountOfBond').val();
    	var datePrepared = $('#datePrepared').val();
    	var totalAmountPayable = $('#totalAmountPayable').val();
    	var approvedBy = $('#approvedBy').val();
    var attachment = "<%=FileUpload1.FileName%>";
 
     

    	$.ajax({
    	    url: "CreateATAP.aspx/SubmitATAP",
			type: "POST",
			data: JSON.stringify({
			    atapNo: atapNo,
			    address: address,
			    to: to,
			    agency:agency,
			    agencyCode: agencyCode,
			    amountOfBond: amountOfBond,
			    datePrepared: datePrepared,
			    totalAmountPayable: totalAmountPayable,
			    approvedBy: approvedBy,
			    attachment: attachment
			}),
			contentType: "application/json; charset=utf-8",
		
           
            dataType: "json",
    
    		success: function () {
    		 
            	window.location.href = "ATAPList.aspx";
            }
        })
    });
});
</script>
</asp:Content>
