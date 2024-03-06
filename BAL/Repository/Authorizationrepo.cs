using DAL.DataContext;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;

namespace BAL.Repository
{
    public class Authorizationrepo
    {

        public class CustomAuthorize : Attribute, IAuthorizationFilter
        {
            private readonly string _role;
            private readonly ApplicationDbContext _context;
            public CustomAuthorize(string role = "")
            {
                this._role = role;
            }
            public void OnAuthorization(AuthorizationFilterContext context)
            {
                var email = context.HttpContext.Session.GetString("Email");
                var roLe = context.HttpContext.Session.GetString("Role");

                if (email == null)
                {
                    context.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "Login", Action = "Patient_login" }));
                    return;
                }
                if (!string.IsNullOrEmpty(_role))
                {
                    if (!(roLe == _role))
                    {
                        context.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "Home", Action = "AccessDenied" }));
                    }
                }
            }
        }
    }
}
