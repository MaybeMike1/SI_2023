using dotnet.Model;
using dotnet.Service;
using Microsoft.AspNetCore.Mvc;

namespace dotnet.Controllers;

[ApiController]
[Route("[controller]")]
public class MeController : ControllerBase
{
    
    [HttpGet("/yaml")]
    public Me GetYaml()
    {
        var res = FileService.fileSelector("./data/me.yaml");
        Console.WriteLine(res);
        return res;
    }

    [HttpGet("/json")]
    public Me GetJson()
    {
        var res = FileService.fileSelector("./data/me.json");

        Console.WriteLine(res);

        return res;
    }

    [HttpGet("/csv")]
    public Me GetCsv()
    {
        var res = FileService.fileSelector("./data/me.csv");

        Console.WriteLine(res);

        return res;
    }

    [HttpGet("/text")]
    public Me GetText()
    {
        var res = FileService.fileSelector("./data/me.txt");
        
        Console.WriteLine(res);

        return res;
    }

    [HttpGet("/xml")]
    public Me GetXml()
    {
        var res = FileService.fileSelector("./data/me.xml");
        
        Console.WriteLine(res);

        return res;
    }


    [HttpGet("/node/csv")]
    public Task<Me> GetNodeCsv()
    {
        HttpClient client = new HttpClient();
        var res = client.GetAsync("http://localhost:8080/data/csv").Result.Content.ReadFromJsonAsync<Me>();
        
        Console.WriteLine(res.ToString());

        return res;
    }
    [HttpGet("/node/json")]
    public Task<Me> GetNodeJson()
    {
        HttpClient client = new HttpClient();
        var res = client.GetAsync("http://localhost:8080/data/json").Result.Content.ReadFromJsonAsync<Me>();
        
        Console.WriteLine(res);

        return res;
    }

// GET
    // [HttpGet(Name = "GetWeatherForecast")]
    // public IActionResult Index()
    // {
    //     return View();
    // }
}