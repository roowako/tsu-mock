<%@ Page Language="VB" AutoEventWireup="false" CodeFile="profile.aspx.vb" Inherits="UI_profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TSU Alumin Tracer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/bootstrap.theme.min.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/normalize.css" rel="stylesheet" />
    <link href="../css/sidebar-theme.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>Personal Information</p>
            <ul style="list-style-type:none">
                <li> <span>Student Number : <label id="student_number" runat="server"></label></span> </li>
                <li> <span>Name : <label id="name" runat="server"></label></span> </li>
                <li> <span>Birthday : <label id="birthday" runat="server"></label></span> </li>
                <li> <span>Course : <label id="course" runat="server"></label></span> </li>
                <li> <span>Year Graduated : <label id="year_graduated" runat="server"></label></span> </li>
            </ul>
            
            <p>Update E-Mail Address</p>
            <ul style="list-style-type:none">
                <li> <span>Current E-Mail Address : <label id="email_address" runat="server"></label></span> </li>
                <li> <span>New E-Mail Address : <asp:TextBox id="new_email" runat="server"></asp:TextBox></span> </li>
                <li> <span>Confirm E-Mail Address : <asp:TextBox id="cnew_email" runat="server"></asp:TextBox></span> </li>
                <li> <asp:Button runat="server" Text="Update E-Mail" ID="btnUpdate_Email"/></li>
            </ul> 
            
            <p>Update Phone Number</p>
            <ul style="list-style-type:none">
                <li> <span>Current Phone Number : <label id="phone_number" runat="server"></label></span> </li>
                <li> <span>New Phone Number : <asp:TextBox id="new_number" runat="server"></asp:TextBox></span> </li>
                <li> <span>Confirm New Phone Number : <asp:TextBox id="cnew_number" runat="server"></asp:TextBox></span> </li>
                <li> <asp:Button runat="server" Text="Update Phone Number"/></li>
            </ul> 

            <p>Update Password</p>
            <ul style="list-style-type:none">
                <li> <span>Specify Old Password : <asp:TextBox id="old_password" runat="server"></asp:TextBox></span> </li>
                <li> <span>New Phone Number : <asp:TextBox id="new_password" runat="server"></asp:TextBox></span> </li>
                <li> <span>Confirm New Phone Number : <asp:TextBox id="cnew_password" runat="server"></asp:TextBox></span> </li>
                <li> <asp:Button runat="server" Text="Update Password"/></li>
            </ul> 
        </div>

    </form>
</body>
</html>
