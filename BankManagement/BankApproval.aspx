<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="BankApproval.aspx.cs" Inherits="NCGDSasp.Admin.BankManagement.BankApproval" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    	<div class="container-fluid">
			<section class="content-header">
				<h1>
					Bank Approval
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Bank Approval</li>
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
                                                            <th>Bank</th>
                                                            <th>Bank Code</th>
                                                            <th>Bank UACS Code</th>
                                                             <th>Remarks</th>
                                                                <th></th>
                                                            <th></th>
                                                            </tr>
                                                            </thead>
                                                        <tbody>
                                            <asp:ListView ID="lvBank" runat="server" OnDataBound="lvBank_DataBound"
                                                OnPagePropertiesChanging="lvBank_PagePropertiesChanging" DataKeyNames="BankID"  OnItemCommand="lvBank_ItemCommand">
                                       
                                                <ItemTemplate>
                                                    <tr>
                                                  
                                                        <   <asp:Literal ID="ltBankID" runat="server" Text='<%# Eval("BankID") %>' Visible="false" />
                                                    
                                                        <td><%# Eval("BankID") %></td>
                                                         <td><%# Eval("BankName") %></td>
                                                         <td><%# Eval("BankCode") %></td>
                                                   <td><%# Eval("BankUACS") %></td>
                                                         <td><%# Eval("Remarks") %></td>
                                                           <td>
                                                            <a href='EditBank.aspx?ID=<%# Eval("BankID") %>'>
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
                                        <asp:DataPager id="dpBank" runat="server" PagedControlID="lvBank">
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
