using System.Xml.Serialization;

namespace dotnet.Model;
[XmlRoot("me")]
public class Me
{
    [XmlElement("name")]
    public string? Name { get; set; }
    [XmlElement("age")]
    public int Age { get; set; }
    [XmlArray("hobbies")]
    [XmlArrayItem("hobby")]
    public List<string>? Hobbies { get; set; }

    public override string ToString()
    {

        return $" Name: {Name} \n Age: {Age} \n Hobbies: {string.Join(",", Hobbies ?? new List<string>())}";
    }
}