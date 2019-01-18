<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="ATAPList.aspx.cs" Inherits="NCGDSasp.Admin.ATAP.ATAPList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
			<section class="content-header">
				<h1>
					ATAP List
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">ATAP List</li>
				</ol>
			</section>
			<section class="content">
				<div class="box box-default">
					<div class="box-body">
						<div class="row">
				            <div class="col-xs-12">
				                <div class="panel panel-default">
				                    <div class="panel-body">
				                    
                        		<div class="col-xs-12 text-right">
                        			<br>
                    			
                              	</div>
                        
                            
                            <hr>
                   
				                        <div class="col-xs-12" id="manageMasterlistCollectionTable">
				                                  <div class="panel-body">
				                        <div class="col-xs-12" id="manageUserTable">
				                             <table id="example1" class="display table table-bordered table-striped">
                                                        <thead><tr>
                                                            <th>ID</th>
                                                            <th>ATAP Number</th>
                                                            <th>Agency</th>
                                                            <th>Amount of Bond</th>
                                                             <th>Amount Payable</th>
                                                                 <th>Action</th>
                                                             
                                                               
                                                         
                                                            </tr>
                                                            </thead>
                                                        <tbody>
                                            <asp:ListView ID="lvFundSource" runat="server" OnDataBound="lvFundSource_DataBound"
                                                OnPagePropertiesChanging="lvFundSource_PagePropertiesChanging" DataKeyNames="ATAPID" OnItemCommand="lvFundSource_ItemCommand"   >
                                       
                                                <ItemTemplate>
                                                    <tr>
                                                           <asp:Literal ID="ltATAPID" runat="server" Text='<%# Eval("ATAPID") %>' Visible="false" />
                                                     <td><%# Eval("ATAPID") %></td>
                                                        <td><%# Eval("ATAPNo") %></td>
                                                        <td><%# Eval("Agency") %></td>
                                                         <td><%# Eval("AmountOfBond","{0: #,###.00}") %></td>
                                                           <td><%# Eval("TotalAmountPayable","{0: #,###.00}") %></td>
                                                         
                                                  
                                                           <td>
                                                         
                                                             
                                                         
                                                               
                                                               <asp:LinkButton ID="btnViewDetails" runat="server" class="btn btn-default " text="View Details"
                                                         ToolTip="View Details" CommandName="viewdetails" >
                                                        </asp:LinkButton>

                                                      <asp:LinkButton ID="btnSendBack" runat="server" class="btn btn-default label-warning" text="Send Back" 
                                                        CommandName="SendBack" ToolTip="Send Back">
                                                        </asp:LinkButton>
                                                       </td>
                                                <asp:LinkButton ID="btnConfirm" runat="server" class="btn btn-default label-warning" text="Confirm" 
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
				                            
				                        </div>
				                    </div>
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
							
							<h4 class="modal-title">UPLOAD CSV</h4>
						</div>
						<div class="modal-body">
							<p>Browse CSV File</p>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
						</div>
						<div class="modal-footer">
						  <asp:Button ID="btnNo" class="btn btn-default " data-dismiss="modal" runat="server" Text="Cancel"  />
						
                            <asp:Button ID="btnYes" class="btn btn-default accept_button" runat="server" Text="Upload" OnClick="btnYes_Click" />
						</div>
					</div>
				
		
            </asp:Panel>
    <asp:Button ID="btnUpload" runat="server" Text="Button" Visible ="false" />
            <cc1:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" PopupControlID="pnlPopup"
        DynamicServicePath="" Enabled="True" TargetControlID="btnUpload" 
        CancelControlID="btnNo" >
    </cc1:ModalPopupExtender>
</asp:Content>
