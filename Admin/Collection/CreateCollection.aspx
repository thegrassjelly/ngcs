<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="CreateCollection.aspx.cs" Inherits="NCGDSasp.Admin.Collection.CreateCollection1"  EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <style type="text/css">
        .auto-style1 {
            position: relative;
            min-height: 1px;
            float: left;
            width: 33.33333333333333%;
            left: 0px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }
          .auto-style3 {
              position: relative;
              min-height: 1px;
              float: left;
              width: 100%;
              left: -1px;
              top: -10px;
              padding-left: 15px;
              padding-right: 15px;
          }
          .auto-style4 {
              position: relative;
              min-height: 1px;
              float: left;
              width: 33.33333333333333%;
              left: 1px;
              top: -10px;
              padding-left: 15px;
              padding-right: 15px;
          }
    </style>
    <div class="container-fluid">
			<section class="content-header">
				<h1>
					Create Collection
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Create Collection </li>
				</ol>
			</section>
			<section class="content">
				<div class="box box-default">
					<div class="box-body">
						<div class="row">
				            <div class="col-xs-12">
				                <div class="panel panel-default">
				                    <div class="panel-body">
				                        <form id="CollectionForm">
				                        	<div id="generalFields">
					                            <div class="form-group">
					                                <div class="col-xs-12">
					                                    <div class="col-xs-4">
					                                        <div class="col-xs-4">
					                                            <label for="cOrNumber">OR Number:</label>
					                                        </div>
					                                        <div class="col-xs-8">
					                                           
                                                                <asp:TextBox ID="txtORNo"  class="form-control" runat="server"></asp:TextBox> <br />
					                                        </div>
					                                    </div>
					                                </div>
					                            </div>
					                            <div class="form-group">
					                                <div class="col-xs-12">
					                                    <div class="col-xs-4">
					                                        <div class="col-xs-4">
					                                            <label for="cTotalAmount">Total Amount:</label>
					                                        </div>
					                                        <div class="col-xs-8">
					                                           <asp:TextBox ID="txtTotalAmount"  class="form-control" runat="server" TextMode="Number"></asp:TextBox> <br />
					                                       </div>
					                                    </div>
					                                </div>
					                            </div>
				                            </div>
				                            <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-12" id="createCollectionTable">
                                                        <asp:Panel ID="pnlCash" runat="server">
                                                             <div class="panel-body">
				                        <div class="col-xs-12" id="manageUserTable">

				                             <table id="example1" class="display table table-bordered table-striped">
                                                        <thead><tr>
                                                            <th>Type</th>
                                                            <th>Date of Collection</th>
                                                            <th>Fund Code</th>
                                                            <th>Revenue Account</th>
                                                                <th>Agency to be Credited</th>
                                                             <th>Currency</th>
                                                                <th>Amount</th>
                                                                <th>Amount in OC</th>
                                                                <th>Amount in PHP</th>
                                                                <th>Action</th>
                                                            </tr>

                                                            </thead>

                                                        <tbody>
                                            <asp:ListView ID="lvCollectionCash" runat="server" OnDataBound="lvCollectionCash_DataBound"
                                                OnPagePropertiesChanging="lvCollectionCash_PagePropertiesChanging" DataKeyNames="CollectionDetailsID" OnItemCommand="lvCollectionCash_ItemCommand"   >
                                    

                                                <ItemTemplate>
                                                    <tr>
                                                           <asp:Literal ID="ltCollectionDetailsID" runat="server" Text='<%# Eval("CollectionDetailsID") %>' Visible="false" />
                                                    
                                                          <td><%# Eval("Type") %></td>
                                                         <td><%# Eval("DateOfCollection") %></td>
                                                         <td><%# Eval("Code") %></td>
                                                         <td><%# Eval("Name") %></td>
                                                   <td><%# Eval("Agency") %></td>
                                                       <td><%# Eval("Currency") %></td>
                                                        
                                                         <td><%# Eval("Amount","{0: #,###.00}") %></td>
                                                         <td><%# Eval("AmountInorigCurrency","{0: #,###.00}") %></td>
                                                 <td><%# Eval("AmountInPHP","{0: #,###.00}") %></td>
                                                      <td>  

                                                        <asp:LinkButton ID="btnRemoveItem" runat="server" 
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
                                        <asp:DataPager id="dpCollectionCash" runat="server" PagedControlID="lvCollectionCash">
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
				                        <div class="auto-style3">
				                            
				                        </div>
				                    </div>
                                                 
                                                        </asp:Panel>
                                               
				                        			</div>
				                                </div>
				                            </div>
				                            
				                            <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
					                                        <label for="cSelect">Type:</label>
					                                    </div>
					                                    <div class="col-xs-8">
					                                       <asp:DropDownList ID="ddlType" class="form-control" runat="server" OnSelectedIndexChanged="ddlType_SelectedIndexChanged" AutoPostBack="true">
                                                    <asp:ListItem Value="Cash">Cash</asp:ListItem>
                                                     <asp:ListItem Value="Check">Check</asp:ListItem>
                                                     <asp:ListItem Value="Forex">Forex</asp:ListItem>
                                                     <asp:ListItem Value="LDDAP-ADA">LDDAP-ADA</asp:ListItem>
                                                     <asp:ListItem Value="onlineCollection">onlineCollection</asp:ListItem>
                                                     <asp:ListItem Value="ePayment">ePayment</asp:ListItem>
                                                </asp:DropDownList> <br />
					                                    </div>
				                                    </div>
				                                </div>
				                            </div>
			                                <div class="form-group" id="createCollectionForm">
                                               
                                                         <div class="form-group" runat="server" id="vischeckNo" visible="false"  >
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cBankName">Check Number:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                         <asp:TextBox ID="txtCheckNo"  class="form-control" runat="server" ></asp:TextBox> 
                                                    <br />
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
                                                 <div class="form-group" runat="server" id="visLDDAP" visible="false"  >
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cBankName">LDDAP-ADA Number:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                         <asp:TextBox ID="txtLDDAP"  class="form-control" runat="server" ></asp:TextBox> 
                                                    <br />
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
                                                   <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cBankName">Fund Code:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                        
                                                          <asp:DropDownList ID="ddlFundCode" runat="server" class="form-control"  DataSourceID="SqlDataSource5" DataTextField="description" DataValueField="FundSourceID">
                                            
                                                                      
                                            </asp:DropDownList>  <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT * FROM [FundSource] where CreationStatus='Approved'"></asp:SqlDataSource>
                                            <br />
				                                        </div>
                                                          </div>
                                                          <div class="col-xs-4" runat="server"  id="visDateCol" visible="false" >
				                                        <div class="col-xs-4">
				                                            <label for="cEmail">Date of Collection:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                              <asp:TextBox ID="txtDateCol" class="form-control" runat="server" type="date"></asp:TextBox>
				                                       </div>
				                                    </div>
				                                  
				                                </div>
				                            </div>
			
					  <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cBankName">Revenue Account:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                        
                                                          <asp:DropDownList ID="ddlRevenue" runat="server" class="form-control"  DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="revenueCodeID">
                                            
                                                                      
                                            </asp:DropDownList>  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT * FROM [RevenueCode] where CreationStatus='Approved'"></asp:SqlDataSource>
                                            <br />
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				
                                                      <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cBankName">Agency to be  Credited:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                        
                                                          <asp:DropDownList ID="ddlAgency" runat="server" class="form-control"  DataSourceID="SqlDataSource2" DataTextField="Agency" DataValueField="HomeAgencyID">
                                            
                                                                      
                                            </asp:DropDownList>  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NGCDSConnectionString %>" SelectCommand="SELECT * FROM [HomeAgency] where CreationStatus='Approved'"></asp:SqlDataSource>
                                            <br />
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
                                                       <div class="form-group" runat="server" id="visOrigCur" visible="false" >
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cBankName">Amount Original Currency:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                         <asp:TextBox ID="txtAmountOrig"  class="form-control" runat="server" ></asp:TextBox> 
                                                    <br />
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
                                                       <div class="form-group" runat="server" id="visCurrency" visible="false" >
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cBankName">Currency</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                        
                                                          <asp:DropDownList ID="ddlCurrency" runat="server" class="form-control">
                                                              <asp:ListItem>PHP</asp:ListItem>
                                            </asp:DropDownList>
                                                                      
                                            <br />
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
                                                       <div class="form-group" runat="server" id="visForex" visible="false">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cUsername">Forex:</label>
				                                        </div>
				                                        <div class="col-xs-8">
                                                            <asp:TextBox ID="txtForex" class="form-control" runat="server"></asp:TextBox>
                                                            <br />
				                                       </div>
				                                    </div>
				                                    <div class="auto-style1">
				                                        <div class="col-xs-4">
				                                            <label for="cEmail">Amount in PHP:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                              <asp:TextBox ID="txtAmountinPHP" class="form-control" runat="server"></asp:TextBox>
				                                       </div>
				                                    </div>
				                                </div>
				                            </div>
		
                                                        <div class="form-group" runat="server" id="visAmount" >
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                        <div class="col-xs-4">
				                                            <label for="cBankName">Amount:</label>
				                                        </div>
				                                        <div class="col-xs-8">
				                                         <asp:TextBox ID="txtAmount"  class="form-control" runat="server" TextMode="Number"></asp:TextBox> 
                                                    <br />
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
                                                       <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
                                                        <asp:Button ID="btnAdd" class="btn btn-default" runat="server" Text="Add Cash" OnClick="btnAdd_Click" />  
				                                    </div>
				                                </div>
				                            </div>
                                              


			                                </div>
			                                <div class="form-group">
				                                <div class="col-xs-12">
				                                    <div class="col-xs-4">
				                                    	<div class = "pull-right">
				                                        	
				                                        </div>
				                                    </div>
				                                    <div class="col-xs-4">
				                                        
				                                    </div>
				                                    <div class="col-xs-4">
				                                    	<div class = "pull-right">
				                                        
                                                                 <asp:Button ID="btnSubmit" class="btn btn-default" runat="server" Text="Save" OnClick="btnSubmit_Click"  />  
				                                   
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
			</section>
		</div>

</asp:Content>
