using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Christoc.Modules.Featured_Product
{
    public class Featuredlist
    {
        public int ProductId { get; set; }
        public int CategoryID { get; set; }
        public string ProductName { get; set; }
        public string ImagePath { get; set; }
        public string ImageUrl { get; set; }
        public string Description { get; set; }
        public string Summary { get; set; }
    }
}
