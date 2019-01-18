<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="CreateRevenueCode.aspx.cs" Inherits="NCGDSasp.Admin.RevenueCodeManagement.CreateRevenueCode" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    	<div class="container-fluid">
			<section class="content-header">
				<h1>
					Add Revenue Code
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Add Revenue Code</li>
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
				                                            <label for="cBankName">Revenue Code Name:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                        
                                                                   <asp:TextBox ID="txtName" class="form-control" runat="server"></asp:TextBox>
				                       <br />
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cBankCode">Revenue UACS Code:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                                <asp:TextBox ID="txtUACSCode" class="form-control" runat="server"></asp:TextBox>
				                        </br>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cBankUacs">Short Description:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                                   <asp:TextBox ID="txtDesc" class="form-control" runat="server"></asp:TextBox>
				                       
				                                        </div>
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
