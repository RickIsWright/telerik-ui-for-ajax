﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server" />
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadAjaxLoadingPanel ID="LoadingPanel1" runat="server"></telerik:RadAjaxLoadingPanel>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
            </Scripts>
        </telerik:RadScriptManager>

        <telerik:RadSkinManager ID="RadSkinManager1" Runat="server" ShowChooser="True">
        </telerik:RadSkinManager>

        <script type="text/javascript">
        //Put your JavaScript code here.
        </script>

        <div>
            <telerik:RadDropDownList ID="CountriesDropDownList" runat="server" DataSourceID="CountriesDataSource" DataTextField="Country" DataValueField="Country" AppendDataBoundItems="true" AutoPostBack="true" DropDownHeight="200px" Width="300px">
                <Items>
                    <telerik:DropDownListItem Text="Please, select country" />
                </Items>
            </telerik:RadDropDownList>
            <telerik:RadGrid ID="CustomersGrid" runat="server" 
                AutoGenerateDeleteColumn="True" AllowAutomaticDeletes="true" 
                AllowAutomaticInserts="true" 
                AutoGenerateEditColumn="True" AllowAutomaticUpdates="true" 
                DataSourceID="CustomersDataSource">
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="CustomerID" DataSourceID="CustomersDataSource">
                    <Columns>
                        <telerik:GridButtonColumn CommandName="Select" Text="Select" UniqueName="Select">
                        </telerik:GridButtonColumn>
                        <telerik:GridBoundColumn DataField="CustomerID" FilterControlAltText="Filter CustomerID column" HeaderText="CustomerID" ReadOnly="True" SortExpression="CustomerID" UniqueName="CustomerID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CompanyName" FilterControlAltText="Filter CompanyName column" HeaderText="CompanyName" SortExpression="CompanyName" UniqueName="CompanyName">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ContactName" FilterControlAltText="Filter ContactName column" HeaderText="ContactName" SortExpression="ContactName" UniqueName="ContactName">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ContactTitle" FilterControlAltText="Filter ContactTitle column" HeaderText="ContactTitle" SortExpression="ContactTitle" UniqueName="ContactTitle">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="City" FilterControlAltText="Filter City column" HeaderText="City" SortExpression="City" UniqueName="City">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Country" FilterControlAltText="Filter Country column" HeaderText="Country" SortExpression="Country" UniqueName="Country">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PostalCode" FilterControlAltText="Filter PostalCode column" HeaderText="PostalCode" SortExpression="PostalCode" UniqueName="PostalCode">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>

            <asp:SqlDataSource ID="CustomersDataSource" runat="server" 
                ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
                DeleteCommand="DELETE FROM [Customers] WHERE [CustomerID] = @CustomerID" 
                InsertCommand="INSERT INTO [Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [PostalCode]) VALUES (@CustomerID, @CompanyName, @ContactName, @ContactTitle, @City, @Country, @PostalCode)" 
                SelectCommand="SELECT [CustomerID], [CompanyName], [ContactName], [ContactTitle], [City], [Country], [PostalCode] FROM [Customers] WHERE ([Country] = @Country)" 
                UpdateCommand="UPDATE [Customers] SET [CompanyName] = @CompanyName, [ContactName] = @ContactName, [ContactTitle] = @ContactTitle, [City] = @City, [Country] = @Country, [PostalCode] = @PostalCode WHERE [CustomerID] = @CustomerID">
                <DeleteParameters>
                    <asp:Parameter Name="CustomerID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CustomerID" Type="String" />
                    <asp:Parameter Name="CompanyName" Type="String" />
                    <asp:Parameter Name="ContactName" Type="String" />
                    <asp:Parameter Name="ContactTitle" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="PostalCode" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="CountriesDropDownList" DefaultValue="NULL" Name="Country" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CompanyName" Type="String" />
                    <asp:Parameter Name="ContactName" Type="String" />
                    <asp:Parameter Name="ContactTitle" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="PostalCode" Type="String" />
                    <asp:Parameter Name="CustomerID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="CountriesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT DISTINCT [Country] FROM [Customers] ORDER BY [Country]"></asp:SqlDataSource>
        </div>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="LoadingPanel1">
            <AjaxSettings>
                <telerik:AjaxSetting AjaxControlID="CountriesDropDownList" >
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="CustomersGrid" LoadingPanelID="LoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
                <telerik:AjaxSetting AjaxControlID="CustomersGrid">
                    <UpdatedControls>
                        <telerik:AjaxUpdatedControl ControlID="CustomersGrid" LoadingPanelID="LoadingPanel1" />
                    </UpdatedControls>
                </telerik:AjaxSetting>
            </AjaxSettings>
        </telerik:RadAjaxManager>
    </form>
</body>
</html>
