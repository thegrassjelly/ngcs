<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="EditBranch.aspx.cs" Inherits="NCGDSasp.Admin.BankManagement.EditBranch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
			<section class="content-header">
				<h1>
					Add Bank Branch
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Add Bank Branch</li>
				</ol>
			</section>
			<section class="content">
				<div class="box box-default">
					<div class="box-body">
						<div class="row">
				            <div class="col-xs-12">
				                <div class="panel panel-default">
				                    <div class="panel-body">
				                  
				                            <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cBankName">Select Bank</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                        
                                                          <asp:DropDownList ID="ddlbanks" runat="server" class="form-control" OnSelectedIndexChanged="ddlbanks_SelectedIndexChanged"  DataSourceID="SqlDataSource5" DataTextField="BankName" DataValueField="BankID">
                                            
                                                                      
                                            </asp:DropDownList>  <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT [BankID], [BankName] FROM [Banks] where creationstatus='Approved'"></asp:SqlDataSource>
                                            <br />
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
                                             <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cBankName">Select BTr Regional Office:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                        
                                                          <asp:DropDownList ID="ddlRegionalOffice" runat="server" class="form-control" OnSelectedIndexChanged="ddlRegionalOffice_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="RegionName" DataValueField="regionCode" OnDataBound="ddlRegionalOffice_DataBound">
                                            
                                                                      
                                            </asp:DropDownList>  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT * FROM [Region]"></asp:SqlDataSource>
                                            <br />
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
                                              <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cBankCode">Bank Branch Name:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                                <asp:TextBox ID="txtBranchname" class="form-control" runat="server"></asp:TextBox>
				                        </br>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cBankCode">Bank Code:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                                <asp:TextBox ID="txtBranchCode" class="form-control" runat="server"></asp:TextBox>
				                        </br>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                             <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cBankName">UACS Location:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                        
                                                          <asp:DropDownList ID="ddlUACS" runat="server" class="form-control" OnSelectedIndexChanged="ddlUACS_SelectedIndexChanged" AutoPostBack="True">
                                            
                                                                      
                                            </asp:DropDownList>  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT * FROM [brgyuacs]"></asp:SqlDataSource>
                                            <br />
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cRemarks">Bank Branch Address:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                                  <asp:TextBox ID="txtAddress" class="form-control" runat="server" ></asp:TextBox>
				                       
				                                        </div>
				                                    </div>
				                                    <div class="col-xs-4">
				                                        
				                                    </div>
				                                    <div class="col-xs-4">
				                                        
				                                    </div>
				                                </div>
				                            </div>
                                          <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cRemarks">Remarks:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                                  <asp:TextBox ID="txtRemarks" class="form-control" runat="server" ></asp:TextBox>
				                       
				                                        </div>
				                                    </div>
				                                    <div class="col-xs-4">
				                                        
				                                    </div>
				                                    <div class="col-xs-4">
				                                        
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                    	<div class="col-xs-12">
				                                        	
                                                            <asp:Button ID="btnSubmit" class="btn btn-default saveBank" runat="server" Text="Save" OnClick="btnSubmit_Click" />
				                                        </div>
				                                    </div>
				                                    <div class="col-xs-4">
				                                        
				                                    </div>
				                                    <div class="col-xs-4">

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
		</div>
</asp:Content>
