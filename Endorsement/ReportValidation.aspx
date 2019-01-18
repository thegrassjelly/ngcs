<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="ReportValidation.aspx.cs" Inherits="NCGDSasp.Admin.Endorsement.ReportValidation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
		<div class="container-fluid">
			<section class="content-header">
				<h1>
					Reports Validation/Matching
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Reports Validation/Matching</li>
				</ol>
			</section>
			<section class="content">
				<div class="box box-default">
					<div class="box-body">
						<div class="row">
				            <div class="col-xs-12">
				               
		                            <div class="form-group">
		                                <div class="col-xs-12">
		                                    <div class="col-xs-4">
		                                        <div class="col-xs-12">
		                                            <h2>Collection Report</h2>
		                                        </div>
		                                    </div>
		                                    <div class="col-xs-4">
		                                        <div class="col-xs-12">
		                                            <h2>Bank Reports</h2><br />
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="form-group">
		                                <div class="col-xs-12">
		                                    <div class="col-xs-4">
		                                        <div class="col-xs-4">
		                                            <label for="cUacsCode">Agency:</label>
		                                        </div>
		                                        <div class="col-xs-8">
		                                                      <asp:DropDownList ID="ddlAgency" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Agency" DataValueField="HomeAgencyID" OnSelectedIndexChanged="ddlAgency_SelectedIndexChanged"></asp:DropDownList>
				                                          
				                                               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT * FROM [HomeAgency] where creationStatus='Approved'"></asp:SqlDataSource>
				                                           <br />
		                                        </div>
		                                    </div>
		                                    <div class="col-xs-4">
		                                        <div class="col-xs-4">
		                                            <label for="cBank">Bank</label>
		                                        </div>
		                                        <div class="col-xs-8">
		                                                  <asp:DropDownList ID="ddlbanks" runat="server" class="form-control" OnSelectedIndexChanged="ddlbanks_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="BankName" DataValueField="BankID" OnDataBound="ddlbanks_DataBound">
                                            
                                                                      
                                            </asp:DropDownList>
                                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT [BankID], [BankName] FROM [Banks]"></asp:SqlDataSource>
                                                              <br />
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="form-group">
		                                <div class="col-xs-12">
		                                    <div class="col-xs-4">
		                                        <div class="col-xs-4">
		                                            <label for="dDateCredited">Date Credited:</label>
		                                        </div>
		                                        <div class="col-xs-8">
		                                            <div class="input-group date">
		                                               <asp:TextBox ID="txtDateCredited" class="form-control pull-right" runat="server" type="date" OnTextChanged="txtDateCredited_TextChanged"></asp:TextBox>
		                                                <div class="input-group-addon">
		                                                    <i class="fa fa-calendar"></i>
		                                                </div>
		                                            </div><br />
		                                        </div>
		                                    </div>
											<test id="bankBranchDropdown">
		                                    <div class="col-xs-4">
		                                        <div class="col-xs-4">
		                                            <label for="cBankBranch">Bank Branch:</label>
		                                        </div>
		                                        <div class="col-xs-8">
		                                                 <asp:DropDownList ID="ddlBranch" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlBranch_SelectedIndexChanged" 
                                                >
                                                                      
                                            </asp:DropDownList> <br />
		                                        </div>
		                                    </div>
		                                    <div class="col-xs-4">
		                                        
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="form-group">
		                                <div class="col-xs-12">
		                                    <div class="col-xs-4">
		                                    	
		                                    </div>
		                                    <div class="col-xs-4">
		                                        <div class="col-xs-12">
			                                        <div class="pull-right">
                                                        
			                                         <asp:Button ID="Button1" runat="server" Text="Generate Discrepancy"  class="btn btn-default btnGenDiscrepancy" OnClientClick="Button1_Click" />
			                                        </div>
			                                        <br><br><br><br>
		                                        </div>
		                                    </div>
		                                    <div class="col-xs-4">

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
							<h4 class="modal-title"></h4>
						</div>
						<div class="modal-body">	
                          	<p id="cBody">  Discrepancy found: (<asp:Label ID="lbldiscrepancy" runat="server" Text="0"></asp:Label>)					
						</p>
							<p id="validatedLdc">  Validated  found: (<asp:Label ID="lblValidated" runat="server" Text="0"></asp:Label>)					
						</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						
                            <asp:Button ID="btnViewdiscrepancy"  class="btn btn-default send_back_button" runat="server" Text="View discrepancy" visible="false" OnClick="btnViewdiscrepancy_Click" />
                               <asp:Button ID="btnViewValidated"  class="btn btn-default" runat="server" Text="View Validated" visible="false"   />

							
						</div>
					</div>
				</div>
			</div>
		</div>
    <script>
        $(document).ready(function() {
            $(".btnGenDiscrepancy").click(function(e){
                e.preventDefault();
		
              
                $('#rejectModal').modal('show');
            });
        });
        </script>
</asp:Content>
