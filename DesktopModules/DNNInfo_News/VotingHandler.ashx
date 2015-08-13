<%@ WebHandler Language="C#" Class="DNNInfo.Modules.News.Controls.VotingHandler" %>
/************************************************************'
' DNNInfo Copyright (c) 2009 - 2012 - http://www.dnninfo.com '
' Module: DNNInfo News                                       '
' This notice may not be removed from the source code.       '
'************************************************************/

using System;
using System.Web;
using System.Text;
using System.Collections.Generic;
using DotNetNuke.Common;
using DNNInfo.Modules.News.GenericHandler;

namespace DNNInfo.Modules.News.Controls {
    public class VotingHandler : IHttpHandler {
        
        public void ProcessRequest (HttpContext context) {
            context.Response.ContentType = "text/html";
            ASHXHandler objASHXHandler = new ASHXHandler();
            objASHXHandler.VoteComment(context);
        }
     
        public bool IsReusable {
            get {
                return false;
            }
        }
    }
}