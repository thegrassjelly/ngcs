<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="RevenueCodeApproval.aspx.cs" Inherits="NCGDSasp.Admin.RevenueCodeManagement.RevenueCodeApproval" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid">
			<section class="content-header">
				<h1>
					List of Revenue Code
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">List of Revenue Code</li>
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
                                                            <th>Revenue Code Name</th>
                                                            <th>Revenue Code UACS Description</th>
                                                            <th>Short Description</th>
                                                             <th>Remarks</th>
                                                             
                                                                <th></th>
                                                         
                                                            </tr>
                                                            </thead>
                                                        <tbody>
                                            <asp:ListView ID="lvRevCode" runat="server" OnDataBound="lvRevCode_DataBound"
                                                OnPagePropertiesChanging="lvRevCode_PagePropertiesChanging" DataKeyNames="RevenueCodeID" OnItemCommand="lvRevCode_ItemCommand"  >
                                       
                                                <ItemTemplate>
                                                    <tr>
                                                           <asp:Literal ID="ltBankID" runat="server" Text='<%# Eval("RevenueCodeID") %>' Visible="false" />
                                                    
                                                        <td><%# Eval("RevenueCodeID") %></td>
                                                         <td><%# Eval("Name") %></td>
                                                         <td><%# Eval("Code") %></td>
                                                   <td><%# Eval("Description") %></td>
                                                         <td><%# Eval("Remarks") %></td>
                                                         <td>
                                                            <a href='EditRevenueCode.aspx?ID=<%# Eval("RevenueCodeID") %>'>
                                                                <asp:Label runat="server" ToolTip="Edit"><i class="fa fa-pencil-square-o"></i></asp:Label></a>
                                                        </td>
                                                   <td>  <asp:LinkButton ID="btnApprove" runat="server"  OnClientClick='return confirm("Are you sure?");'
                                                        CommandName="Approve" ToolTip="Approve">
                                                            <i class="fa fa-check-square-o"></i></asp:LinkButton></td>
                                                  <td>  <asp:LinkButton ID="btnDeny" runat="server"
                                                        CommandName="Disapprove" ToolTip="Disapprove" OnClientClick='return confirm("Are you sure?");'>
                                                            <i class="fa fa-trash-o"></i></asp:LinkButton></td>

                                                

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
                                        <asp:DataPager id="dpRevCode" runat="server" PagedControlID="lvRevCode">
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
