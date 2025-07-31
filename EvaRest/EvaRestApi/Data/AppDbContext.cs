using Microsoft.EntityFrameworkCore;
using EvaRestApi.Models;

namespace EvaRestApi.Data;
public class AppDbContext(DbContextOptions<AppDbContext> opts) : DbContext(opts)
{
    public DbSet<Restaurant> Restaurantes => Set<Restaurant>();
}