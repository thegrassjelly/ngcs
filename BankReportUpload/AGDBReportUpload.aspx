<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="AGDBReportUpload.aspx.cs" Inherits="NCGDSasp.Admin.BankReportUpload.AGDBReportUpload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    	<div class="container-fluid">
			<section class="content-header">
				<h1>
					AGDB Reports Uploading
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Bank/BSP Reports Uploading</li>
				</ol>
			</section>
			<section class="content">
				<div class="box box-default">
					<div class="box-body">
						<div class="row">
				            <div class="col-xs-12">
				                    <div class="form-group">
		                            	<div class="row">
		                            		<div class="col-sm-4 col-xs-12">
		                            			<br>
		                            			<label>Attach File</label>
		                            		
                                                <asp:FileUpload ID="FileUpload1" class="form-control" runat="server" accept=".csv"  />
		                            		</div>
		                            	</div>
		                            </div>
		                            <div class="form-group">
		                               
                                        <asp:Button ID="btnSubmit" runat="server" class="btn btn-default saveBankReportUpload" Text="Upload" OnClick="btnSubmit_Click" />
		                            </div>
		                       
				            </div>
				            <div class="col-xs-12">
				            	<br>
				            	<hr>
				            	
				            	     <div class="col-xs-12" id="manageMasterlistCollectionTable">
				                                  <div class="panel-body">
				                        <div class="col-xs-12" id="manageUserTable">
				                             <table id="example1" class="display table table-bordered table-striped">
                                                        <thead><tr>
                                                            <th>Date Credited</th>
                                                            <th>Agency</th>
                                                            <th>Bank Branch</th>
                                                            <th>OR Number</th>
                                                             <th>Amount</th>
                                                                 <th>Action</th>
                                                             
                                                               
                                                         
                                                            </tr>
                                                            </thead>
                                                        <tbody>
                                            <asp:ListView ID="lvFundSource" runat="server" OnDataBound="lvFundSource_DataBound"
                                                OnPagePropertiesChanging="lvFundSource_PagePropertiesChanging" DataKeyNames="ORNumber" OnItemCommand="lvFundSource_ItemCommand"   >
                                       
                                                <ItemTemplate>
                                                    <tr>
                                                           <asp:Literal ID="ltORID" runat="server" Text='<%# Eval("ORNumber") %>' Visible="false" />
                                                    
                                                        <td><%# Eval("DateCredited") %></td>
                                                          <td><%# Eval("Agency") %></td>
                                                          <td><%# Eval("BankBranch") %></td>
                                                                 <td><%# Eval("ORNumber") %></td>
                                                         <td><%# Eval("Amount","{0: #,###.00}") %></td>
                                                
                                               
                                                       
                                             
                                                           <td>
                                                         
                                                             
                                                         
                                                      

                                                      <asp:LinkButton ID="btnDelete" runat="server" class="btn btn-default label-warning" text="Delete" 
                                                        CommandName="deleteRecord" ToolTip="Delete">
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
			</section>
		</div>
</asp:Content>
