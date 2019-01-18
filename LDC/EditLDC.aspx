<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master"  ClientIDMode="AutoID" AutoEventWireup="true" CodeBehind="EditLDC.aspx.cs" Inherits="NCGDSasp.Admin.LDC.EditLDC" EnableEventValidation="false" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <asp:ScriptManager runat="server"></asp:ScriptManager>
    <div class="container-fluid">
                <section class="content-header">
                    <h1>
                        LDC Creation
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">LDC Creation</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="box box-default">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <form id="createLdcForm">
                                                <div class="form-group">
                                                    <div class="col-md-7">
                                                        <div class="col-md-12">
                                                            <div class="col-md-6">
                                                                <div class="col-md-4">
                                                                    <label for="cType">Type:</label>
                                                                </div>
                                                                <div class="col-md-8">
                                                                   
                                                                    <asp:DropDownList ID="ddlType" runat="server" class="form-control"
                                                >
                                                                        <asp:ListItem>Cash, Check, Forex, LDDAP-ADA</asp:ListItem>
                                                                        <asp:ListItem>ePayment</asp:ListItem>
                                                                        <asp:ListItem>Online</asp:ListItem>
                                            </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="col-md-4">
                                                                    <label for="dDate">Date Created:</label>
                                                                </div>
                                                                <div class="col-md-8">
                                                                    <div class="input-group date">
                                                                     <asp:TextBox ID="txtCreationDate" runat="server" class="form-control" type="date" required />
                                                                    </div>
                                                                    
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="col-md-6">
                                                                <div class="col-md-4">
                                                                    <label for="cBank">Bank:</label>
                                                                </div>
                                                                <div class="col-md-8">
                                                                 
                                                                   <asp:DropDownList ID="ddlbanks" runat="server" class="form-control" OnSelectedIndexChanged="ddlbanks_SelectedIndexChanged" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="BankName" DataValueField="BankID">
                                            
                                                                      
                                            </asp:DropDownList>
                                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT [BankID], [BankName] FROM [Banks]"></asp:SqlDataSource>
                                                                </div>
                                                            </div>
                                                            <test id="bankBranchDropdown">
                                                                <div class="col-md-6">
                                                                    <div class="col-md-4">
                                                                        <label for="cBankBranch">Bank Branch:</label>
                                                                    </div>
                                                                    <div class="col-md-8">
                                                                        
                                                                               <asp:DropDownList ID="ddlBranch" runat="server" class="form-control" AutoPostBack="True" 
                                                >
                                                                      
                                            </asp:DropDownList>
                                                                    </div>
                                                                </div>
                                                            </test>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="col-md-6">
                                                                <div class="col-md-4">
                                                                    <label for="dDate2">Collection Date:</label>
                                                                </div>
                                                                <div class="col-md-8">
                                                                    <div class="input-group date">
                                                                   <asp:TextBox ID="txtCollectionDate" runat="server" class="form-control" type="date" required />
                                                                    
                                                                 
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="col-md-4">
                                                                    <label for="dDate3">Date Deposited:</label>
                                                                </div>
                                                                <div class="col-md-8">
                                                                    <div class="input-group date">
                                                                         <asp:TextBox ID="txtDepositDate" runat="server" class="form-control" type="date" required />
                                                                
                                                                    </div><br />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="col-md-6">
                                                                <div class="col-md-4">
                                                                    <label for="dDate4">Date Credited:</label>
                                                                </div>
                                                                <div class="col-md-8">
                                                                    <div class="input-group date">
                                                                           <asp:TextBox ID="txtCreditedDate" runat="server" class="form-control" type="date" required />
                                                                   
                                                                    </div><br />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">

                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="col-md-6">
                                                                <div class="col-md-4">
                                                                    <label for="cClearingAccountNumber">Clearing Account Number:</label>
                                                                </div>
                                                                <div class="col-md-8">
                                                                    <asp:TextBox ID="txtClearing" runat="server" class="form-control" required />
                                                                   
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- START OFFICER INFO -->
                                                    <div class="col-md-5">
                                                        <div class="panel panel-default">
                                                            <div class="panel-heading">
                                                                Officer Information
                                                            </div>
                                                            <div class="panel-body">
                                                                <div class="col-md-12">
                                                                    <div class="col-md-4">
                                                                        <b>Officer Name:</b> <br />
                                                                    </div>
                                                                    <div class="col-md-8">
                                                                    <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="col-md-4">
                                                                        <b>Department:</b> <br />
                                                                    </div>
                                                                    <div class="col-md-8">
                                                                          <asp:Label ID="lblDepartment" runat="server" Text="Label"></asp:Label>
                                                                 
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="col-md-4">
                                                                        <b>Agency:</b> <br />
                                                                    </div>
                                                                    <div class="col-md-8">
                                                                          <asp:Label ID="lblAgency" runat="server" Text="Label"></asp:Label>
                                                                 
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="col-md-4">
                                                                        <b>Region:</b> <br />
                                                                    </div>
                                                                    <div class="col-md-8">
                                                                            <asp:Label ID="lblRegion" runat="server" Text="Label"></asp:Label>
                                                                 
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="col-md-4">
                                                                        <b>Province:</b> <br />
                                                                    </div>
                                                                    <div class="col-md-8">
                                                                           <asp:Label ID="lblProvince" runat="server" Text="Label"></asp:Label>
                                                                 
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="col-md-4">
                                                                        <b>Municipality:</b> <br />
                                                                    </div>
                                                                    <div class="col-md-8">
                                                                            <asp:Label ID="lblMunicipality" runat="server" Text="Label"></asp:Label>
                                                                 
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <div class="col-md-4">
                                                                        <b>Barangay:</b> <br />
                                                                    </div>
                                                                    <div class="col-md-8">
                                                                            <asp:Label ID="lblBrgy" runat="server" Text="Label"></asp:Label>
                                                                 
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- END OFFICER INFO -->

                                                    <hr class="line_break">
                                                    <div class="form-group">
                                                        <div class="col-md-12">
                                                            <div class="col-md-4">
                                                                <div class="col-md-4">
                                                                    <label for="cUsername">Reference Entry:</label>
                                                                </div>
                                                                 <div class="col-md-8">
					                                            <button class="btn btn-default" data-toggle="modal" data-target="#referenceModal" id="tagButton"> Tag </button>
					                                        </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="col-md-4">
                                                                    <label for="cUsername">Attach Files:</label>
                                                                </div>
                                                                <div class="col-md-8">
                                                                <asp:FileUpload ID="fileUpload" runat="server" />   </div>
                                                            </div><br /><br /><br />
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="col-md-4">
                                                                <div class="col-md-4">
                                                                    <label for="cRemarks">Remarks:</label>
                                                                </div>
                                                                <div class="col-md-8">
                                                                  <asp:TextBox ID="txtRemark" runat="server" class="form-control"  required />
                                                                       <br /><br />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                           
                                                            <div class="col-md-12" id="manageLDCTable">
                                                                 <h1>CASH</h1>
                                                                 <div class="panel-body">
				                        <div class="col-xs-12" id="manageUserTable">
				                             <table id="example1" class="display table table-bordered table-striped">
                                                        <thead><tr>
                                                            <th>Nature of Collection</th>
                                                            <th>OR Number</th>
                                                            <th>Amount</th>
                                                        
                                                             
                                                               
                                                         
                                                            </tr>
                                                            </thead>
                                                        <tbody>
                                            <asp:ListView ID="lvCash" runat="server"
                                                DataKeyNames="CollectionDetailsID"    >
                                       
                                                <ItemTemplate>
                                                    <tr>
                                                           <asp:Literal ID="ltCollectionID" runat="server" Text='<%# Eval("CollectionID") %>' Visible="false" />
                                                    
                                                        <td><%# Eval("Type") %></td>
                                                          <td><%# Eval("ORNumber") %></td>
                                                         <td><%# Eval("Amount","{0: #,###.00}") %></td>
                                               
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
                                                  <tfoot>
                                                                                  <tr runat="server">
                <td runat="server" style="">Total:
                    <asp:Label ID="lbltotal" runat="server" Text="0"></asp:Label>
                </td>
            </tr>
                                                 </tfoot>
                                                        </table>
						                        	</div>
                                                     <div class="panel-footer">
                                    <center>
                                      
                                    </center>
				                        </div>
				                        <div class="col-xs-12">
				                            
				                        </div>
				                    </div>
                                                            </div>
                                                               <div class="col-md-12" id="manageLDCTable">
 <h1>CHECK</h1>
                                                                 <div class="panel-body">
				                        <div class="col-xs-12" id="manageUserTable">
				                             <table id="example1" class="display table table-bordered table-striped">
                                                        <thead><tr>
                                                            <th>Nature of Collection</th>
                                                            <th>OR Number</th>
                                                            <th>Amount</th>
                                                        
                                                             
                                                               
                                                         
                                                            </tr>
                                                            </thead>
                                                        <tbody>
                                            <asp:ListView ID="lvCheck" runat="server"
                                                DataKeyNames="CollectionDetailsID"    >
                                       
                                                <ItemTemplate>
                                                    <tr>
                                                           <asp:Literal ID="ltCollectionID" runat="server" Text='<%# Eval("CollectionID") %>' Visible="false" />
                                                    
                                                        <td><%# Eval("Type") %></td>
                                                          <td><%# Eval("ORNumber") %></td>
                                                         <td><%# Eval("Amount","{0: #,###.00}") %></td>
                                               
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
                                                  <tfoot>
                                                                                  <tr runat="server">
                <td runat="server" style="">Total:
                    <asp:Label ID="lbTotalCheck" runat="server" Text="0"></asp:Label>
                </td>
            </tr>
                                                 </tfoot>
                                                        </table>
						                        	</div>
                                                     <div class="panel-footer">
                                    <center>
                                      
                                    </center>
				                        </div>
				                        <div class="col-xs-12">
				                            
				                        </div>
				                    </div>
                                                            </div>
                                                               <div class="col-md-12" id="manageLDCTable">
                                                                    <h1>FOREX</h1>
                                                                 <div class="panel-body">
				                        <div class="col-xs-12" id="manageUserTable">
				                             <table id="example1" class="display table table-bordered table-striped">
                                                        <thead><tr>
                                                            <th>Nature of Collection</th>
                                                            <th>OR Number</th>
                                                            <th>Amount</th>
                                                        
                                                             
                                                               
                                                         
                                                            </tr>
                                                            </thead>
                                                        <tbody>
                                            <asp:ListView ID="lvForex" runat="server"
                                                DataKeyNames="CollectionDetailsID"    >
                                       
                                                <ItemTemplate>
                                                    <tr>
                                                           <asp:Literal ID="ltCollectionID" runat="server" Text='<%# Eval("CollectionID") %>' Visible="false" />
                                                    
                                                        <td><%# Eval("Type") %></td>
                                                          <td><%# Eval("ORNumber") %></td>
                                                         <td><%# Eval("AmountInPHP","{0: #,###.00}") %></td>
                                               
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
                                                  <tfoot>
                                                                                  <tr runat="server">
                <td runat="server" style="">Total:
                    <asp:Label ID="lbTotalForex" runat="server" Text="0"></asp:Label>
                </td>
            </tr>
                                                 </tfoot>
                                                        </table>
						                        	</div>
                                                     <div class="panel-footer">
                                    <center>
                                      
                                    </center>
				                        </div>
				                        <div class="col-xs-12">
				                            
				                        </div>
				                    </div>
                                                            </div>
                                                               <div class="col-md-12" id="manageLDCTable">
 <h1>LDDAP-ADA</h1>
                                                                 <div class="panel-body">
				                        <div class="col-xs-12" id="manageUserTable">
				                             <table id="example1" class="display table table-bordered table-striped">
                                                        <thead><tr>
                                                            <th>Nature of Collection</th>
                                                            <th>OR Number</th>
                                                            <th>Amount</th>
                                                        
                                                             
                                                               
                                                         
                                                            </tr>
                                                            </thead>
                                                        <tbody>
                                            <asp:ListView ID="lvLLDAP" runat="server"
                                                DataKeyNames="CollectionDetailsID"    >
                                       
                                                <ItemTemplate>
                                                    <tr>
                                                           <asp:Literal ID="ltCollectionID" runat="server" Text='<%# Eval("CollectionID") %>' Visible="false" />
                                                    
                                                        <td><%# Eval("Type") %></td>
                                                          <td><%# Eval("ORNumber") %></td>
                                                         <td><%# Eval("Amount","{0: #,###.00}") %></td>
                                               
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
                                                  <tfoot>
                                                                                  <tr runat="server">
                <td runat="server" style="">Total:
                    <asp:Label ID="lbTotalLDDAP" runat="server" Text="0"></asp:Label>
                </td>
            </tr>
                                                 </tfoot>
                                                        </table>
						                        	</div>
                                                     <div class="panel-footer">
                                    <center>
                                      
                                    </center>
				                        </div>
				                        <div class="col-xs-12">
				                            
				                        </div>
				                    </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-xs-12">
                                                        <div class="col-xs-12">
                                                            <div class="pull-right">
                                                                <br />
                                                                <!--<a href="../reports/html/rptTR_LDChtml.php" class="btn btn-default">Preview </a>-->
                                                                      <asp:Button ID="btndraft" runat="server"  Text="Save as Draft " class="btn btn-default saveDraftLdc" OnClick="btndraft_Click" />
                                                                        <asp:Button ID="btnApproval" runat="server"  Text="Send for Approval " class="btn btn-default saveApprovalLdc" OnClick="btnApproval_Click" />
                           
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="referenceModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="referenceModalLabel" aria-hidden="true">
                        <div class="modal-lg" >
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                    <h3 id="referenceModalLabel">Masterlist</h3>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-6">
                                                        <div class="col-xs-2">
                                                            <label for="cSelect">Type:</label>
                                                        </div>

                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="form-group">
                                                <div class="col-xs-12">
                                                    <div class="col-xs-12">
                                                        <div class="col-xs-12">
                                                            <div >
                                                      
				                                  <div class="panel-body">
				                        <div class="col-xs-12" id="manageUserTable">
				                             <table id="example1" class="display table table-bordered table-striped">
                                                        <thead><tr>
                                                            <th>OR No.</th>
                                                            <th>Amount</th>
                                                           
                                                             
                                                               
                                                         
                                                            </tr>
                                                            </thead>
                                                        <tbody>
                                                               <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                   <Triggers>
        
            </Triggers>
                                                                   <ContentTemplate>
                                            <asp:ListView ID="lvFundSource" runat="server" OnDataBound="lvFundSource_DataBound"
                                                OnPagePropertiesChanging="lvFundSource_PagePropertiesChanging" DataKeyNames="CollectionID" OnItemCommand="lvFundSource_ItemCommand"   >
                                       
                                                <ItemTemplate>
                                                    <tr>
                                                           <asp:Literal ID="ltCollectionID" runat="server" Text='<%# Eval("CollectionID") %>' Visible="false" />
                                                    
                                                           <td><%# Eval("ORNumber") %></td>
                                                         <td><%# Eval("TotalAmount","{0: #,###.00}") %></td>
                                                        <td>
                                                            <span class='<%# Eval("LDCNumber").ToString() == "0" ? "label label-danger" : "label label-success"%>'>
                                                                <%#Eval("LDCNumber").ToString() == "0" ? "Tagged" : "No Tag" %>
                                                            </span>
                                                        </td>
                                                          <td>
                                                         
                                                              <asp:LinkButton ID="btnUntag" runat="server" class="btn btn-default " UseSubmitBehavior="false"  text="Remove" Visible='<%# Eval("LDCNumber").ToString() == "0" ? true : false%>'
                                                         ToolTip="Remove Tag" CommandName="RemoveTag" >
                                                        </asp:LinkButton>
                                                           
                                                               
                                                               <asp:LinkButton ID="btnTag" runat="server" class="btn btn-default " UseSubmitBehavior="false"  text="Tag" Visible='<%# Eval("LDCNumber").ToString() != "0" ? true : false%>'
                                                         ToolTip="Tag OR" CommandName="TagOR" >
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
                                                                       
                                                                       </ContentTemplate>
                                                                   </asp:UpdatePanel>
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
                                    
                                        <div class="col-xs-12">
                                            <div id="showMasterlistTable">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                    <button class="btn btn-primary saveInsert" id="saveInsert" data-dismiss="modal">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

</asp:Content>
