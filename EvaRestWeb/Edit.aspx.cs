using System;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using EvaRestWeb.Models;

public partial class Edit : System.Web.UI.Page
{
    protected async void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = Request.QueryString["id"];
            int restaurantId;
            if (!string.IsNullOrEmpty(id) && int.TryParse(id, out restaurantId))
            {
                hfId.Value = id;
                await LoadRestaurant(restaurantId);
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
    }

    private async Task LoadRestaurant(int id)
    {
        try
        {
            var jsonContent = await ApiClient.GetById(id);
            var restaurant = JsonConvert.DeserializeObject<Restaurant>(jsonContent);
            
            txtNombre.Text = restaurant.Nombre;
            rblTipoComida.SelectedValue = restaurant.TipoComida;
            rblCalificacion.SelectedValue = restaurant.Calificacion.ToString();
            txtComentarios.Text = restaurant.Comentarios;
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error: " + ex.Message;
            lblMessage.Visible = true;
        }
    }

    protected async void btnActualizar_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            await UpdateRestaurant();
        }
    }

    private async Task UpdateRestaurant()
    {
        try
        {
            int id = int.Parse(hfId.Value);
            var restaurant = new Restaurant
            {
                Id = id,
                Nombre = txtNombre.Text.Trim(),
                TipoComida = rblTipoComida.SelectedValue,
                Calificacion = int.Parse(rblCalificacion.SelectedValue),
                Comentarios = txtComentarios.Text.Trim()
            };

            var json = JsonConvert.SerializeObject(restaurant);
            await ApiClient.PutAsync(id, json);
            Response.Redirect("Default.aspx");
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error: " + ex.Message;
            lblMessage.Visible = true;
        }
    }
}