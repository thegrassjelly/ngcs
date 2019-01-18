<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="CreateCertificate.aspx.cs" Inherits="NCGDSasp.Admin.Certification.CreateCertificate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
			<section class="content-header">
				<h1>
					Create Certificate
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Create Certificate</li>
				</ol>
			</section>
			<section class="content">
				<div class="box box-default">
					<div class="box-body">
						<div class="row">
							<div class="col-xs-12 col-sm-6 form-horizontal">
								<br>
							  	<div class="form-group">
							    	<label class="control-label col-sm-4">Request Numer:</label>
							    	<div class="col-sm-8">
							      		
                                        <asp:TextBox ID="txtRequestNo" class="form-control" runat="server" placeholder="Ex. 1231"></asp:TextBox>
							    	</div>
							  	</div>
							  	<div class="form-group">
							    	<label class="control-label col-sm-4">Date Requested:</label>
							    	<div class="col-sm-8">
							      	        <asp:TextBox ID="txtReqDate" class="form-control" runat="server" type="date" ></asp:TextBox>
							    </div>
							  	</div>
							  	<div class="form-group">
							    	<label class="control-label col-sm-4">Date Credited From:</label>
							    	<div class="col-sm-8">
							          	        <asp:TextBox ID="txtDateCreditedFrom" class="form-control" runat="server" type="date" ></asp:TextBox>
							   </div>
							  	</div>
							  	<div class="form-group">
							    	<label class="control-label col-sm-4">Date Credited To:</label>
							    	<div class="col-sm-8">
							          	        <asp:TextBox ID="txtDateCreditedTo" class="form-control" runat="server" type="date" ></asp:TextBox>
							   </div>
							  	</div>
							  	<div class="form-group">
							    	<label class="control-label col-sm-4">Bank:</label>
							    	<div class="col-sm-8">
							    	             <asp:DropDownList ID="ddlbanks" runat="server" class="form-control" OnSelectedIndexChanged="ddlbanks_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="BankName" DataValueField="BankID">
                                            
                                                                      
                                            </asp:DropDownList>
                                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT [BankID], [BankName] FROM [Banks]"></asp:SqlDataSource>
                                                              
							    	</div>
							  	</div>
							  	<div class="form-group">
							    	<label class="control-label col-sm-4">Branches:</label>
							    	<div class="col-sm-8">
							    		            <asp:DropDownList ID="ddlBranch" runat="server" class="form-control" AutoPostBack="True" 
                                                >
                                                                      
                                            </asp:DropDownList>
							    	</div>
							  	</div>
							  	<div class="form-group">
							    	<label class="control-label col-sm-4">Agency:</label>
							    	<div class="col-sm-8">
							    	       <asp:DropDownList ID="ddlAgency" class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="Agency" DataValueField="HomeAgencyID"></asp:DropDownList>
				                                          
				                                               <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT * FROM [HomeAgency] where creationStatus='Approved'"></asp:SqlDataSource>
				                                          
							    	</div>
							  	</div>
							</div>
							<div class="col-xs-12 col-sm-6 form-horizontal">
								<br>
							  	<div class="form-group">
							    	<label class="control-label col-sm-4">Organization Code:</label>
							    	<div class="col-sm-8">
							             	        <asp:TextBox ID="txtOrgCode" class="form-control" runat="server"  ></asp:TextBox>
							 </div>
							  	</div>
							  	<div class="form-group">
							    	<label class="control-label col-sm-4">Fund Code:</label>
							    	<div class="col-sm-8">
							    		     <asp:DropDownList ID="ddlFundSource" class="form-control" runat="server" DataSourceID="dsFundSource" DataTextField="Code" DataValueField="FundSourceID"></asp:DropDownList>
				                                               <asp:SqlDataSource ID="dsFundSource" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT * FROM [FundSource] where  creationStatus='Approved'"></asp:SqlDataSource>
				                                          
							    	</div>
							  	</div>
							  	<div class="form-group">
							    	<label class="control-label col-sm-4">Deposit Date:</label>
							    	<div class="col-sm-8">
							                	        <asp:TextBox ID="txtDepDate" class="form-control" runat="server" type="date" ></asp:TextBox>
							</div>
							  	</div>
							  	<div class="form-group">
							    	<label class="control-label col-sm-4">Date Credited:</label>
							    	<div class="col-sm-8">
							                	        <asp:TextBox ID="txtDateCredited" class="form-control" runat="server" type="date" ></asp:TextBox>
							</div>
							  	</div>
							  	<div class="form-group">
							    	<label class="control-label col-sm-4">Amount:</label>
							    	<div class="col-sm-8">
							                	        <asp:TextBox ID="txtAmount" class="form-control" runat="server" ></asp:TextBox>
							</div>
							  	</div>
							  	<div class="form-group">
							    	<label class="control-label col-sm-4">Volume Of Transaction:</label>
							    	<div class="col-sm-8">
							    		<asp:DropDownList ID="ddlVolumeOfTransaction" class="form-control" runat="server">
                                            <asp:ListItem Value="A">Transaction A</asp:ListItem>
                                            <asp:ListItem Value="B">Transaction B</asp:ListItem>
                                            <asp:ListItem Value="C">Transaction C</asp:ListItem>
                                            <asp:ListItem Value="D">Transaction D</asp:ListItem>
                                            <asp:ListItem Value="E">Transaction E</asp:ListItem>
                                        </asp:DropDownList>
							    	</div>
							    </div>
							</div>
							<div class="col-xs-12">
								<br>
								<table class="table table-striped table-bordered"> 
									<thead>
										<tr>
											<th>LDC Number</th>
											<th>Validation Number</th>
											<th>Credit Agency</th>
											<th>Fund Code</th>
											<th>Amount</th>
										</tr>
									</thead>
									<tbody id="data">
									</tbody>
								</table>
							</div>
							<div class="col-xs-12 text-right">
								<br>
							
                                <asp:Button ID="btnSubmit" runat="server" class="btn btn-primary" Text="Submit For Supervisor Approval" OnClick="btnSubmit_Click" />
						      	<br>
						      	<br>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>

</asp:Content>
