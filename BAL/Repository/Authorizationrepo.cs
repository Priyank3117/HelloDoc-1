using DAL.DataContext;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;
using System.Text;
using Microsoft.AspNetCore.Http;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.Extensions.DependencyInjection;
using BAL.Interface;


namespace BAL.Repository
{
    public class Authorizationrepo
    {

        //-----------------------------------------
        public class CustomAuthorize : Attribute, IAuthorizationFilter
        {


            private readonly string[] _role;
            private readonly string _menuId;
            private readonly ApplicationDbContext _context;
            public CustomAuthorize(string[] role,string menuId)
            {
                this._role = role;
                this._menuId = menuId;
            }
            public void OnAuthorization(AuthorizationFilterContext context)
          {
                var jwtService = context.HttpContext.RequestServices.GetService<IJwtService>();

                var dbContext = context.HttpContext.RequestServices.GetService<ApplicationDbContext>();


              
                if (jwtService == null)
                {
                   context.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "Login", action = "Patient_login" }));
                   return;
                }
                var request = context.HttpContext.Request;
                var token = request.Cookies["jwt"];
                if (token == null || !jwtService.ValidateToken(token, out JwtSecurityToken jwtToken))
                {
                  context.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "Login", action = "Patient_login" }));
                  return;
                }

              

                var roleClaim = jwtToken.Claims.FirstOrDefault(claim => claim.Type == "Role");
                var roleId = jwtToken.Claims.FirstOrDefault(claim => claim.Type == "takenId");

                bool isMenuExist = dbContext.RoleMenus.Any(u => u.RoleId == int.Parse(roleId.Value) && u.MenuId == int.Parse(_menuId));
                //Redirect to Login if not logged in
                if (roleClaim == null && roleId == null)
                {
                    context.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "Login", action = "Patient_login" }));
                    return;
                }
                //Redirect to Access Denied only if roles mismatch      
                if (_role.Length < 1 || !_role.Contains(roleClaim.Value) || (isMenuExist == false && roleId.Value != "0"))
                {
                    context.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "Home", action = "AccessDenied" }));
                    return;
                }
           }
            //-----------------------------------------         
            //-----------------------------------------

            //public class CustomAuthorize : Attribute, IAuthorizationFilter
            //{
            //    private readonly string _role;
            //    private readonly ApplicationDbContext _context;
            //    public CustomAuthorize(string role = "")
            //    {
            //        this._role = role;
            //    }

            //  var email = context.HttpContext.Session.GetString("Email");
          //  var roLe = context.HttpContext.Session.GetString("Role");

            //    public void OnAuthorization(AuthorizationFilterContext context)
            //    {
            //        var email = context.HttpContext.Session.GetString("Email");
            //        var roLe = context.HttpContext.Session.GetString("Role");

            //        if (email == null)
            //        {
            //            context.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "Login", Action = "Patient_login" }));
            //            return;
            //        }
            //        if (!string.IsNullOrEmpty(_role))
            //        {
            //            if (!(roLe == _role))
            //            {
            //                context.Result = new RedirectToRouteResult(new RouteValueDictionary(new { Controller = "Home", Action = "AccessDenied" }));
            //            }
            //        }
            //    }

            //-----------------------------------------         
        }
    }
}
