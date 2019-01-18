<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="NCGDSasp.Admin.UserManagement.CreateUser" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:ScriptManager runat="server"></asp:ScriptManager>
   	<div class="container-fluid">
			<section class="content-header">
				<h1>
					Create User 
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Create user</li>
				</ol>
			</section>
			<section class="content">
				<div class="box box-default">
					<div class="box-body">
						<div class="row">
				            <div class="col-xs-12">
				                <div class="panel panel-default">
				                    <div class="panel-body">
				                        <form>
				                            <div class="form-group" id="user">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cUsername">Username:</label>
				                                        </div>
				                                        <div class="col-xs-8">
                                                            <asp:TextBox ID="txtUserName" class="form-control" runat="server"></asp:TextBox>
                                                            <br />
				                                       </div>
				                                    </div>
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cEmail">Email:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                              <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
				                                       </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="form-group" id="user2">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cFirstName">First Name:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                              <asp:TextBox ID="txtFirstName" class="form-control" runat="server"></asp:TextBox>
                                                                <br />
				                                      </div>
				                                    </div>
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cMiddleName">Middle Name:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                              <asp:TextBox ID="txtMiddleName" class="form-control" runat="server"></asp:TextBox>
				                                      </div>
				                                    </div>
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cLastName">Last Name:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                             <asp:TextBox ID="txtLastName" class="form-control" runat="server"></asp:TextBox>
				                                       </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="form-group" id="user3">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cHomeAgency">Home Agency:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                            <asp:TextBox ID="txtHomeAgency" class="form-control" runat="server"></asp:TextBox>
                                                            <br />
				                                       </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="form-group" id="general">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cDepartment">Department:</label>
				                                        </div>
				                                        <div class="col-xs-8">
                                                            <asp:DropDownList ID="ddlDepartment" class="form-control" runat="server" DataSourceID="sdDepartment" DataTextField="DepartmentName" DataValueField="DepartmentID"></asp:DropDownList>
				                                             <asp:SqlDataSource ID="sdDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT * FROM [Department]"></asp:SqlDataSource>
				                                             <br />
				                                        </div>
				                                    </div>
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cAgency">Agency:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                           
				                                               <asp:DropDownList ID="ddlAgency" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Agency" DataValueField="HomeAgencyID"></asp:DropDownList>
				                                          
				                                               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT * FROM [HomeAgency] where creationStatus='Approved'"></asp:SqlDataSource>
				                                          
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="form-group" id="general2">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cRegion">Region:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                        
				                                                  <asp:DropDownList ID="ddlRegion" class="form-control" AutoPostBack="True" runat="server" DataSourceID="SqlDataSource2" DataTextField="Regionname" DataValueField="regionCode" OnSelectedIndexChanged="ddlRegion_SelectedIndexChanged" OnDataBinding="ddlRegion_DataBinding" OnDataBound="ddlRegion_DataBound" OnInit="ddlRegion_Init"></asp:DropDownList>
				                                                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT * FROM [Region]"></asp:SqlDataSource>
				                                           <br />
				                                        </div>
				                                    </div>
                                                       <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cRegion">Province:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                        
				                                                  <asp:DropDownList ID="ddlProvince" class="form-control" runat="server" AutoPostBack="True" OnDataBound="ddlProvince_DataBound" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged"  ></asp:DropDownList>
				                                           
				                                                  <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT * FROM [Province] WHERE ([RegionCode] = @RegionCode)">
                                                                      <SelectParameters>
                                                                          <asp:ControlParameter ControlID="ddlRegion" Name="RegionCode" PropertyName="SelectedValue" Type="String" />
                                                                      </SelectParameters>
                                                                  </asp:SqlDataSource>
				                                           
				                                           <br />
				                                        </div>
				                                    </div>
                                                       <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cRegion">Municipality:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                        
				                                                  <asp:DropDownList ID="ddlMunicipality" AutoPostBack="True" class="form-control" runat="server" OnDataBound="ddlMunicipality_DataBound" OnSelectedIndexChanged="ddlMunicipality_SelectedIndexChanged" ></asp:DropDownList>
				                                                  <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT * FROM [Municipality] WHERE ([ProvincialCode] = @ProvincialCode)">
                                                                      <SelectParameters>
                                                                          <asp:ControlParameter ControlID="ddlProvince" Name="ProvincialCode" PropertyName="SelectedValue" Type="String" />
                                                                      </SelectParameters>
                                                                  </asp:SqlDataSource>
				                                           <br />
				                                        </div>
				                                    </div>
				                                    <div class="form-group">

				                                    </div>
				                                </div>
				                            </div>
				                             <div class="form-group" id="general2">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cRegion">Barangay:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                        
				                                                  <asp:DropDownList ID="ddlBarangay" class="form-control" runat="server" OnDataBound="ddlBarangay_DataBound" OnSelectedIndexChanged="ddlBarangay_SelectedIndexChanged" ></asp:DropDownList>
				                                                  <asp:SqlDataSource ID="barangayDS" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT * FROM [BarangayList] WHERE ([MunicipalityCode] = @MunicipalityCode)">
                                                                      <SelectParameters>
                                                                          <asp:ControlParameter ControlID="ddlMunicipality" Name="MunicipalityCode" PropertyName="SelectedValue" Type="String" />
                                                                      </SelectParameters>
                                                                  </asp:SqlDataSource>
				                                           <br />
				                                        </div>
				                                    </div>
                                                       <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cRegion">Operating Unit:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                        
				                                                  <asp:DropDownList ID="ddlOperatingUnit" class="form-control" runat="server" DataSourceID="dsOperatingUnit" DataTextField="operatingUnitName" DataValueField="OperatingUnitID"></asp:DropDownList>
				                                                  <asp:SqlDataSource ID="dsOperatingUnit" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT * FROM [OperatingUnit]"></asp:SqlDataSource>
				                                           <br />
				                                        </div>
				                                    </div>
                                                     
				                                    <div class="form-group">

				                                    </div>
				                                </div>
				                            </div>
				                            <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        
				                                    </div>
				                                    <div class="col-xs-4">
				                                        
				                                    </div>
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            
				                                        </div>
				                                        <div class="col-xs-8">
                                                            <asp:Button ID="btnAdd" class="btn btn-default saveGeneral" runat="server" Text="Add" OnClick="btnAdd_Click" />
                                                                <br />
				                                          </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="col-xs-12">
				                            	<div class="col-xs-12">
						                            <div class="col-xs-12" id="createUserGeneralTable">
						                            <table id="example1" class="display table table-bordered table-striped">
                                                        <thead><tr>
                                                            <th>Agency</th>
                                                            <th>Region/Province</th>
                                                            <th>Municipality</th>
                                                            <th>Barangay</th>
                                                             <th>Operating Unit</th>
                                                                <th></th>
                                                            </tr>
                                                            </thead>
                                                        <tbody>
                                            <asp:ListView ID="lvUserAgency" runat="server" OnDataBound="lvUserAgency_DataBound"
                                                OnPagePropertiesChanging="lvUserAgency_PagePropertiesChanging" DataKeyNames="UserAgencyID"  OnItemCommand="lvUserAgency_ItemCommand">
                                       
                                                <ItemTemplate>
                                                    <tr>
                                                           <asp:Literal ID="ltUserAgencyID" runat="server" Text='<%# Eval("UserAgencyID") %>' Visible="false" />
                                                    
                                                        <td><%# Eval("Agency") %></td>
                                                         <td><%# Eval("RegionName") %>/<%# Eval("ProvinceName") %></td>
                                                         <td><%# Eval("Municipalityname") %></td>
                                                   <td><%# Eval("Barangayname") %></td>
                                                         <td><%# Eval("OperatingUnitName") %></td>
                                                        <td>  <asp:LinkButton ID="btnRemoveItem" runat="server"
                                                        CommandName="deleteua" ToolTip="Delete Item">
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
                                        <asp:DataPager id="dpUserAgency" runat="server" PagedControlID="lvUserAgency">
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
					                        	</div>
				                        	</div>
				                        	<div class="form-group" id="user5">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cRole">Role:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                         
				                                                 <asp:DropDownList ID="ddlRoles" class="form-control" runat="server" DataSourceID="dsroles" DataTextField="roleDescription" DataValueField="RoleID"></asp:DropDownList>
				                                          
				                                                 <asp:SqlDataSource ID="dsroles" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT * FROM [Roles]"></asp:SqlDataSource>
				                                          
				                                        </div>
				                                    </div>
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cSupervisor">Supervisor:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                          
				                                                   <asp:DropDownList ID="ddlSupervisor" class="form-control" runat="server" DataSourceID="dsSupervisor" DataTextField="LastName" DataValueField="UserID"></asp:DropDownList>
				                                                   <asp:SqlDataSource ID="dsSupervisor" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT * FROM [Users] WHERE (([RoleID] = @RoleID) or ([RoleID] = @RoleID2) or ([RoleID] = @RoleID3) or ([RoleID] = @RoleID4))">
                                                                       <SelectParameters>
                                                                           <asp:Parameter DefaultValue="4" Name="RoleID" Type="Int32" />
                                                                           <asp:Parameter DefaultValue="6" Name="RoleID2" Type="Int32" />
                                                                           <asp:Parameter DefaultValue="8" Name="RoleID3" Type="Int32" />
                                                                             <asp:Parameter DefaultValue="10" Name="RoleID4" Type="Int32" />
                                                                       </SelectParameters>
                                                                   </asp:SqlDataSource>
				                                          <br />
				                                        </div>
				                                    </div>
				                                    <div class="col-xs-4">
				                                        
				                                    </div>
				                                </div>
				                            </div>
				                        </form>

				                        <hr class="line_break">
				                     
				                        	<div class="form-group" id="bankAndBranch">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-md-4">
				                                            <label for="cBank">Bank:</label>
				                                        </div>
				                                        <div class="col-md-8">
				                                           
				                                                  <asp:DropDownList ID="ddlbanks" runat="server" class="form-control" OnSelectedIndexChanged="ddlbanks_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="BankName" DataValueField="BankID" OnDataBound="ddlbanks_DataBound">
                                            
                                                                      
                                            </asp:DropDownList>  <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT [BankID], [BankName] FROM [Banks] where creationstatus='Approved'"></asp:SqlDataSource>
                                                              <br />
				                                        </div>
				                                    </div>
				                                </div>
				                                
				                                <div class="col-xs-12" id="bankAndBranch">
				                                <test id="bankBranchDropdown">
				                                    <div class="col-xs-4">
				                                        <div class="col-md-4">
				                                            <label for="cBankBranch">Bank Branch:</label>
				                                        </div>
				                                        <div class="col-md-8">
				                                           
				                                                   <asp:DropDownList ID="ddlBranch" class="form-control" AutoPostBack="True"  runat="server"></asp:DropDownList>
				                                          
				                                        </div>
				                                    </div>
				                                    </test>
				                                </div>
				                               	<div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                    	<div class="col-xs-4">
				                                    <asp:Button ID="btnAddBank" class="btn btn-default saveBankAndBranches" runat="server" Text="Add Bank/Branch" OnClick="btnAddBank_Click" />
                                                            <br><br>

				                                        </div>
				                                    </div>
				                                    <div class="col-xs-4">
				                                        
				                                    </div>
				                                    <div class="col-xs-4">
				                                        
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="col-xs-12">
				                            	<div class="col-xs-12">
						                            <div class="col-xs-12" id="createUserBankTable">
                                                         <asp:UpdatePanel runat="server">
                                            <ContentTemplate>
						                              <table id="example1" class="display table table-bordered table-striped">
                                                        <thead><tr>
                                                            <th>Bank Name</th>
                                                            <th>Bank Branch</th>
                                                     
                                                                <th></th>
                                                            </tr>
                                                            </thead>
                                                        <tbody>
                                            <asp:ListView ID="lvBanks" runat="server" OnDataBound="lvBanks_DataBound"
                                                OnPagePropertiesChanging="lvBanks_PagePropertiesChanging" DataKeyNames="UserBankID"  OnItemCommand="lvBanks_ItemCommand">
                                       
                                                <ItemTemplate>
                                                    <tr>
                                                           <asp:Literal ID="ltUserBankID" runat="server" Text='<%# Eval("UserBankID") %>' Visible="false" />
                                                    
                                                        <td><%# Eval("BankName") %></td>
                                                         <td><%# Eval("BranchName") %> </td>
                                                      
                                                        <td>  <asp:LinkButton ID="btnRemoveItem" runat="server"
                                                        CommandName="deleteua" ToolTip="Delete Item">
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
                                        <asp:DataPager id="dpBanks" runat="server" PagedControlID="lvBanks">
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
                                                    </ContentTemplate>
                                                             </asp:UpdatePanel>
					                        	</div>
				                        	</div>
				                      
				                        <hr class="line_break">
				                    
				                        	<div class="form-group" id="others">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cAgencyToBeCredited">Agency to be Credited:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                           
				                                              <asp:DropDownList ID="ddlAgencytobeCredited" class="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="Agency" DataValueField="HomeAgencyID"></asp:DropDownList>
				                                          
				                                        </div>
				                                    </div>
				                                </div>
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cRevenueCode">Revenue Code:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                           
				                                                <asp:DropDownList ID="ddlRevenueCode" class="form-control" runat="server" DataSourceID="dsRevenueCode" DataTextField="Code" DataValueField="RevenueCodeID"></asp:DropDownList>
				                                          
				                                                <asp:SqlDataSource ID="dsRevenueCode" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT * FROM [RevenueCode] where creationStatus='Approved'"></asp:SqlDataSource>
				                                              <br />
				                                        </div>
				                                    </div>
				                                </div>
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cFundingSource">Funding Source:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                           
				                                               <asp:DropDownList ID="ddlFundSource" class="form-control" runat="server" DataSourceID="dsFundSource" DataTextField="Code" DataValueField="FundSourceID"></asp:DropDownList>
				                                               <asp:SqlDataSource ID="dsFundSource" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT * FROM [FundSource] where  creationStatus='Approved'"></asp:SqlDataSource>
				                                           <br />
				                                        </div>
				                                    </div>
				                                </div>
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                          <asp:Button ID="btnUserRevenueAdd" class="btn btn-default saveOthers" runat="server" Text="Add" OnClick="btnUserRevenueAdd_Click" />
				                                         <br />
                                                               </div>
				                                    </div>
				                                    <div class="col-xs-4">
				                                        
				                                    </div>
				                                    <div class="col-xs-4">
				                                        
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="col-xs-12">
				                            	<div class="col-xs-12">
						                            <div class="col-xs-12" id="createUserOthersTable">
						                               <asp:UpdatePanel runat="server">
                                            <ContentTemplate>
						                              <table id="example1" class="display table table-bordered table-striped">
                                                        <thead><tr>
                                                            <th>Revenue Code</th>
                                                            <th>Agency to be Credited</th>
                                                       <th>Funding Source</th>
                                                     
                                                                <th></th>
                                                            </tr>
                                                            </thead>
                                                        <tbody>
                                            <asp:ListView ID="lvRevenue" runat="server" OnDataBound="lvRevenue_DataBound"
                                                OnPagePropertiesChanging="lvRevenue_PagePropertiesChanging" DataKeyNames="UserRevenueID"  OnItemCommand="lvRevenue_ItemCommand">
                                       
                                                <ItemTemplate>
                                                    <tr>
                                                           <asp:Literal ID="ltUserRevenueID" runat="server" Text='<%# Eval("UserRevenueID") %>' Visible="false" />
                                                    
                                                        <td><%# Eval("Description") %></td>
                                                         <td><%# Eval("Agency") %> </td>
                                                       <td><%# Eval("Code") %> </td>
                                                      
                                                        <td>  <asp:LinkButton ID="btnRemoveItem" runat="server"
                                                        CommandName="deleteua" ToolTip="Delete Item">
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
                                        <asp:DataPager id="dpUserRevenue" runat="server" PagedControlID="lvRevenue">
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
                                                    </ContentTemplate>
                                                             </asp:UpdatePanel>
						                        	</div>
					                        	</div>
				                        	</div>
				                      
				                        <hr class="line_break">
				                      
				                        	<div class="form-group" id="user4">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cStatus">Status:</label>
				                                        </div>
				                                        <div class="col-xs-8">
                                                                   <asp:DropDownList ID="ddlStatus" class="form-control" runat="server">
                                                                       <asp:ListItem Value="0">Active</asp:ListItem>
                                                                       <asp:ListItem Value="1">Inactive</asp:ListItem>
                                                                       <asp:ListItem Value="2">Deactivated</asp:ListItem>
                                                                   </asp:DropDownList>
				                                          
				                                            
				                                        </div>
				                                    </div>
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-5">
				                                            <label for="cESignature">Add eSignature</label>
				                                        </div>
				                                        <div class="col-xs-7">
				                                          <asp:FileUpload ID="fuImage" runat="server" accept="image/png, image/jpeg"  />
				                                        </div>
				                                    </div>
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            
				                                        </div>
				                                        <div class="col-xs-8">
				                                      
                                                            <asp:Button ID="btnSubmit" class="btn btn-default saveUser" runat="server" Text="Submit For Approval" OnClick="btnSubmit_Click" />
				                                        </div>
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
    <script src="../plugins/datatables/js/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
	$('#example1').DataTable();
});
</script>
</asp:Content>
