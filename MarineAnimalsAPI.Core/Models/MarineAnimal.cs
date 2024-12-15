namespace MarineAnimalsAPI.Core.Models;

public class MarineAnimal
{
    public int Id { get; set; }
    public required string Name { get; set; }
    public required string ScientificName { get; set; }
    public required string Length { get; set; }
    public required string Weight { get; set; }
    public required string Habitat { get; set; }
    public required string Diet { get; set; }
    public required string Lifespan { get; set; }
}