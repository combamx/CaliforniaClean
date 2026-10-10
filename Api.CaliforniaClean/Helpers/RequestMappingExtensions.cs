using Api.CaliforniaClean.RequestModel;
using Api.CaliforniaEF;

namespace Api.CaliforniaClean.Helpers;

public static class RequestMappingExtensions
{
    public static BuildingRequest ToRequest(this Building source) => new()
    {
        ID = source.ID,
        Description = source.Description,
        IDTypeProject = source.IDTypeProject,
        Order = source.Order,
    };

    public static ChangeOrderRequest ToRequest(this ChangeOrder source) => new()
    {
        ID = source.ID,
        Clave = source.Clave,
        DateChange = source.DateChange,
        Amount = source.Amount,
        IDStatusCO = source.IDStatusCO,
        IDWorkOrder = source.IDWorkOrder,
        IDProject = source.IDProject,
        Description = source.Description,
        User = source.User,
        Status = source.Status,
    };

    public static CommentsWORequest ToRequest(this CommentsWO source) => new()
    {
        ID = source.ID,
        Description = source.Description,
        IDWorkOrder = source.IDWorkOrder,
    };

    public static CustomerRequest ToRequest(this Customer source) => new()
    {
        ID = source.ID,
        CompanyName = source.CompanyName,
        Address = source.Address,
        City = source.City,
        Zip = source.Zip,
        Phone = source.Phone,
        Status = source.Status,
        Email = source.Email,
    };

    public static ProjectRequest ToRequest(this Project source) => new()
    {
        ID = source.ID,
        ProjectName = source.ProjectName,
        Address = source.Address,
        City = source.City,
        Description = source.Description,
        DateProject = source.DateProject,
        Amount = source.Amount,
        RetentionsProject = (float?)source.RetentionsProject,
        Retentions = source.Retentions,
        SellerProject = (float?)source.SellerProject,
        Selle = source.Selle,
        IDCustomer = source.IDCustomer,
        IDSeller = source.IDSeller,
        IDProvide = source.IDProvide,
        IDTypeProject = source.IDTypeProject,
        IDTypeBuilding = source.IDTypeBuilding,
        AmountProvide = source.AmountProvide,
        Inclusion = source.Inclusion,
        OCIP = source.OCIP,
        Status = source.Status,
    };

}
