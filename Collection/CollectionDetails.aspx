<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="CollectionDetails.aspx.cs" Inherits="NCGDSasp.Admin.Collection.CollectionDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
				<h1>
					Collection Details
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="manage-masterlist-collection.php"><i class="fa fa-money"></i> Collection</a></li>
					<li class="active">Collection</li>
				</ol>
			</section>
    <section class="content">
				<div class="box box-default">
					<div class="box-body">
						<div class="row">
				            <div class="col-xs-12 col-sm-6">
				            	<table >
				            		<tbody>
				            			<tr>
				            				<td style="width: 120px;">OR Number</td>
				            				<td> : <strong><asp:Label ID="lblORNumber" runat="server" Text="Label"></asp:Label></strong></td>
				            			</tr>
				            			<tr>
				            				<td>Total Amount</td>
				            				<td> : <strong>PHP <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label></strong></td>
				            			</tr>
				            			<tr>
				            				<td>Collection Date :</td>
				            				<td> : <strong><asp:Label ID="lblDate" runat="server" Text="Label"></asp:Label></strong></td>
				            			</tr>
				            			<tr>
				            				<td>Status</td>
				            				<td> : 
				            					
			        							<asp:Label ID="lblStatus" class='<%# lblStatus.Text == "Cancelled" ? "label label-danger" : "label label-info"%>' style="font-weight: normal;" runat="server" Text="Label"></asp:Label>
			        									
			        									
			        						
			        						
				            				</td>
				            			</tr>
				            			<tr>
				            				<td>Remarks</td>
				            				<td> : <strong>	<td> : <strong><asp:Label ID="lblRemarks" runat="server" Text="Label"></asp:Label></strong></td>
				            			</strong></td>
				            			</tr>
				            		</tbody>
				            	</table>
				            </div>
                            <div class="col-xs-12" id="createCollectionTable">
                                                        <asp:Panel ID="pnlCash" runat="server">
                                                             <div class="panel-body">
				                        <div class="col-xs-12" id="manageUserTable">

				                             <table id="example1" class="display table table-bordered table-striped">
                                                        <thead><tr>
                                                            <th>Type</th>
                                                            <th>Date of Collection</th>
                                                            <th>Fund Code</th>
                                                            <th>Revenue Account</th>
                                                                <th>Agency to be Credited</th>
                                                             <th>Currency</th>
                                                                <th>Amount</th>
                                                                <th>Amount in OC</th>
                                                                <th>Amount in PHP</th>
                                                               
                                                            </tr>

                                                            </thead>

                                                        <tbody>
                                            <asp:ListView ID="lvCollectionCash" runat="server" 
                                               DataKeyNames="CollectionDetailsID"    >
                                    

                                                <ItemTemplate>
                                                    <tr>
                                                           <asp:Literal ID="ltCollectionDetailsID" runat="server" Text='<%# Eval("CollectionDetailsID") %>' Visible="false" />
                                                    
                                                          <td><%# Eval("Type") %></td>
                                                         <td><%# Eval("DateOfCollection") %></td>
                                                         <td><%# Eval("Code") %></td>
                                                         <td><%# Eval("Name") %></td>
                                                   <td><%# Eval("Agency") %></td>
                                                       <td><%# Eval("Currency") %></td>
                                                        
                                                         <td><%# Eval("Amount","{0: #,###.00}") %></td>
                                                         <td><%# Eval("AmountInorigCurrency","{0: #,###.00}") %></td>
                                                 <td><%# Eval("AmountInPHP","{0: #,###.00}") %></td>
                                                      <td>  

                                                       
                                                       
                                                

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
                                        <asp:DataPager id="dpCollectionCash" runat="server" PagedControlID="lvCollectionCash">
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
				                        <div class="auto-style3">
				                            
				                        </div>
				                    </div>
                                                 
                                                        </asp:Panel>
                                               
				                        			</div>
                            </div>
                        </div>
                    </div></section>
</asp:Content>
