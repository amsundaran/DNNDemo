using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Christoc.Modules.News_List
{
    public class Newsinfo
    {
        public int NewsID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string AuthorOtherName { get; set; }
        public string NewsImage { get; set; }
        public string ShortDescription { get; set; }
        public DateTime PublishedDate { get; set; }

    }
}