using System.Linq.Dynamic.Core;

namespace Api.CaliforniaClean.Helpers
{
    public static class QueryableExtensions
    {
        public static IQueryable<T> ApplyPagination<T> ( this IQueryable<T> query , PaginationParams pagination )
        {
            return query.Skip ( (pagination.PageNumber - 1) * pagination.PageSize )
                        .Take ( pagination.PageSize );
        }

        public static IQueryable<T> ApplySorting<T> ( this IQueryable<T> query , string? orderBy , bool desc )
        {
            if (!string.IsNullOrEmpty ( orderBy ))
            {
                string ordering = desc ? $"{orderBy} descending" : orderBy;
                return query.OrderBy ( ordering );
            }

            return query;
        }
    }
}
