using Newtonsoft.Json;
using System.ComponentModel;

namespace Api.CaliforniaClean.RequestModel;

[DisplayName ( "Answer Request Object" )]
[Description ( "Answer Request Data" )]

public static class AnswerRequest
{
    [JsonProperty ( "code" )]
    public static int Code { get; set; }

    [JsonProperty ( "message" )]
    public static string? Message { get; set; }

    [JsonProperty ( "data" )]
    public static object? Data { get; set; }

    [JsonProperty ( "class" )]
    public static string? Class { get; set; }

    [JsonProperty ( "function" )]
    public static string? Funtion { get; set; }

    [JsonProperty ( "parameters" )]
    public static object? Parameters { get; set; }

}

