<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="DiscrepancyList.aspx.cs" Inherits="NCGDSasp.Admin.Endorsement.DescrepancyList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
		<div class="container-fluid">
			<section class="content-header">
				<h1>
					Discrepancy Details
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Discrepancy Details</li>
				</ol>
			</section>
			<section class="content">
				<div class="box box-default">
					<div class="box-body">
						<div class="row">
							<div class="col-xs-12">
								<div class="row">
									<br>
									<div class="col-xs-12 col-sm-6">
										<table class="table">
		                        			<tbody>
		                        				<tr>
		                        					<td width="200px;">Bank:</td>
		                        					<td>:  &nbsp;  &nbsp;     <asp:Label ID="lblBank" runat="server" Text="Label"></asp:Label> <strong> </strong></td>
		                        				</tr>
		                        				<tr>
		                        					<td>Branch</td>
		                        					<td>:  &nbsp;  &nbsp;  <strong>
                                                        <asp:Label ID="lblBranch" runat="server" Text="Label"></asp:Label></strong></td>
		                        				</tr>
		                        				<tr>
		                        					<td>Bank Report Date</td>
		                        					<td>:  &nbsp;  &nbsp;  <strong>
                                                        <asp:Label ID="lblDate" runat="server" Text="Label"></asp:Label></strong></td>
		                        				</tr>
		                        				<tr>
		                        					<td>Bank Report Amount</td>
		                        					<td>:  &nbsp;  &nbsp;  <strong>Php. 
                                                        <asp:Label ID="lblAmount" runat="server" Text="Label"></asp:Label></strong></td>
		                        				</tr>
		                        			</tbody>
		                        		</table>	
									</div>
								</div>
	                        	<hr>
	                        	<table id="disrepancies" class="table table-striped table-bordered">
	                        		<thead>
	                        			<tr>
	                        				<th>Agency Name</th>
	                        				<th>LDC Number</th>
	                        				<th>LDC Amount</th>
	                        				<th class="text-center">Action</th>
	                        			</tr>
	                        		</thead>
	                        		  <tbody>
                                            <asp:ListView ID="lvform" runat="server" OnDataBound="lvform_DataBound"
                                                OnPagePropertiesChanging="lvform_PagePropertiesChanging" DataKeyNames="LDCNumber"  OnItemCommand="lvform_ItemCommand">
                                       
                                                <ItemTemplate>
                                                    <tr>
                                                           <asp:Literal ID="ltID" runat="server" Text='<%# Eval("LDCNumber") %>' Visible="false" />
                                                    
                                                        <td><%# Session["Agency"].ToString() %></td>
                                                         <td><%# Eval("LDCNumber") %></td>
                                                         <td><%# Eval("totalamount") %></td>
                                           
                                                      <td>
                                                      <asp:LinkButton ID="btnViewDetails" runat="server" class="btn btn-default text-center" text="View LDC"
                                                         ToolTip="View LDC" CommandName="view" >
                                                        </asp:LinkButton>

                                                      <asp:LinkButton ID="btnEndorse" runat="server" class="btn btn-default label-warning text-center" text="Endorse"  visible='<%#Eval("Status").ToString() != "Endorsed" %>'
                                                        CommandName="endorse" ToolTip="Endorse">
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
                                        <asp:DataPager id="dpForm" runat="server" PagedControlID="lvForm">
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
                    </div>
                </div>
            </section>
        </div>

</asp:Content>
