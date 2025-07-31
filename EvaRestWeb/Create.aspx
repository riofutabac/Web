<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Create.aspx.cs" Inherits="Create" Async="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <title>Nuevo Restaurante - Evaluador</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            color: #333;
        }

        .header {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 20px 0;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .logo i {
            font-size: 2rem;
            color: #667eea;
        }

        .logo h1 {
            font-size: 1.5rem;
            font-weight: 700;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .breadcrumb {
            display: flex;
            align-items: center;
            gap: 10px;
            color: #666;
            font-size: 0.9rem;
        }

        .breadcrumb a {
            color: #667eea;
            text-decoration: none;
        }

        .breadcrumb a:hover {
            text-decoration: underline;
        }

        .main-content {
            padding: 40px 0;
        }

        .form-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .form-title {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-title i {
            font-size: 3rem;
            color: #667eea;
            margin-bottom: 15px;
            display: block;
        }

        .form-title h2 {
            font-size: 2rem;
            font-weight: 700;
            color: #333;
            margin-bottom: 10px;
        }

        .form-title p {
            color: #666;
            font-size: 1rem;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px;
            margin-bottom: 25px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        .form-label {
            display: flex;
            align-items: center;
            gap: 8px;
            font-weight: 600;
            color: #333;
            margin-bottom: 8px;
            font-size: 0.95rem;
        }

        .form-label i {
            color: #667eea;
            width: 16px;
        }

        .form-input, .form-select, .form-textarea {
            padding: 12px 16px;
            border: 2px solid #e1e5e9;
            border-radius: 12px;
            font-size: 1rem;
            font-family: inherit;
            transition: all 0.3s ease;
            background: white;
        }

        .form-input:focus, .form-select:focus, .form-textarea:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .form-textarea {
            resize: vertical;
            min-height: 100px;
        }

        .rating-options {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 10px;
            margin-top: 8px;
        }

        .rating-option {
            display: none;
        }

        .rating-label {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 15px 10px;
            border: 2px solid #e1e5e9;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
            background: white;
            text-align: center;
        }

        .rating-label:hover {
            border-color: #667eea;
            transform: translateY(-2px);
        }

        .rating-option:checked + .rating-label {
            border-color: #667eea;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
        }

        .rating-stars {
            font-size: 1.2rem;
            margin-bottom: 5px;
        }

        .rating-text {
            font-size: 0.8rem;
            font-weight: 500;
        }

        .cuisine-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
            gap: 10px;
            margin-top: 8px;
        }

        .cuisine-option {
            display: none;
        }

        .cuisine-label {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 15px 10px;
            border: 2px solid #e1e5e9;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
            background: white;
            text-align: center;
        }

        .cuisine-label:hover {
            border-color: #667eea;
            transform: translateY(-2px);
        }

        .cuisine-option:checked + .cuisine-label {
            border-color: #667eea;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
        }

        .cuisine-icon {
            font-size: 1.5rem;
            margin-bottom: 8px;
        }

        .cuisine-text {
            font-size: 0.85rem;
            font-weight: 500;
        }

        .form-actions {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 30px;
            flex-wrap: wrap;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 14px 28px;
            border: none;
            border-radius: 12px;
            text-decoration: none;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.3s ease;
            cursor: pointer;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            min-width: 150px;
            justify-content: center;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
        }

        .btn-secondary {
            background: linear-gradient(135deg, #6c757d, #495057);
            color: white;
        }

        .error-message {
            color: #dc3545;
            font-size: 0.85rem;
            margin-top: 5px;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .alert {
            background: linear-gradient(135deg, #fc466b, #3f5efb);
            color: white;
            padding: 15px 20px;
            border-radius: 12px;
            margin: 20px 0;
            box-shadow: 0 4px 15px rgba(252, 70, 107, 0.2);
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .success-alert {
            background: linear-gradient(135deg, #11998e, #38ef7d);
        }

        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
                gap: 20px;
            }

            .rating-options {
                grid-template-columns: repeat(5, 1fr);
            }

            .cuisine-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .form-actions {
                flex-direction: column;
            }

            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <div class="container">
                <div class="header-content">
                    <div class="logo">
                        <i class="fas fa-utensils"></i>
                        <h1>Evaluador de Restaurantes</h1>
                    </div>
                    <div class="breadcrumb">
                        <a href="Default.aspx">Dashboard</a>
                        <i class="fas fa-chevron-right"></i>
                        <span>Nuevo Restaurante</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="main-content">
            <div class="container">
                <div class="form-card">
                    <div class="form-title">
                        <i class="fas fa-plus-circle"></i>
                        <h2>Agregar Nuevo Restaurante</h2>
                        <p>Completa la información del restaurante que deseas evaluar</p>
                    </div>

                    <div class="form-grid">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-store"></i>
                                Nombre del Restaurante
                            </label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-input" 
                                        MaxLength="100" placeholder="Ej: La Bella Italia"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" 
                                                      ErrorMessage="<i class='fas fa-exclamation-triangle'></i> El nombre es requerido" 
                                                      CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-utensils"></i>
                                Tipo de Cocina
                            </label>
                            <div class="cuisine-grid">
                                <asp:RadioButtonList ID="rblTipoComida" runat="server" RepeatLayout="Flow" CssClass="cuisine-options">
                                    <asp:ListItem Value="Italiana"><span class="cuisine-icon">IT</span><span class="cuisine-text">Italiana</span></asp:ListItem>
                                    <asp:ListItem Value="Mexicana"><span class="cuisine-icon">MX</span><span class="cuisine-text">Mexicana</span></asp:ListItem>
                                    <asp:ListItem Value="Japonesa"><span class="cuisine-icon">JP</span><span class="cuisine-text">Japonesa</span></asp:ListItem>
                                    <asp:ListItem Value="Parrillada"><span class="cuisine-icon">GR</span><span class="cuisine-text">Parrillada</span></asp:ListItem>
                                    <asp:ListItem Value="Vegana"><span class="cuisine-icon">VG</span><span class="cuisine-text">Vegana</span></asp:ListItem>
                                    <asp:ListItem Value="China"><span class="cuisine-icon">CN</span><span class="cuisine-text">China</span></asp:ListItem>
                                    <asp:ListItem Value="Peruana"><span class="cuisine-icon">PE</span><span class="cuisine-text">Peruana</span></asp:ListItem>
                                    <asp:ListItem Value="Francesa"><span class="cuisine-icon">FR</span><span class="cuisine-text">Francesa</span></asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="rfvTipoComida" runat="server" ControlToValidate="rblTipoComida" 
                                                          ErrorMessage="<i class='fas fa-exclamation-triangle'></i> Selecciona un tipo de cocina" 
                                                          CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <div class="form-group full-width">
                        <label class="form-label">
                            <i class="fas fa-star"></i>
                            Calificación General
                        </label>
                        <div class="rating-options">
                            <asp:RadioButtonList ID="rblCalificacion" runat="server" RepeatLayout="Flow" CssClass="rating-list">
                                <asp:ListItem Value="1"><span class="rating-stars">*</span><span class="rating-text">Malo</span></asp:ListItem>
                                <asp:ListItem Value="2"><span class="rating-stars">**</span><span class="rating-text">Regular</span></asp:ListItem>
                                <asp:ListItem Value="3"><span class="rating-stars">***</span><span class="rating-text">Bueno</span></asp:ListItem>
                                <asp:ListItem Value="4"><span class="rating-stars">****</span><span class="rating-text">Muy Bueno</span></asp:ListItem>
                                <asp:ListItem Value="5"><span class="rating-stars">*****</span><span class="rating-text">Excelente</span></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="rfvCalificacion" runat="server" ControlToValidate="rblCalificacion" 
                                                      ErrorMessage="<i class='fas fa-exclamation-triangle'></i> Selecciona una calificación" 
                                                      CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-group full-width">
                        <label class="form-label">
                            <i class="fas fa-comment"></i>
                            Comentarios y Observaciones
                        </label>
                        <asp:TextBox ID="txtComentarios" runat="server" CssClass="form-textarea" TextMode="MultiLine" 
                                    MaxLength="255" placeholder="Comparte tu experiencia, platos recomendados, ambiente, servicio..."></asp:TextBox>
                    </div>

                    <div class="form-actions">
                        <asp:Button ID="btnGuardar" runat="server" Text="<i class='fas fa-save'></i> Guardar Restaurante" 
                                   OnClick="btnGuardar_Click" CssClass="btn btn-primary" />
                        <a href="Default.aspx" class="btn btn-secondary">
                            <i class="fas fa-arrow-left"></i> Volver al Dashboard
                        </a>
                    </div>
                </div>

                <asp:Label ID="lblMessage" runat="server" Text="" CssClass="alert" Visible="false"></asp:Label>
            </div>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function() {
                // Convertir RadioButtonList a diseño personalizado
                const cuisineRadios = document.querySelectorAll('#<%= rblTipoComida.ClientID %> input[type="radio"]');
                const ratingRadios = document.querySelectorAll('#<%= rblCalificacion.ClientID %> input[type="radio"]');
                
                cuisineRadios.forEach((radio, index) => {
                    radio.className = 'cuisine-option';
                    const label = radio.nextElementSibling;
                    if (label) {
                        label.className = 'cuisine-label';
                        label.innerHTML = radio.nextElementSibling.innerHTML;
                    }
                });

                ratingRadios.forEach((radio, index) => {
                    radio.className = 'rating-option';
                    const label = radio.nextElementSibling;
                    if (label) {
                        label.className = 'rating-label';
                        label.innerHTML = radio.nextElementSibling.innerHTML;
                    }
                });
            });
        </script>
    </form>
</body>
</html>