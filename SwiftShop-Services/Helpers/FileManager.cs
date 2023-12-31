﻿using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwiftShop_Services.Helpers
{
    public static class FileManager
    {
        public static string Save(IFormFile file, string rootPath, string folders)
        {
            string newFileName = Guid.NewGuid().ToString() + (file.FileName.Length > 64 ? file.FileName.Substring(file.FileName.Length - 64) : file.FileName);
            string path = Path.Combine(rootPath, folders, newFileName);

            using (FileStream stream = new FileStream(path, FileMode.Create))
            {
                file.CopyTo(stream);
            }

            return newFileName;
        }

        public static void Delete(string rootPath, string folders, string fileName)
        {
            string path = Path.Combine(rootPath, folders, fileName);

            if (File.Exists(path))
            {
                File.Delete(path);
            }
        }

        public static void DeleteAll(string rootPath, string folder, List<string> fileNames)
        {
            foreach (var fileName in fileNames)
            {
                string path = Path.Combine(rootPath, folder, fileName);

                if (File.Exists(path))
                {
                    File.Delete(path);
                }
            }
        }
    }
}
