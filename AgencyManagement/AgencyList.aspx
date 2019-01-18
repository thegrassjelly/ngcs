<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="AgencyList.aspx.cs" Inherits="NCGDSasp.Admin.AgencyManagement.AgencyList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
			<section class="content-header">
				<h1>
					Agency List
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Agency List</li>
				</ol>
			</section>
			<section class="content">
				<div class="box box-default">
					<div class="box-body">
						<div class="row">
				            <div class="col-xs-12">
				                <div class="panel panel-default">
				                    <div class="panel-body">
				                        <div class="col-xs-12" id="manageUserTable">
				                             <table id="example1" class="display table table-bordered table-striped">
                                                        <thead><tr>
                                                            <th>ID</th>
                                                            <th>Agency</th>
                                                            <th>Department UACS</th>
                                                            <th>Operating Unit Class UACS</th>
                                                             <th>Lower Level Operating Unit Class</th>
                                                                 <th>Remarks</th>
                                                             
                                                                <th></th>
                                                         
                                                            </tr>
                                                            </thead>
                                                        <tbody>
                                            <asp:ListView ID="lvAgency" runat="server" OnDataBound="lvAgency_DataBound"
                                                OnPagePropertiesChanging="lvAgency_PagePropertiesChanging" DataKeyNames="AgencyID"  >
                                       
                                                <ItemTemplate>
                                                    <tr>
                                                           <asp:Literal ID="ltAgencyID" runat="server" Text='<%# Eval("AgencyID") %>' Visible="false" />
                                                    
                                                        <td><%# Eval("AgencyID") %></td>
                                                         <td><%# Eval("AgencyName") %></td>
                                                         <td><%# Eval("Department") %></td>
                                                   <td><%# Eval("OperatingUnit") %></td>
                                                         <td><%# Eval("LowerLevelOperatingClass") %></td>
                                                 <td><%# Eval("Remarks") %></td>
                                                           <td>
                                                            <a href='EditAgency.aspx?ID=<%# Eval("AgencyID") %>'>
                                                                <asp:Label runat="server" ToolTip="Edit"><i class="fa fa-pencil-square-o"></i></asp:Label></a>
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
                                        <asp:DataPager id="dpAgency" runat="server" PagedControlID="lvAgency">
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
