using EvaRestApi.Data;
using EvaRestApi.Models;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddDbContext<AppDbContext>(opt =>
    opt.UseSqlServer(builder.Configuration.GetConnectionString("SqlServer")));
builder.Services.AddEndpointsApiExplorer().AddSwaggerGen();

var app = builder.Build();
app.UseSwagger();
app.UseSwaggerUI();

app.MapGet("/api/restaurantes", async (AppDbContext db) =>
    await db.Restaurantes.ToListAsync());

app.MapGet("/api/restaurantes/{id}", async (int id, AppDbContext db) =>
    await db.Restaurantes.FindAsync(id) is Restaurant r ? Results.Ok(r) : Results.NotFound());

app.MapPost("/api/restaurantes", async (Restaurant r, AppDbContext db) =>
{
    db.Restaurantes.Add(r);
    await db.SaveChangesAsync();
    return Results.Created($"/api/restaurantes/{r.Id}", r);
});

app.MapPut("/api/restaurantes/{id}", async (int id, Restaurant input, AppDbContext db) =>
{
    var r = await db.Restaurantes.FindAsync(id);
    if (r is null) return Results.NotFound();
    (r.Nombre, r.TipoComida, r.Calificacion, r.Comentarios) =
        (input.Nombre, input.TipoComida, input.Calificacion, input.Comentarios);
    await db.SaveChangesAsync();
    return Results.NoContent();
});

app.MapDelete("/api/restaurantes/{id}", async (int id, AppDbContext db) =>
{
    var r = await db.Restaurantes.FindAsync(id);
    if (r is null) return Results.NotFound();
    db.Restaurantes.Remove(r);
    await db.SaveChangesAsync();
    return Results.NoContent();
});

app.Run();
