using System;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using EvaRestWeb.Models;

public partial class Delete : System.Web.UI.Page
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
            
            lblId.Text = restaurant.Id.ToString();
            lblNombre.Text = restaurant.Nombre;
            lblTipoComida.Text = restaurant.TipoComida;
            lblCalificacion.Text = GetStarRating(restaurant.Calificacion);
            lblComentarios.Text = string.IsNullOrEmpty(restaurant.Comentarios) ? 
                                "Sin comentarios" : restaurant.Comentarios;
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error: " + ex.Message;
            pnlRestaurant.Visible = false;
            btnEliminar.Visible = false;
        }
    }

    private string GetStarRating(int rating)
    {
        string stars = "";
        for (int i = 0; i < rating; i++)
        {
            stars += "*";
        }
        return rating + " " + stars;
    }

    protected async void btnEliminar_Click(object sender, EventArgs e)
    {
        await DeleteRestaurant();
    }

    private async Task DeleteRestaurant()
    {
        try
        {
            int id = int.Parse(hfId.Value);
            await ApiClient.DeleteAsync(id);
            Response.Redirect("Default.aspx");
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error: " + ex.Message;
            lblMessage.Visible = true;
        }
    }
}