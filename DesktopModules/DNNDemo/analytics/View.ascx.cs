#region Copyright

// 
// Copyright (c) 2015
// by DNNDemo
// 

#endregion

#region Using Statements

using System;
using DotNetNuke.Entities.Modules;

#endregion

namespace DNNDemo.analytics
{

	public partial class View : PortalModuleBase
	{

		#region Event Handlers
          
          	protected override void OnLoad(EventArgs e)
		  {
			base.OnLoad(e);
			
			if (!Page.IsPostBack)
			{
                   //lblText.Text="hi";
			}
		}

		/*protected override void OnInit(EventArgs e)
		{
			base.OnInit(e);

			cmdSave.Click += cmdSave_Click;
			cmdCancel.Click += cmdCancel_Click;
		}

	
		
		protected void cmdSave_Click(object sender, EventArgs e)
		{
                    ModuleController controller = new ModuleController();
                    controller.UpdateModuleSetting(ModuleId, "field", txtField.Text);
                    DotNetNuke.UI.Skins.Skin.AddModuleMessage(this, "Update Successful", DotNetNuke.UI.Skins.Controls.ModuleMessage.ModuleMessageType.GreenSuccess);
		}


		protected void cmdCancel_Click(object sender, EventArgs e)
		{
		}*/

		#endregion

	}
}




