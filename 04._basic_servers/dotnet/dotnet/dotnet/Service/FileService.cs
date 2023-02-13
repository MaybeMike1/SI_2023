using Newtonsoft;
using Newtonsoft.Json;
using System.Reflection.PortableExecutable;
using System.Xml.Serialization;
using dotnet.Model;
using YamlDotNet.Serialization;

namespace dotnet.Service;

public class FileService
{
    public static Me fileSelector(string path)
    {
        string fileExtension = Path.GetExtension(path);
        Me me = new Me();

        switch (fileExtension)
        {
            case ".xml":
                me = ParseXML(path);
                break;
            case ".json":
                me = ParseJson(path);
                break;
            case ".txt":
                me = ParseText(path);
                break;
            case ".yaml":
                me = ParseYaml(path);
                break;
            case ".csv":
                me = ParseCsv(path);
                break;
            default:
                Console.WriteLine("Extension not supported in current solution", fileExtension);
                break;
        }

        Console.WriteLine($"Processed:{fileExtension} obj created \n" + me.ToString());

        return me;
    }
    
    public static Me ParseCsv(string path)
    {
        Me res = new Me();
        var csvString = File.ReadAllText(path);
        var csvDataRow = csvString.Split("\n")[1];
        var csvDataSegment = csvDataRow.Split(",");

        res.Name = csvDataSegment[0];
        res.Age = Int32.Parse(csvDataSegment[1]);
        res.Hobbies = csvDataSegment[2]
            .Replace("[", "")
            .Replace("]", "")
            .Split(";")
            .ToList();

        return res;
    }


    public static Me ParseYaml(string path)
    {
        Me res;
        var yamlString = File.ReadAllText(path);
        using (StringReader reader = new StringReader(yamlString))
        {
            var deserializer = new Deserializer();
            res = deserializer.Deserialize<Me>(reader);
        }

        return res;
    }

    public static Me ParseText(string path)
    {
        var me = new Me();
        var content = File.ReadAllText(path);
        var contentArr = content.Split(" ");
        int age = Int32.Parse(contentArr[1]);
        me.Age = age;
        me.Name = contentArr[0];
        me.Hobbies = contentArr[2]
            .Split(",")
            .ToList() ?? new List<string>();
        return me;
    }

    public static Me ParseXML(string path)
    {
        var res = new Me();
        XmlSerializer serializer = new XmlSerializer(typeof(Me));
        var xmlString = File.ReadAllText(path);
        using (TextReader tr = new StringReader(xmlString))
        {
            res = (Me) serializer.Deserialize(tr)!;
        }

        return res;
    }

    public static Me ParseJson(string path)
    {
        StreamReader streamReader = new StreamReader(path);
        JsonTextReader jsonReader = new JsonTextReader(streamReader);
        var serializer = new JsonSerializer();
        Me me = serializer.Deserialize<Me>(jsonReader) ?? new Me();

        return me;
    }
}