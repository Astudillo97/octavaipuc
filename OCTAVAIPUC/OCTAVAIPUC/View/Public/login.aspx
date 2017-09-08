<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="OCTAVAIPUC.View.Public.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextUsuario" CssClass="form-control" placeholder="Usuario" runat="server"></asp:TextBox>
            <asp:TextBox ID="TextPass" TextMode="Password" CssClass="form-control" placeholder="Contraseña" runat="server"></asp:TextBox>
            <asp:Button ID="ButtonValidar" CssClass="btn btn-success" OnClick="ButtonValidar_Click" runat="server" Text="Ingresar" />
            <div class="col-md-12 text-left" id="cerrar">
                <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="alert alert-danger">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <asp:Label ID="Alert" runat="server" Text=""></asp:Label>
                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
