<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="upload.aspx.cs" Inherits="ProjectIDEMO.upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="ชื่อ"></asp:Label>
        <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="รายละเอียด"></asp:Label>
        <asp:TextBox ID="txtdes" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="เลือก"></asp:Label>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="ปรเภทเอกสาร"></asp:Label>
        <asp:DropDownList ID="ddldoctype" runat="server">
            <asp:ListItem>กรุณาเลือกประเภทเอกสาร</asp:ListItem>
            <asp:ListItem>ประกาศ</asp:ListItem>
            <asp:ListItem>แบบฟอร์ม</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="วันที่อัพโหลด"></asp:Label>
        <asp:TextBox ID="txtdateupload" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Text="วันที่หมดอายุ"></asp:Label>
        <asp:TextBox ID="txtdateexpire" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:RadioButtonList ID="optFundtype" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
            <asp:ListItem>กยศ</asp:ListItem>
            <asp:ListItem>กรอ</asp:ListItem>
            <asp:ListItem>ทุนภายนอก</asp:ListItem>
            <asp:ListItem>ทุนภายใน</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload" />
        <br />
        <asp:Label ID="lberror" runat="server"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="name" DataNavigateUrlFormatString="~/uploadfile{0}" DataTextField="name" HeaderText="Filename" />
            </Columns>
        </asp:GridView>
        <br />
    </form>
</body>
</html>
