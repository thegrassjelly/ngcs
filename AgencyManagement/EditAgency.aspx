<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="EditAgency.aspx.cs" Inherits="NCGDSasp.Admin.AgencyManagement.EditAgency" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
			<section class="content-header">
				<h1>
					Edit Affiliate Agency
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Edit Affiliate Agency</li>
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
				                                            <label for="cAgencyName">Agency Name:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                                 <asp:TextBox ID="txtAgencyName" class="form-control" runat="server"></asp:TextBox><br />
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cDepartmentUacs">Department UACS:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                              <asp:TextBox ID="txtDepartmentUACS" class="form-control" runat="server"></asp:TextBox> </br>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cAgencyUacs">Agency UACS:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                                <asp:TextBox ID="txtAgencyUACS" class="form-control" runat="server"></asp:TextBox> </br>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cOperatingClassUacs">Operating Unit Class UACS:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                                <asp:TextBox ID="txtoperatingUnitUACS" class="form-control" runat="server"></asp:TextBox> </br>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cLowerLevelOperatingClassUacs">Lower Level Operating Class UACS:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                                 <asp:TextBox ID="txtLowerlevelOperatingClass" class="form-control" runat="server"></asp:TextBox></br>
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
		</div>
</asp:Content>
