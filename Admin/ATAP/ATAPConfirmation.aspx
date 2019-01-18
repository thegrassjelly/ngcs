<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="ATAPConfirmation.aspx.cs" Inherits="NCGDSasp.Admin.ATAP.ATAPConfirmation" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container-fluid">
			<section class="content-header">
				<h1>
					ATAP for Confirmation
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">ATAP for Confirmation</li>
				</ol>
			</section>
			<section class="content">
				<div class="box box-default">
					<div class="box-body">
						<br>
						<div class="row">
				            <div class="col-xs-12" id="manageATAPConfirmTable">
				                  <table class="table table-striped table-bordered">
			                			<thead>
			                				<tr>
			                					<th>ID</th>
			                					<th>ATAP Number</th>
			                					<th>Paying Agency</th>
			                					<th>Agency Code</th>
			                					<th>Amount of Bond</th>
			                					<th>Amount Payable</th>
                                                <th>Action</th>
                                                </tr>
			                			</thead>
			                			<tbody id="atap-data">
			                				<asp:ListView ID="lvFundSource" runat="server" OnDataBound="lvFundSource_DataBound"
                                                OnPagePropertiesChanging="lvFundSource_PagePropertiesChanging" DataKeyNames="ATAPID" OnItemCommand="lvFundSource_ItemCommand"   >
                                       
                                                <ItemTemplate>
                                                    <tr>
                                                           <asp:Literal ID="ltATAPID" runat="server" Text='<%# Eval("ATAPID") %>' Visible="false" />
                                                     <td><%# Eval("ATAPID") %></td>
                                                        <td><%# Eval("ATAPNo") %></td>
                                                        <td><%# Eval("Agency") %></td>
                                                       <td><%# Eval("AgencyCode") %></td>
                                                       <td><%# Eval("AmountOfBond") %></td>
                                                      <td><%# Eval("TotalAmountPayable") %></td>
                                             
                                                  
                                                  
                                                           <td>
      
                                                               <asp:LinkButton ID="btnViewDetails" runat="server" class="btn btn-default  " text="View Details"
                                                         ToolTip="View Details" CommandName="viewdetails" >
                                                        </asp:LinkButton>

                                                      <asp:LinkButton ID="btnSendBack" runat="server" class="btn btn-default label-warning" text="Send Back" 
                                                        CommandName="SendBack" ToolTip="Send Back">
                                                        </asp:LinkButton>
                                                     
                                                <asp:LinkButton ID="btnConfirm" runat="server" class="btn btn-default label-warning confirmedButton" text="Confirm" 
                                                        CommandName="Confirm" ToolTip="Confirm">
                                                        </asp:LinkButton>
                                                       </td>

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
	                        <div class="col-xs-12">
	                            <div class="pull-right">
								</div>
	                        </div>
				        </div>
					</div>
				</div>
			</section>
			<div class="modal fade" id="confirmationModal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Confirmation</h4>
						</div>
						<div class="modal-body">
							<p>Are you sure you want to continue?</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
							<button type="button" class="btn btn-default confirmed_button" id="confirmed_button" name="confirmed_button">Yes</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="rejectModal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Reason for Rejection</h4>
						</div>
						<div class="modal-body">						
							<form class="form-horizontal" role="form" name="rejectForm" id="rejectForm">
								<div class="form-group">
									<div class="col-md-12">
										<textarea class="form-control" rows="3" id="cRemarks" name="cRemarks"></textarea>
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-default send_back_button" id="send_back_button" name="send_back_button">Send</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
    <script>
$(document).ready(function() {

    function showManageATAPConfirm(){
            $.ajax({
                    type:"post",
                    url:"../functions/showManageAtapConfirm.php",
                    data:"action=showManageATAPConfirm",
                    success:function(data){
                            $("#manageATAPConfirmTable").html(data);
                            //console.log('Ran showUsers');
                    }
            });
    }
    showManageATAPConfirm();
	
    $(".confirmedButton").click(function () {
        e.preventDefault();
    	console.log('confirmation clicked')
     	$('#confirmationModal').modal('show');
    });
	
	$(".sendBackButton").click(function(){
    	console.log('confirmation clicked')
     	$('#rejectModal').modal('show');
    });
	
	$(".confirmed_button").click(function(){
        var confirmed_button = $(this).val()
        console.log( confirmed_button );

        $.ajax({
            type:'POST',
            url:"../functions/confirmATAP.php",
            data:'confirmed_button='+confirmed_button+"&action=approveATAP",
            success: function(data)
            {
            	$('#confirmationModal').modal('hide');
                showManageATAPConfirm();
            }
        });
        
    });
	
	$(".send_back_button").click(function(){
        var send_back_button = $(this).val()
        var rejectForm = $("#rejectForm").serialize();
        console.log( send_back_button );

        $.ajax({
            type:'POST',
            url:"../functions/confirmATAP.php",
            data:'send_back_button='+send_back_button+"&"+rejectForm+"&action=disApproveATAP",
            success: function(data)
            {
                $('#rejectModal').modal('hide');
                showManageLdcConfirm();
            }
        });
        
    });
});
</script>
</asp:Content>
