namespace EvaRestWeb.Models
{
    public class Restaurant
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string TipoComida { get; set; }
        public int Calificacion { get; set; }
        public string Comentarios { get; set; }
    }
}