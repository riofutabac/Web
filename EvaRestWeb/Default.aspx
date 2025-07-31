<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" Async="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <title>Evaluador de Restaurantes - Dashboard</title>
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
            max-width: 1200px;
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
            font-size: 2.5rem;
            color: #667eea;
        }

        .logo h1 {
            font-size: 2rem;
            font-weight: 700;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .main-content {
            padding: 40px 0;
        }

        .action-bar {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 25px;
            margin-bottom: 30px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .stats {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .stat-card {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 15px 25px;
            border-radius: 15px;
            text-align: center;
            min-width: 120px;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }

        .stat-number {
            font-size: 1.8rem;
            font-weight: bold;
            display: block;
        }

        .stat-label {
            font-size: 0.9rem;
            opacity: 0.9;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 12px 24px;
            border: none;
            border-radius: 12px;
            text-decoration: none;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.3s ease;
            cursor: pointer;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
        }

        .btn-success {
            background: linear-gradient(135deg, #11998e, #38ef7d);
            color: white;
        }

        .btn-warning {
            background: linear-gradient(135deg, #f093fb, #f5576c);
            color: white;
        }

        .btn-danger {
            background: linear-gradient(135deg, #fc466b, #3f5efb);
            color: white;
        }

        .table-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 20px;
            text-align: left;
            font-weight: 600;
            font-size: 1rem;
        }

        .table td {
            padding: 18px 20px;
            border-bottom: 1px solid #eee;
            vertical-align: middle;
        }

        .table tr:hover {
            background: rgba(102, 126, 234, 0.05);
        }

        .table tr:last-child td {
            border-bottom: none;
        }

        .rating-stars {
            color: #ffd700;
            font-size: 1.2rem;
        }

        .restaurant-name {
            font-weight: 600;
            color: #333;
        }

        .cuisine-type {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
            display: inline-block;
        }

        .comments {
            max-width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            color: #666;
            font-style: italic;
        }

        .actions {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }

        .btn-sm {
            padding: 8px 16px;
            font-size: 0.85rem;
            border-radius: 8px;
        }

        .alert {
            background: linear-gradient(135deg, #fc466b, #3f5efb);
            color: white;
            padding: 15px 20px;
            border-radius: 12px;
            margin: 20px 0;
            box-shadow: 0 4px 15px rgba(252, 70, 107, 0.2);
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #666;
        }

        .empty-state i {
            font-size: 4rem;
            color: #ddd;
            margin-bottom: 20px;
        }

        .empty-state h3 {
            margin-bottom: 10px;
            color: #333;
        }

        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 15px;
            }

            .action-bar {
                flex-direction: column;
                text-align: center;
            }

            .stats {
                justify-content: center;
            }

            .table-container {
                overflow-x: auto;
            }

            .actions {
                flex-direction: column;
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
                </div>
            </div>
        </div>

        <div class="main-content">
            <div class="container">
                <div class="action-bar">
                    <div class="stats">
                        <div class="stat-card">
                            <span class="stat-number" id="totalRestaurants">-</span>
                            <span class="stat-label">Restaurantes</span>
                        </div>
                        <div class="stat-card">
                            <span class="stat-number" id="avgRating">-</span>
                            <span class="stat-label">Promedio</span>
                        </div>
                    </div>
                    <a href="Create.aspx" class="btn btn-success">
                        <i class="fas fa-plus"></i>
                        Nuevo Restaurante
                    </a>
                </div>

                <div class="table-container">
                    <asp:GridView ID="GridViewRestaurantes" runat="server" AutoGenerateColumns="false" 
                                  DataKeyNames="Id" CssClass="table" GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="Restaurante">
                                <ItemTemplate>
                                    <div class="restaurant-name"><%# Eval("Nombre") %></div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tipo">
                                <ItemTemplate>
                                    <span class="cuisine-type"><%# Eval("TipoComida") %></span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Calificación">
                                <ItemTemplate>
                                    <div class="rating-stars">
                                        <%# GetStarRating((int)Eval("Calificacion")) %>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Comentarios">
                                <ItemTemplate>
                                    <div class="comments" title='<%# Eval("Comentarios") %>'>
                                        <%# string.IsNullOrEmpty(Eval("Comentarios").ToString()) ? "Sin comentarios" : Eval("Comentarios") %>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Acciones">
                                <ItemTemplate>
                                    <div class="actions">
                                        <a href='Edit.aspx?id=<%# Eval("Id") %>' class="btn btn-warning btn-sm">
                                            <i class="fas fa-edit"></i> Editar
                                        </a>
                                        <a href='Delete.aspx?id=<%# Eval("Id") %>' class="btn btn-danger btn-sm">
                                            <i class="fas fa-trash"></i> Eliminar
                                        </a>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="empty-state">
                                <i class="fas fa-utensils"></i>
                                <h3>No hay restaurantes registrados</h3>
                                <p>¡Comienza agregando tu primer restaurante!</p>
                                <a href="Create.aspx" class="btn btn-success" style="margin-top: 20px;">
                                    <i class="fas fa-plus"></i>
                                    Agregar Restaurante
                                </a>
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>

                <asp:Label ID="lblMessage" runat="server" Text="" CssClass="alert" Visible="false"></asp:Label>
            </div>
        </div>

        <script>
            // Calcular estadísticas
            document.addEventListener('DOMContentLoaded', function() {
                const rows = document.querySelectorAll('.table tbody tr');
                const totalEl = document.getElementById('totalRestaurants');
                const avgEl = document.getElementById('avgRating');
                
                if (rows.length > 0 && !rows[0].querySelector('.empty-state')) {
                    totalEl.textContent = rows.length;
                    
                    let totalRating = 0;
                    rows.forEach(row => {
                        const stars = row.querySelector('.rating-stars').textContent.trim();
                        const rating = (stars.match(/⭐/g) || []).length;
                        totalRating += rating;
                    });
                    
                    const avg = (totalRating / rows.length).toFixed(1);
                    avgEl.textContent = avg + ' ⭐';
                } else {
                    totalEl.textContent = '0';
                    avgEl.textContent = '0 ⭐';
                }
            });
        </script>
    </form>
</body>
</html>