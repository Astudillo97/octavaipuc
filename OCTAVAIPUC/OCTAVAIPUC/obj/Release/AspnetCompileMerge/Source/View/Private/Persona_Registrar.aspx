<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/PAGEMASTER.Master" AutoEventWireup="true" CodeBehind="Persona_Registrar.aspx.cs" Inherits="OCTAVAIPUC.View.Private.Persona_Registrar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Encabezado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">
    <div class="doc forms-doc page-layout simple full-width">

        <!-- HEADER -->
        <div class="page-header bg-primary text-auto p-6">
            <h2 class="doc-title" id="content">Formulario de Registros de Usuarios</h2>
        </div>
        <!-- / HEADER -->

        <!-- CONTENT -->
        <div class="page-content p-6">
            <div class="col-12">
                <div class="example">
                    <div class="description">
                        <div class="description-text">
                            <p class="h2">Formulario</p>
                        </div>
                    </div>
                    <div class="source-preview-wrapper">
                        <div class="preview">
                            <div class="preview-elements">
                                <div class="container">
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="TextIdentificacion" class="col-form-label">Identificación</label>
                                            <asp:TextBox ID="TextIdentificacion" TextMode="Number" CssClass="form-control" placeholder="Ingresar Identificación" runat="server" required=""></asp:TextBox>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class="col-form-label">Tipo Identificación</label>
                                            <asp:DropDownList ID="DropTipoIdentificacion" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0" Text="-Selecionar Tipo documento-"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-form-label">Nombre</label>
                                        <asp:TextBox ID="TextNombre" CssClass="form-control" required="" placeholder="Ingresar Nombre" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-form-label">Apellido</label>
                                        <asp:TextBox ID="TextApellido" CssClass="form-control" required="" placeholder="Ingresar Apellido" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-form-label">Celular</label>
                                        <asp:TextBox ID="TextCelular" CssClass="form-control" TextMode="Number" required="" placeholder="(999) 999-9999" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-form-label">Correo</label>
                                        <asp:TextBox ID="TextCorreo" TextMode="Email" CssClass="form-control" required="" placeholder="Example@Example.com" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label class="control-label">Departamento</label>
                                            <asp:DropDownList ID="DropDownDepartamento" AutoPostBack="true" OnSelectedIndexChanged="DropDownDepartamento_TextChanged" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0" Text="-Selecionar Departamento-"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label class="control-label">Municipio</label>
                                            <asp:DropDownList ID="DropDownMunicipio" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0" Text="-Selecionar Municipio-"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Dirección</label>
                                        <asp:TextBox ID="TextDireccion" TextMode="MultiLine" required="" placeholder="Barrio: Centro, Cra. 13 # 3-65" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-4">
                                            <label class="control-label">Usuario</label>
                                            <asp:TextBox ID="TextUser" placeholder="Usuaria o Nick" required="" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class="control-label">Contraseña</label>
                                            <asp:TextBox ID="TextPass" TextMode="Password" required="" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="form-group  col-md-4">
                                            <label class="control-label">Rol</label>
                                            <asp:DropDownList ID="DropDownRol" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="alert alert-danger ">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                            <asp:Label ID="Alert" runat="server" Text=""></asp:Label>
                                        </asp:Panel>
                                    </div>
                                    <hr />
                                    <div class="text-center">
                                        <asp:Button ID="ButtonRegistrar" OnClick="ButtonRegistrar_Click" CssClass="btn btn-primary" runat="server" Text="Registrar" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- / WIDGET 1 -->
        </div>
        <!-- / CONTENT -->
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Pie" runat="server">
</asp:Content>
