<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="BranchList.aspx.cs" Inherits="NCGDSasp.Admin.BankManagement.BranchList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">.
    <div class="container-fluid">
			<section class="content-header">
				<h1>
					Bank List
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Bank List</li>
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
                                                            <th>Bank Branch</th>
                                                              <th>Bank Branch Code</th>
                                                            <th>Bank Branch UACS Code</th>
                                                             <th>BTr Regional Office</th>
                                                               <th>Remarks</th>
                                                             
                                                                <th></th>
                                                         
                                                            </tr>
                                                            </thead>
                                                        <tbody>
                                            <asp:ListView ID="lvBankBranch" runat="server" OnDataBound="lvBankBranch_DataBound"
                                                OnPagePropertiesChanging="lvBankBranch_PagePropertiesChanging" DataKeyNames="bankbranchID"  >
                                       
                                                <ItemTemplate>
                                                    <tr>
                                                           <asp:Literal ID="ltBranchID" runat="server" Text='<%# Eval("bankbranchID") %>' Visible="false" />
                                                    
                                                        <td><%# Eval("bankbranchID") %></td>
                                                         <td><%# Eval("bankname") %></td>
                                                         <td><%# Eval("branchname") %></td>
                                                   <td><%# Eval("branchcode") %></td>
                                                         <td><%# Eval("BranchUACSCode") %></td>
                                                   <td><%# Eval("regionname") %></td>
                                                    <td><%# Eval("Remarks") %></td>
                                               
                                                 
                                                           <td>
                                                            <a href='EditBranch.aspx?ID=<%# Eval("bankbranchID") %>'>
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
                                        <asp:DataPager id="dpBranch" runat="server" PagedControlID="lvBankBranch">
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
