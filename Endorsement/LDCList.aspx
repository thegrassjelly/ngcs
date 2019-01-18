<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="LDCList.aspx.cs" Inherits="NCGDSasp.Admin.Endorsement.LDCList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
			<section class="content-header">
				<h1>
				List of LDC 
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">List of LDC</li>
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
                        			
                        		</div>
                        
                            
                            <hr>
                   
				                        <div class="col-xs-12" id="manageMasterlistCollectionTable">
				                                  <div class="panel-body">
				                        <div class="col-xs-12" id="manageUserTable">
				                             <table id="example1" class="display table table-bordered table-striped">
                                                        <thead><tr>
                                                            <th>LDC Number</th>
                                                            <th>Date Created</th>
                                                            <th>Status</th>
                                                            <th>Created By</th>
                                                             <th>Remarks</th>
                                                                   <th>Action</th>
                                                                  
                                                             
                                                               
                                                         
                                                            </tr>
                                                            </thead>
                                                        <tbody>
                                            <asp:ListView ID="lvFundSource" runat="server" OnDataBound="lvFundSource_DataBound"
                                                OnPagePropertiesChanging="lvFundSource_PagePropertiesChanging" DataKeyNames="LDCID" OnItemCommand="lvFundSource_ItemCommand"   >
                                       
                                                <ItemTemplate>
                                                    <tr>
                                                           <asp:Literal ID="ltLDCID" runat="server" Text='<%# Eval("LDCID") %>' Visible="false" />
                                                    
                                                        <td><%# Eval("LDCID") %></td>
                                                           <td><%# Eval("CreationDate") %></td>
                                                        <td><%# Eval("Status") %></td>
                                                   <td><%# Eval("Username") %></td>
                                                          <td><%# Eval("Remarks") %></td>
                                                        
                                                    <td>
                                                      <asp:LinkButton ID="btnViewDetails" runat="server" class="btn btn-default text-center" text="View LDC"
                                                         ToolTip="View LDC" CommandName="view" >
                                                        </asp:LinkButton>

                                                      <asp:LinkButton ID="btnEndorse" runat="server" class="btn btn-default label-warning text-center" text="Endorse"  visible='<%#Eval("Status").ToString() != "Endorsed" %>'
                                                        CommandName="endorse" ToolTip="Endorse">
                                                        </asp:LinkButton>
                                                      
                                                    <asp:LinkButton ID="btnReject" runat="server"   class="btn btn-default label-danger text-center btnGenDiscrepancy"  text="Reject"  visible='<%#Eval("Status").ToString() != "Endorsed"  %>' 
                                                        CommandName="reject" ToolTip="Reject">
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
		      	<div class="modal fade" id="rejectModal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>

							<h4 class="modal-title">ID:<asp:Label ID="lblID" runat="server" Text="Label"></asp:Label></h4>
						</div>
						<div class="modal-body">	
                     	</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						
                       <%--     <asp:Button ID="btnViewdiscrepancy"  class="btn btn-default send_back_button" runat="server" Text="View discrepancy" visible="false" OnClick="btnViewdiscrepancy_Click" />
                               <asp:Button ID="btnViewValidated"  class="btn btn-default" runat="server" Text="View Validated" visible="false"   />--%>

							
						</div>
					</div>
				</div>
			</div>
     <script>
         $(document).ready(function () {
            
     
           $(".btnGenDiscrepancy").click(function (e) {
               $('#<%= lblID.ClientID %>').html();
                e.preventDefault();
		
              
                $('#rejectModal').modal('show');
            });
        });
        
        </script>
</asp:Content>
