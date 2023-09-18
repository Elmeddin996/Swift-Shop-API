using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SwiftShop_Services.Dtos.StoreDataDto
{
    public class StoreDataGetDto
    {
        public int Id { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string LogoText { get; set; }
        public string CompanyName { get; set; }
        public string WhatsappLink { get; set; }
        public string InstagramLink { get; set; }
        public string FacebookLink { get; set; }
        public string LinkedinLink { get; set; }
        public string LogoImageName { get; set; }
        public string LogoImageLink { get; set; }
        public string EmptyBasketImageName { get; set; }
        public string EmptyBasketImageLink { get; set; }
    }
}
