<%@ Page Title="" Language="C#" MasterPageFile="~/View/Public/PAGEMASTER.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="OCTAVAIPUC.View.Public.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="layout layout-vertical layout-left-navigation layout-below-toolbar">


        <div class="content">
            <div id="login" class="p-8">
                <div class="form-wrapper md-elevation-8 p-8">
                    <div class="logo bg-primary">
                        <span>IPUC</span>
                    </div>
                    <div class="title mt-4 mb-8">Iniciar sesión</div>
                    <div>
                        <div class="form-group mb-4">
                            <input type="text" runat="server" id="TextUsuario" class="form-control"
                                aria-describedby="emailHelp"
                                placeholder="Usuario" />
                            <label for="loginFormInputEmail">Usuario</label>
                        </div>
                        <div class="form-group mb-4">
                            <input type="password" class="form-control" runat="server" id="TextPass"
                                placeholder="Contraseña" />
                            <label for="loginFormInputPassword">Contraseña</label>
                        </div>
                        <div class="remember-forgot-password row no-gutters align-items-center justify-content-between pt-4">
                            <div class="form-check remember-me mb-4">
                            </div>
                            <a href="#" class="forgot-password text-primary mb-4">¿Olvide la contraseña?</a>
                        </div>
                        <asp:Button ID="BtnInicio" runat="server" Text="INICIAR SESION" OnClick="ValidarUsuario" class="submit-button btn btn-block btn-primary my-4 mx-auto" />
                    </div>
                    <div class="title mt-4 mb-8" id="cerrar">
                        <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="alert alert-danger">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <asp:Label ID="Alert" runat="server" Text=""></asp:Label>
                        </asp:Panel>
                    </div>
                    <div class="register d-flex flex-column flex-sm-row align-items-center justify-content-center mt-8 mb-6 mx-auto">
                        <span class="text mr-sm-2">¿No tienes una cuenta?</span>
                        <a class="link text-primary" href="pages-auth-register.html">Crear una cuenta</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
