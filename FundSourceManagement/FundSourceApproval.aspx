<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="FundSourceApproval.aspx.cs" Inherits="NCGDSasp.Admin.FundSourceManagement.FundSourceApproval" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container-fluid">
      
			<section class="content-header">
				<h1>
					FundSource List
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">FundSource List</li>
				</ol>
			</section>
			<section class="content">
				<div class="box box-default">
					<div class="box-body">
						<div class="row">
				            <div class="col-xs-12">
				                <div class="panel panel-default">
				                    <div class="panel-body">
				                        <div class="col-xs-12" id="manageUserTable">
				                             <table id="example1" class="display table table-bordered table-striped">
                                                        <thead><tr>
                                                            <th>ID</th>
                                                            <th>FundSource</th>
                                                            <th>Department UACS</th>
                                                            <th>Operating Unit Class UACS</th>
                                                             <th>Lower Level Operating Unit Class</th>
                                                                 <th>Remarks</th>
                                                             
                                                                <th></th>
                                                         
                                                            </tr>
                                                            </thead>
                                                        <tbody>
                                            <asp:ListView ID="lvFundSource" runat="server" OnDataBound="lvFundSource_DataBound"
                                                OnPagePropertiesChanging="lvFundSource_PagePropertiesChanging" DataKeyNames="FundSourceID" onItemCommand="lvFundSource_ItemCommand"  >
                                       
                                                <ItemTemplate>
                                                    <tr>
                                                           <asp:Literal ID="ltFundSourceID" runat="server" Text='<%# Eval("FundSourceID") %>' Visible="false" />
                                                    
                                                        <td><%# Eval("FundSourceID") %></td>
                                                         <td><%# Eval("Code") %></td>
                                                         <td><%# Eval("RevenueUACS") %></td>
                                                   <td><%# Eval("Description") %></td>
                                                       
                                                 <td><%# Eval("Remarks") %></td>
                                                          <td>
                                                            <a href='EditFundSource.aspx?ID=<%# Eval("FundSourceID") %>'>
                                                                <asp:Label runat="server" ToolTip="Edit"><i class="fa fa-pencil-square-o"></i></asp:Label></a>
                                                        </td>
                                                         <td>  <asp:LinkButton ID="btnApprove" runat="server"
                                                        CommandName="Approve" ToolTip="Approve">
                                                            <i class="fa fa-check-square-o"></i></asp:LinkButton></td>
                                                  <td>  <asp:LinkButton ID="btnDeny" runat="server"
                                                        CommandName="Disapprove" ToolTip="Disapprove">
                                                            <i class="fa fa-trash-o"></i></asp:LinkButton></td>

                                                       
                                                

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
                                                     <div class="panel-footer">
                                    <center>
                                        <asp:DataPager id="dpFundSource" runat="server" PagedControlID="lvFundSource">
                                            <Fields>
                                                <asp:NumericPagerField Buttontype="Button"
                                                    NumericButtonCssClass="btn btn-default"
                                                    CurrentPageLabelCssClass="btn btn-success"
                                                    NextPreviousButtonCssClass ="btn btn-default" 
                                                    ButtonCount="10"/>
                                            </Fields>
                                        </asp:DataPager>
                                    </center>
				                        </div>
				                        <div class="col-xs-12">
				                            <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </div>
					</div>
				</div>
                
			</section>
      
        <asp:Panel ID="pnlPopup" runat="server"   style='display: none;'>
    
			
					<div class="modal-content">
						<div class="modal-header">
							
							<h4 class="modal-title">Confirmation        ID:<asp:Label ID="lblID" runat="server" Text="Label"></asp:Label></h4>
						</div>
						<div class="modal-body">
							<p>Are you sure you want to continue?</p>
						</div>
						<div class="modal-footer">
						  <asp:Button ID="btnNo" class="btn btn-default " data-dismiss="modal" runat="server" Text="No"  />
						
                            <asp:Button ID="btnYes" class="btn btn-default accept_button" runat="server" Text="Yes" OnClick="btnYes_Click" />
						</div>
					</div>
				
		
            </asp:Panel>
            <cc1:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" PopupControlID="pnlPopup"
        DynamicServicePath="" Enabled="True" TargetControlID="lnkDummy" 
        CancelControlID="btnNo" >
    </cc1:ModalPopupExtender>
			       <asp:Panel ID="pnlReject" runat="server"   style='display: none;'>
    
					<div class="modal-content">
						<div class="modal-header">
							
							<h4 class="modal-title">Reason for Rejection       ID:<asp:Label ID="lblID1" runat="server" Text="Label"></asp:Label></h4>
						</div>
						<div class="modal-body">						
						
								<div class="form-group">
									<div class="col-md-12">
									
                                        <asp:TextBox ID="txtReason" rows="3" class="form-control" runat="server"></asp:TextBox>
									</div>
								</div>
							
						</div>
						<div class="modal-footer">
							
                            	  <asp:Button ID="btnCancel" class="btn btn-default " data-dismiss="modal" runat="server" Text="Cancel"  />
						
                            <asp:Button ID="btnSend" class="btn btn-default reject_button" runat="server" Text="Send" OnClick="Button2_Click" />
					
						</div>
					</div>
			</asp:Panel>
			  <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="pnlReject"
        DynamicServicePath="" Enabled="True" TargetControlID="lnkDummy" 
        CancelControlID="btnCancel" >
    </cc1:ModalPopupExtender>
	

    <script>
        $(document).ready(function () {

            function ShowModalPopup() {
                $find("mpe").show();
                return false;
            }

            $(".confirmationButton").click(function () {
                console.log('confirmation clicked')
                $('#confirmationModal').modal('show');
            });

            $(".rejectButton").click(function () {
                console.log('confirmation clicked')
                $('#rejectModal').modal('show');
            });

            $(".accept_button").click(function () {
                var accept_button = $(this).val()
                console.log(accept_button);

                $.ajax({
                    type: 'POST',
                    url: "../functions/approveFundSource.php",
                    data: 'accept_button=' + accept_button + "&action=approveFundSource",
                    success: function (data) {
                        $('#confirmationModal').modal('hide');
                        showManageFundSource();
                    }
                });

            });

            $(".reject_button").click(function () {
                var reject_button = $(this).val()
                var rejectForm = $("#rejectForm").serialize();
                console.log(reject_button);

                $.ajax({
                    type: 'POST',
                    url: "../functions/approveFundSource.php",
                    data: 'reject_button=' + reject_button + "&" + rejectForm + "&action=rejectFundSource",
                    success: function (data) {
                        $('#rejectModal').modal('hide');
                        showManageFundSource();
                    }
                });

            });

        });
        </script>
	
</asp:Content>
