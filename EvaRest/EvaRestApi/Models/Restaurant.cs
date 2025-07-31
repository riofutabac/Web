namespace EvaRestApi.Models;
public class Restaurant
{
    public int    Id           { get; set; }
    public string Nombre       { get; set; } = null!;
    public string TipoComida   { get; set; } = null!;
    public int    Calificacion { get; set; }
    public string? Comentarios { get; set; }
}