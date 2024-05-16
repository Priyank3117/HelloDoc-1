using System.Text;
using Microsoft.AspNetCore.SignalR;
using Microsoft.AspNetCore.Http;
using DAL.DataContext;
using DAL.ViewModel;
using static DAL.ViewModel.ChatUser;

namespace BusinessLogic.Repository
{
    public class ChatHub : Hub
    {
        private readonly ApplicationDbContext _context;
        public ChatHub(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task SendMessage(string user, string message)
            {
            var senderConnectionId = Context.ConnectionId;
            var id = _context.Physicians.FirstOrDefault(s => s.PhysicianId == int.Parse(user)).AspNetUserId;
            var receiverConnectionId = ChatUser.myConnectedUsers
               .Where(x => x.UserId == user)
               .Select(x => x.ConnectionId)
               .FirstOrDefault();
                if (receiverConnectionId != null)
            {
                await Clients.Client(receiverConnectionId).SendAsync("ReceiveMessage", senderConnectionId, "Sender", message);

            }
            else
            {
                await Clients.Caller.SendAsync("ReceiverNotAvailable", user);

            }
            await Clients.Client(senderConnectionId).SendAsync("ReceiveMessage", senderConnectionId, "You", message);

        }

        public string GetConnectionId() => Context.ConnectionId;

        public override Task OnConnectedAsync()
        {
            HttpContext httpContext = Context.GetHttpContext();
            var Id = httpContext.Session.GetString("aspnetuserid");
            var role = httpContext.Session.GetString("Role");
            UserChat user = new()
            {
                ConnectionId = Context.ConnectionId,
                UserId = Id,
                Type = role
            };
            UserChat? usercheck = ChatUser.myConnectedUsers.Where(u => u.ConnectionId == Context.ConnectionId).FirstOrDefault();
            if (usercheck == null)
            {
                ChatUser.myConnectedUsers.Add(user);
            }
            return base.OnConnectedAsync();
        }

        public override Task OnDisconnectedAsync(Exception? exception)
        {
            UserChat? user = ChatUser.myConnectedUsers.Where(u => u.ConnectionId == Context.ConnectionId).FirstOrDefault();
            ChatUser.myConnectedUsers.Remove(user);
            return base.OnDisconnectedAsync(exception);
        }

    }
}

