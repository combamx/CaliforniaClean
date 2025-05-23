﻿using Newtonsoft.Json;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Api.CaliforniaClean.RequestModel;

[DisplayName ( "Building Object" )]
[Description ( "Building Data" )]
public class BuildingRequest
{
    [JsonProperty ( "id" )]
    public int ID { get; set; }

    [Required]
    [MaxLength ( 50 )]
    [JsonProperty ( "description" )]
    public string Description { get; set; } = null!;

    [JsonProperty ( "id_type_project" )]
    public byte IDTypeProject { get; set; }

    [JsonProperty ( "order" )]
    public byte Order { get; set; }
}

