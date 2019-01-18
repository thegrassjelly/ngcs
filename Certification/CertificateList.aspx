<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="CertificateList.aspx.cs" Inherits="NCGDSasp.Admin.Certification.CertificateList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
			<section class="content-header">
				<h1>
				Validated Numbers
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Validated Numbers</li>
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
								<a class="btn btn-info btn-sm"
	        						href="CreateCertificate.aspx">
	        						<i class="fa fa-edit fa-fw"></i> Create Certificate
	        					</a>
							</div>
                        
                            
                            <hr>
                   
				                        <div class="col-xs-12" id="manageMasterlistCollectionTable">
				                                  <div class="panel-body">
				                        <div class="col-xs-12" id="manageUserTable">
				                             <table id="example1" class="display table table-bordered table-striped">
                                                        <thead><tr>
                                                            <th>Agency name</th>
                                                            <th>LDC Number</th>
                                                            <th>LDC Amount</th>
                                                            <th>Date Validated</th>
                                                             <th>Validation No.</th>
                                                                   <th>Validated By</th>
                                                                  
                                                             
                                                               
                                                         
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
                                                         
                                                             
                                                         
                                                               
                                                               <asp:LinkButton ID="btnViewDetails" runat="server" class="btn btn-default " text="Edit"
                                                         ToolTip="Edit" CommandName="edit" >
                                                        </asp:LinkButton>

                                                      <asp:LinkButton ID="btnCancelDraf" runat="server" class="btn btn-default label-warning" text="Cancel OR" Visible='<%#Eval("CreationStatus").ToString() != "Cancelled" %>'
                                                        CommandName="canceldraft" ToolTip="Cancel Draft">
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
		      
</asp:Content>
