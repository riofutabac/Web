using System;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using EvaRestWeb.Models;

public partial class Create : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected async void btnGuardar_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            await SaveRestaurant();
        }
    }

    private async Task SaveRestaurant()
    {
        try
        {
            var restaurant = new Restaurant
            {
                Nombre = txtNombre.Text.Trim(),
                TipoComida = rblTipoComida.SelectedValue,
                Calificacion = int.Parse(rblCalificacion.SelectedValue),
                Comentarios = txtComentarios.Text.Trim()
            };

            var json = JsonConvert.SerializeObject(restaurant);
            await ApiClient.PostAsync(json);
            Response.Redirect("Default.aspx");
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error: " + ex.Message;
            lblMessage.Visible = true;
        }
    }
}