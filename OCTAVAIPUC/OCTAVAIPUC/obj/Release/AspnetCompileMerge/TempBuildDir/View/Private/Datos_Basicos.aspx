<%@ Page Title="" Language="C#" MasterPageFile="~/View/Private/PAGEMASTER.Master" AutoEventWireup="true" CodeBehind="Datos_Basicos.aspx.cs" Inherits="OCTAVAIPUC.View.Private.Datos_Basicos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Encabezado" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenido" runat="server">
    <div class="doc forms-doc page-layout simple full-width">

        <!-- HEADER -->
        <div class="page-header bg-primary text-auto p-6">
            <h2 class="doc-title" id="content">Datos Basicos de la Persona</h2>
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
                                        <div class="form-group col-md-4">
                                            <label class="col-form-label">Departamento</label>
                                            <asp:DropDownList ID="Departamento" AppendDataBoundItems="true" OnSelectedIndexChanged="DropDownDepartamento_TextChanged" AutoPostBack="true" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0" Text="Selecione"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class="col-form-label">Municipio</label>
                                            <asp:DropDownList ID="Municipio" AppendDataBoundItems="true" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0" Text="Selecione"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label class="control-label">Dirección</label>
                                            <asp:TextBox ID="TextDireccion" TextMode="MultiLine" required="" placeholder="Barrio: Centro, Cra. 13 # 3-65" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <label class="col-form-label">Profesión</label>
                                                <asp:DropDownList ID="Profesion" AppendDataBoundItems="true" CssClass="form-control" runat="server">
                                                    <asp:ListItem Value="0" Text="Selecione"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-form-label">Celular</label>
                                                <asp:TextBox ID="TextCelular" CssClass="form-control" TextMode="Number" required="" placeholder="(999) 999-9999" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label class="col-form-label">Celular</label>
                                                <asp:FileUpload ID="CargaImagen" runat="server"  class="btn btn-primary" />
                                            </div>
                                            <div class="demo-content">
                                                <img src="#" runat="server" id="imgPersonal" class="w-100 mb-4" alt="sunrise" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <asp:Panel ID="Alerta" Visible="false" runat="server" CssClass="alert alert-danger">
                                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                                <asp:Label ID="Alert" runat="server" Text=""></asp:Label>
                                            </asp:Panel>
                                        </div>
                                        <hr />
                                        <div class="text-center">
                                            <asp:Button ID="ButtonRegistrar" CssClass="btn btn-primary" runat="server" Text="Registrar" OnClick="ButtonRegistrar_Click" />
                                        </div>
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
