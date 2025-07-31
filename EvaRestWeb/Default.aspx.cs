using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using EvaRestWeb.Models;

public partial class Default : System.Web.UI.Page
{
    protected async void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            await LoadRestaurants();
        }
    }

    private async Task LoadRestaurants()
    {
        try
        {
            var jsonContent = await ApiClient.GetAsync();
            var restaurants = JsonConvert.DeserializeObject<List<Restaurant>>(jsonContent);
            GridViewRestaurantes.DataSource = restaurants;
            GridViewRestaurantes.DataBind();
            lblMessage.Text = "";
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error: " + ex.Message;
            lblMessage.Visible = true;
        }
    }

    protected string GetStarRating(int rating)
    {
        string stars = "";
        for (int i = 0; i < rating; i++)
        {
            stars += "*";
        }
        return stars;
    }
}