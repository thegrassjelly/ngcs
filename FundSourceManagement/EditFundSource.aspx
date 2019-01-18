<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="EditFundSource.aspx.cs" Inherits="NCGDSasp.Admin.FundSourceManagement.EditFundSource" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
				<h1>
					Add Funding Source
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Add Funding Source</li>
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
				                                            <label for="cAgencyName">Fund Source::</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                                 <asp:TextBox ID="txtFundSource" class="form-control" runat="server"></asp:TextBox><br />
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cDepartmentUacs">Revenue UACS Code:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                              <asp:TextBox ID="txtRevenueUACS" class="form-control" runat="server"></asp:TextBox> </br>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cAgencyUacs">Short Description</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                                <asp:TextBox ID="txtShortDesc" class="form-control" runat="server"></asp:TextBox> </br>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
                                             <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cLowerLevelOperatingClassUacs">Remarks:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                                 <asp:TextBox ID="txtRemarks" class="form-control" runat="server"></asp:TextBox></br>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
                                          <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cLowerLevelOperatingClassUacs">Status:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                                     <asp:DropDownList ID="ddlStatus" class="form-control" runat="server">
                                                                       <asp:ListItem Value="0">Active</asp:ListItem>
                                                                       <asp:ListItem Value="1">Inactive</asp:ListItem>
                                                                       <asp:ListItem Value="2">Deactivated</asp:ListItem>
                                                                   </asp:DropDownList>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                    	<div class="pull-right">
				                                      
                                                    <asp:Button runat="server"  class="btn btn-default saveAgency" text="Save" id="btnSave" OnClick="Unnamed1_Click"></asp:Button>
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
      
</asp:Content>
