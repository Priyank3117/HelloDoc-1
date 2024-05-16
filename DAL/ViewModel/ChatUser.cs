using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.ViewModel
{
    public class ChatUser
    {
        public static List<UserChat> myConnectedUsers = new List<UserChat>();

        public class UserChat
        {
            public string Name { get; set; }
            public string UserId { get; set; }
            public string ConnectionId { get; set; }
            public string Type { get; set; }
        }
    }
}




