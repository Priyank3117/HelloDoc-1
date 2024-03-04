using BAL.Interface;
using Microsoft.AspNetCore.Http;
using DAL.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL.Repository
{
    public class AddFilerepo : IAddFile
    {
        public void AddFile(IFormFile file,String path)
        {
            if(!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            string filename = Path.GetFileName(file.FileName);

            using (FileStream stream = new FileStream(Path.Combine(path, filename), FileMode.Create))
            {
                file.CopyTo(stream);
            }
        }

        public void RemoveFile(string path)
        {
              if(File.Exists(path))
            {
                File.Delete(path);
            }
            else
            {
                Console.WriteLine("file nahi he");   
            }
        }
    }
}
