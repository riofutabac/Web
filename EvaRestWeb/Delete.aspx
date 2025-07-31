<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Delete.aspx.cs" Inherits="Delete" Async="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <title>Eliminar Restaurante - Evaluador</title>
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
            max-width: 700px;
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

        .delete-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            position: relative;
            overflow: hidden;
        }

        .danger-pattern {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 6px;
            background: linear-gradient(45deg, 
                #fc466b 25%, transparent 25%, transparent 50%, 
                #fc466b 50%, #fc466b 75%, transparent 75%, transparent);
            background-size: 20px 20px;
            animation: move 2s linear infinite;
        }

        @keyframes move {
            0% { background-position: 0 0; }
            100% { background-position: 20px 0; }
        }

        .delete-title {
            text-align: center;
            margin-bottom: 30px;
        }

        .delete-title i {
            font-size: 4rem;
            color: #fc466b;
            margin-bottom: 20px;
            display: block;
            animation: shake 2s ease-in-out infinite;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        .delete-title h2 {
            font-size: 2rem;
            font-weight: 700;
            color: #fc466b;
            margin-bottom: 10px;
        }

        .delete-title p {
            color: #666;
            font-size: 1.1rem;
        }

        .warning-alert {
            background: linear-gradient(135deg, #ff6b6b, #ee5a24);
            color: white;
            padding: 20px;
            border-radius: 15px;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            gap: 15px;
            box-shadow: 0 4px 15px rgba(255, 107, 107, 0.3);
            border: 2px solid rgba(255, 255, 255, 0.2);
        }

        .warning-alert i {
            font-size: 2rem;
            animation: pulse 2s infinite;
        }

        .warning-content h3 {
            font-size: 1.2rem;
            margin-bottom: 8px;
        }

        .warning-content p {
            opacity: 0.9;
            line-height: 1.4;
        }

        .restaurant-card {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border-radius: 20px;
            padding: 30px;
            margin-bottom: 30px;
            position: relative;
            overflow: hidden;
        }

        .restaurant-card::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: rotate 20s linear infinite;
        }

        @keyframes rotate {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .restaurant-header {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 25px;
            position: relative;
            z-index: 1;
        }

        .restaurant-icon {
            width: 80px;
            height: 80px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            backdrop-filter: blur(10px);
        }

        .restaurant-info h3 {
            font-size: 2rem;
            margin-bottom: 8px;
        }

        .restaurant-info .subtitle {
            opacity: 0.8;
            font-size: 1rem;
        }

        .restaurant-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            position: relative;
            z-index: 1;
        }

        .detail-item {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 15px;
            border-radius: 12px;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .detail-label {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 0.9rem;
            opacity: 0.8;
            margin-bottom: 5px;
        }

        .detail-value {
            font-size: 1.1rem;
            font-weight: 600;
        }

        .rating-stars {
            color: #ffd700;
            font-size: 1.3rem;
        }

        .countdown-section {
            background: rgba(252, 70, 107, 0.1);
            border: 2px dashed #fc466b;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 30px;
            text-align: center;
        }

        .countdown-timer {
            font-size: 3rem;
            font-weight: bold;
            color: #fc466b;
            margin-bottom: 10px;
            font-family: 'Courier New', monospace;
        }

        .countdown-text {
            color: #666;
            font-size: 1rem;
        }

        .action-buttons {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 12px;
            padding: 16px 32px;
            border: none;
            border-radius: 12px;
            text-decoration: none;
            font-weight: 600;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            cursor: pointer;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            min-width: 180px;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            transition: all 0.3s ease;
            transform: translate(-50%, -50%);
        }

        .btn:hover::before {
            width: 300px;
            height: 300px;
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.2);
        }

        .btn-danger {
            background: linear-gradient(135deg, #fc466b, #3f5efb);
            color: white;
        }

        .btn-danger:hover {
            background: linear-gradient(135deg, #e91e63, #3f51b5);
        }

        .btn-secondary {
            background: linear-gradient(135deg, #6c757d, #495057);
            color: white;
        }

        .btn-disabled {
            background: #ccc;
            cursor: not-allowed;
            opacity: 0.6;
        }

        .btn-disabled:hover {
            transform: none;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
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

        .loading-state {
            text-align: center;
            padding: 40px;
            color: #666;
        }

        .loading-spinner {
            width: 50px;
            height: 50px;
            border: 4px solid #e1e5e9;
            border-top: 4px solid #667eea;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin: 0 auto 20px;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        @media (max-width: 768px) {
            .restaurant-header {
                flex-direction: column;
                text-align: center;
            }

            .restaurant-details {
                grid-template-columns: 1fr;
            }

            .action-buttons {
                flex-direction: column;
            }

            .btn {
                width: 100%;
            }

            .countdown-timer {
                font-size: 2rem;
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
                        <span>Eliminar Restaurante</span>
                    </div>
                </div>
            </div>
        </div>

        <div class="main-content">
            <div class="container">
                <div class="delete-card">
                    <div class="danger-pattern"></div>
                    
                    <div class="loading-state" id="loadingState">
                        <div class="loading-spinner"></div>
                        <h3>Cargando información del restaurante...</h3>
                        <p>Por favor espera un momento</p>
                    </div>

                    <div id="deleteContent" style="display: none;">
                        <div class="delete-title">
                            <i class="fas fa-exclamation-triangle"></i>
                            <h2>¡Zona de Peligro!</h2>
                            <p>Estás a punto de eliminar permanentemente este restaurante</p>
                        </div>

                        <div class="warning-alert">
                            <i class="fas fa-skull-crossbones"></i>
                            <div class="warning-content">
                                <h3>⚠️ Advertencia Crítica</h3>
                                <p>Esta acción es <strong>irreversible</strong> y eliminará permanentemente toda la información del restaurante, incluyendo comentarios y calificaciones.</p>
                            </div>
                        </div>

                        <asp:Panel ID="pnlRestaurant" runat="server" CssClass="restaurant-card">
                            <div class="restaurant-header">
                                <div class="restaurant-icon">
                                    <i class="fas fa-store"></i>
                                </div>
                                <div class="restaurant-info">
                                    <h3><asp:Label ID="lblNombre" runat="server"></asp:Label></h3>
                                    <div class="subtitle">Restaurante seleccionado para eliminación</div>
                                </div>
                            </div>

                            <div class="restaurant-details">
                                <div class="detail-item">
                                    <div class="detail-label">
                                        <i class="fas fa-hashtag"></i>
                                        ID del Restaurante
                                    </div>
                                    <div class="detail-value">
                                        #<asp:Label ID="lblId" runat="server"></asp:Label>
                                    </div>
                                </div>

                                <div class="detail-item">
                                    <div class="detail-label">
                                        <i class="fas fa-utensils"></i>
                                        Tipo de Cocina
                                    </div>
                                    <div class="detail-value">
                                        <asp:Label ID="lblTipoComida" runat="server"></asp:Label>
                                    </div>
                                </div>

                                <div class="detail-item">
                                    <div class="detail-label">
                                        <i class="fas fa-star"></i>
                                        Calificación
                                    </div>
                                    <div class="detail-value rating-stars">
                                        <asp:Label ID="lblCalificacion" runat="server"></asp:Label>
                                    </div>
                                </div>

                                <div class="detail-item" style="grid-column: 1 / -1;">
                                    <div class="detail-label">
                                        <i class="fas fa-comment"></i>
                                        Comentarios
                                    </div>
                                    <div class="detail-value">
                                        <asp:Label ID="lblComentarios" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>

                        <div class="countdown-section" id="countdownSection" style="display: none;">
                            <div class="countdown-timer" id="countdownTimer">5</div>
                            <div class="countdown-text">Confirma la eliminación en...</div>
                        </div>

                        <div class="action-buttons">
                            <asp:Button ID="btnEliminar" runat="server" 
                                       Text="<i class='fas fa-trash-alt'></i> Eliminar Permanentemente" 
                                       OnClick="btnEliminar_Click" 
                                       CssClass="btn btn-danger btn-disabled" 
                                       Enabled="false" />
                            <a href="Default.aspx" class="btn btn-secondary">
                                <i class="fas fa-shield-alt"></i> Cancelar y Volver
                            </a>
                        </div>
                    </div>
                </div>

                <asp:Label ID="lblMessage" runat="server" Text="" CssClass="alert" Visible="false"></asp:Label>
                <asp:HiddenField ID="hfId" runat="server" />
            </div>
        </div>

        <script>
            let countdownActive = false;

            document.addEventListener('DOMContentLoaded', function() {
                // Simular carga de datos
                setTimeout(() => {
                    document.getElementById('loadingState').style.display = 'none';
                    document.getElementById('deleteContent').style.display = 'block';
                    
                    // Iniciar countdown de seguridad después de 2 segundos
                    setTimeout(startCountdown, 2000);
                }, 1500);
            });

            function startCountdown() {
                const countdownSection = document.getElementById('countdownSection');
                const countdownTimer = document.getElementById('countdownTimer');
                const deleteButton = document.getElementById('<%= btnEliminar.ClientID %>');
                
                countdownSection.style.display = 'block';
                countdownActive = true;
                
                let timeLeft = 5;
                
                const interval = setInterval(() => {
                    timeLeft--;
                    countdownTimer.textContent = timeLeft;
                    
                    if (timeLeft <= 0) {
                        clearInterval(interval);
                        countdownSection.style.display = 'none';
                        
                        // Habilitar botón de eliminar
                        deleteButton.disabled = false;
                        deleteButton.className = deleteButton.className.replace('btn-disabled', '');
                        
                        // Añadir confirmación extra
                        deleteButton.onclick = function(e) {
                            const confirmed = confirm('🚨 ÚLTIMA OPORTUNIDAD 🚨\n\n¿Estás COMPLETAMENTE seguro de que quieres eliminar este restaurante?\n\nEsta acción NO se puede deshacer.');
                            
                            if (confirmed) {
                                const finalConfirm = confirm('⚠️ CONFIRMACIÓN FINAL ⚠️\n\nEscribe mentalmente "ELIMINAR" y presiona OK para continuar.\n\nPresiona Cancelar si tienes alguna duda.');
                                return finalConfirm;
                            }
                            
                            return false;
                        };
                        
                        countdownActive = false;
                    }
                }, 1000);
            }

            // Prevenir cierre accidental de la página
            window.addEventListener('beforeunload', function(e) {
                if (countdownActive) {
                    e.preventDefault();
                    e.returnValue = '¿Estás seguro de que quieres salir? El proceso de eliminación está en curso.';
                }
            });
        </script>
    </form>
</body>
</html>