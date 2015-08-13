using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Christoc.Modules.SFContact.com.salesforce.ap2;

namespace Christoc.Modules.SFContact
{
    public class SFAuthenticate
    {

        private SforceService sfbinding;
        private static readonly string username = "dkesavapillai@gmail.com";
        private static readonly string password = "suyati123Ot1eJhkylqQvwMzN2Ec2tg6r";
        public static string showmsg = "";
        public void Access()
        {
            LoginResult logresult = null;
            sfbinding = new SforceService();

            logresult = sfbinding.login(username, password);

            try
            {

                logresult = sfbinding.login(username, password);

            }
            catch (System.Web.Services.Protocols.SoapException ex)
            {

                sfbinding = null;
                throw (ex);
            }
            sfbinding.Url = logresult.serverUrl;
            sfbinding.SessionHeaderValue = new SessionHeader();

            sfbinding.SessionHeaderValue.sessionId = logresult.sessionId;
        }
        public void sendLead(string fName,string lName,string email,string CName,string Msg)
        {
            Lead lead = new Lead();
            lead.FirstName = fName;
            lead.LastName = lName;
            lead.Email = email;
            lead.Company = CName;
            lead.Description = Msg;
            lead.LeadSource = "DNNDemo Contact";


            SaveResult[] saveresult = sfbinding.create(new sObject[] { lead });
            if (saveresult[0].success)
            {
                string Id = "";
                Id = saveresult[0].id;
                showmsg = "Message send successfully";
            }
            else
            {
                string result = "";
                result = saveresult[0].errors[0].message;
            }
        }
    }
}