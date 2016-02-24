﻿<%@ Page Title="Dorknozzle Address Book" Language="C#" MasterPageFile="~/Dorknozzle.Master" 
    AutoEventWireup="true" CodeBehind="AddressBook.aspx.cs" Inherits="Dorknozzle.AddressBook" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Address Book</h1>
    <p>
        <asp:LinkButton ID="addEmployeeButton" runat="server" Text="Add New Employee" OnClick="addEmployeeButton_Click" />
    </p> 
    <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" 
        AllowPaging="True" AllowSorting="True" DataKeyNames="EmployeeID" 
        DataSourceID="employeesDataSource" PageSize="3" EnableModelValidation="True" >
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="MobilePhone" HeaderText="Mobile Phone" />
            <asp:ButtonField CommandName="Select" Text="Select" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:DetailsView ID="employeeDetails" runat="server" AutoGenerateRows="False" 
        AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" 
        AutoGenerateInsertButton="True" DataKeyNames="EmployeeID" 
        DataSourceID="employeeDataSource" EnableModelValidation="True" >
        <Fields>
           <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID"
                InsertVisible="False" ReadOnly="True"
                SortExpression="EmployeeID" />
            <asp:TemplateField HeaderText="Department" SortExpression="DepartmentID">
                <EditItemTemplate>
                    <asp:DropDownList ID="didDbl" runat="server"
                        DataSourceID="departmentsDataSource"
                        DataTextField="Department" DataValueField="DepartmentID"
                        SelectedValue='<%# Bind("DepartmentID") %>' />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="didDdl" runat="server"
                        DataSourceID="departmentsDataSource"
                        DataTextField="Department"
                        DataValueField="DepartmentID"
                        SelectedValue='<%# Bind("DepartmentID") %>' />                    
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="didDdl" runat="server"
                        DataSourceID="departmentsDataSource"
                        DataTextField="Department"
                        DataValueField="DepartmentID"
                        SelectedValue='<%# Bind("DepartmentID") %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Name"
                SortExpression="Name" />
            <asp:BoundField DataField="Username" HeaderText="Username"
                SortExpression="Username" />
            <asp:BoundField DataField="Password" HeaderText="Password"
                SortExpression="Password" />
            <asp:BoundField DataField="Address" HeaderText="Address"
                SortExpression="Address" />
            <asp:BoundField DataField="City" HeaderText="City"
                SortExpression="City" />
            <asp:BoundField DataField="MobilePhone" HeaderText="MobilePhone"
                SortExpression="MobilePhone" />
            <asp:BoundField DataField="State" HeaderText="State"
                SortExpression="State" />
            <asp:BoundField DataField="Zip" HeaderText="Zip"
                SortExpression="Zip" />
            <asp:BoundField DataField="HomePhone" HeaderText="HomePhone"
                SortExpression="HomePhone" />
            <asp:BoundField DataField="Extension" HeaderText="Extension"
                SortExpression="Extension" />
        </Fields>
        <HeaderTemplate>
            <%#Eval("Name")==null ? "Adding New Employee" : Eval("Name")  %>
        </HeaderTemplate>
    </asp:DetailsView>
    <br />
    <asp:SqlDataSource ID="employeesDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Dorknozzle %>" 
        SelectCommand="SELECT [EmployeeID], [Name], [City], 
        [MobilePhone] FROM [Employees] ORDER BY [Name]" >
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="employeeDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Dorknozzle %>" 
        DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = @EmployeeID" 
        InsertCommand="INSERT INTO [Employees] ([DepartmentID], [Username], [Name], 
            [Password], [Address], [City], [Zip], [State], [HomePhone], [MobilePhone], 
            [Extension]) VALUES (@DepartmentID, @Username, @Name, @Password, @Address, 
            @City, @Zip, @State, @HomePhone, @MobilePhone, @Extension)" 
        SelectCommand="SELECT [EmployeeID], [DepartmentID], [Username], [Name], [Password], 
            [Address], [City], [Zip], [State], [HomePhone], [MobilePhone], [Extension] 
            FROM [Employees] WHERE ([EmployeeID] = @EmployeeID)" 
        UpdateCommand="UPDATE [Employees] SET [DepartmentID] = @DepartmentID, 
            [Username] = @Username, [Name] = @Name, [Password] = @Password, 
            [Address] = @Address, [City] = @City, [Zip] = @Zip, [State] = @State, 
            [HomePhone] = @HomePhone, [MobilePhone] = @MobilePhone, 
            [Extension] = @Extension WHERE [EmployeeID] = @EmployeeID" >
        <DeleteParameters>
            <asp:Parameter Name="EmployeeID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DepartmentID" Type="Int32" />
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Zip" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="HomePhone" Type="String" />
            <asp:Parameter Name="MobilePhone" Type="String" />
            <asp:Parameter Name="Extension" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="grid" Name="EmployeeID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="DepartmentID" Type="Int32" />
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Zip" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="HomePhone" Type="String" />
            <asp:Parameter Name="MobilePhone" Type="String" />
            <asp:Parameter Name="Extension" Type="String" />
            <asp:Parameter Name="EmployeeID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="departmentsDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Dorknozzle %>" 
        SelectCommand="SELECT [Department], [DepartmentID] 
            FROM [Departments]">
    </asp:SqlDataSource>

</asp:Content>
