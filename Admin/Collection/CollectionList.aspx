<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="CollectionList.aspx.cs" Inherits="NCGDSasp.Admin.Collection.CollectionList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
			<section class="content-header">
				<h1>
					Manage Agency Collection Masterlist
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Manage Agency Collection Masterlist</li>
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
                    			
                                    <asp:Button ID="btnUpload" class="btn btn-default" runat="server" Text="Upload CSV"  style="margin-right: 10px; " />
                    				<a href="CreateCollection.aspx" class="btn btn-default">Create OR</a>
                        		</div>
                        
                            
                            <hr>
                   
				                        <div class="col-xs-12" id="manageMasterlistCollectionTable">
				                                  <div class="panel-body">
				                        <div class="col-xs-12" id="manageUserTable">
				                             <table id="example1" class="display table table-bordered table-striped">
                                                        <thead><tr>
                                                            <th>LDC Number</th>
                                                            <th>Amount</th>
                                                            <th>OR Number</th>
                                                            <th>Collection Date</th>
                                                             <th>Status</th>
                                                                 <th>Action</th>
                                                             
                                                               
                                                         
                                                            </tr>
                                                            </thead>
                                                        <tbody>
                                            <asp:ListView ID="lvFundSource" runat="server" OnDataBound="lvFundSource_DataBound"
                                                OnPagePropertiesChanging="lvFundSource_PagePropertiesChanging" DataKeyNames="CollectionID" OnItemCommand="lvFundSource_ItemCommand"   >
                                       
                                                <ItemTemplate>
                                                    <tr>
                                                           <asp:Literal ID="ltCollectionID" runat="server" Text='<%# Eval("CollectionID") %>' Visible="false" />
                                                    
                                                        <td><%# Eval("LDCNumber") %></td>
                                                         <td><%# Eval("TotalAmount","{0: #,###.00}") %></td>
                                                         <td><%# Eval("ORNumber") %></td>
                                                   <td><%# Eval("DateCreated") %></td>
                                                       
                                                 <td><span class="label label-success"><%# Eval("CreationStatus") %></td>
                                                           <td>
                                                         
                                                             
                                                         
                                                               
                                                               <asp:LinkButton ID="btnViewDetails" runat="server" class="btn btn-default " text="View Details"
                                                         ToolTip="View Details" CommandName="viewdetails" >
                                                        </asp:LinkButton>

                                                      <asp:LinkButton ID="btnCancelOR" runat="server" class="btn btn-default label-warning" text="Cancel OR" Visible='<%#Eval("CreationStatus").ToString() != "Cancelled" %>'
                                                        CommandName="cancelor" ToolTip="Cancel OR">
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
            <cc1:ModalPopupExtender ID="Panel1_ModalPopupExtender" runat="server" PopupControlID="pnlPopup"
        DynamicServicePath="" Enabled="True" TargetControlID="btnUpload" 
        CancelControlID="btnNo" >
    </cc1:ModalPopupExtender>
	
</asp:Content>
