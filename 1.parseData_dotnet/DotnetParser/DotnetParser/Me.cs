using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace DotnetParser
{
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
}
