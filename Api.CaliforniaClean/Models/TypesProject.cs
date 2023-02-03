using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace Api.CaliforniaEF;

[DisplayName ( "Types Project Object" )]
[Description ( "Types Project Data" )]
public partial class TypesProject
{
    [JsonProperty ( "id" )]
    public int ID { get; set; }

    [JsonProperty ( "description" )]
    public string Description { get; set; } = null!;

    [JsonIgnore]
    public virtual ICollection<Project> Projects { get; } = new List<Project>();
}
