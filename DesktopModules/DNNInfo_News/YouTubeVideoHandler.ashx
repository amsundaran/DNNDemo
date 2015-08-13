﻿<%@ WebHandler Language="C#" Class="DNNInfo.Modules.News.Controls.YouTubeVideoHandler" %>
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
	public class YouTubeVideoHandler : IHttpHandler{
		public void ProcessRequest(HttpContext context){
			ASHXHandler objASHXHandler = new ASHXHandler();
			objASHXHandler.LoadYouTubeVideo(context);
		}

		public bool IsReusable {
			get { return false; }
		}
	}
}

