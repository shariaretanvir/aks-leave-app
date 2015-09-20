using System;
using System.Linq;
using System.Web.UI.WebControls;
using DataLayer;
using BusinessLayer;
using System.Web.UI;

namespace LeaveApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        BusinessLogicLayer blogic = null;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                //if (ViewState["No_days"] != null)
                //{
                //    TxtNumberOfDays.Text = ViewState["No_days"].ToString();
                //}
            }
        }

        protected void TxtId_TextChanged(object sender, EventArgs e)
        {
            blogic = new BusinessLogicLayer();
            Employee_information einfo = new Employee_information();
            einfo.Employ_Id = Convert.ToInt32(TxtId.Text);
            Employee_information empinfor = new Employee_information();
            empinfor = blogic.fillTextbox(einfo.Employ_Id);
            TxtName.Text = empinfor.Employ_Name;
            //TxtName.Attributes.Add("readonly","readonly");
            TxtEmail.Text = empinfor.Employ_Email;
            //TxtEmail.Attributes.Add("readonly", "readonly");
            TxtDepartment.Text = empinfor.Department;
            //TxtDepartment.Attributes.Add("readonly", "readonly");
            TxtMobile.Text = empinfor.Mobile_number;
            //TxtMobile.Attributes.Add("readonly", "readonly");
            TxtSuperviser.Text = empinfor.Superviser_Id;
            //TxtSuperviser.Attributes.Add("readonly", "readonly");

        }
        private string getRadioValue(ControlCollection clts, string groupName)
        {
            string ret = "";
            foreach (Control ctl in clts)
            {
                if (ctl.Controls.Count != 0)
                {
                    if (ret == "")
                        ret = getRadioValue(ctl.Controls, groupName);
                }

                if (ctl.ToString() == "System.Web.UI.WebControls.RadioButton")
                {
                    RadioButton rb = (RadioButton)ctl;
                    if (rb.GroupName == groupName && rb.Checked == true)
                        ret = rb.Text;
                }
            }
            return ret;
        }


        private DateTime convertToDate(string ddate)
        {
            return DateTime.ParseExact(ddate, "dd-mm-yy", null);

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            blogic = new BusinessLogicLayer();
            Leave_information einfo = new Leave_information();
            einfo.Employee_id = Convert.ToInt32(TxtId.Text);

            einfo.Absence_type = getRadioValue(this.Controls, "absenceType");
            //RadioButton selectedRadio = GetSelectedRadioButton(RadioBtnVacation, RadioBtnnsick, RadioBtnLeavewithPay, RadioBtnLeavewithoutPay, RadioBtnEmergency, RadioBtnMarriage, RadioBtnMaternity_Paternity, RadioBtnOther);
            //einfo.Absence_type = selectedRadio.Text;
            DateTime fromdate = DateTime.ParseExact(TxtFromdate.Text, "dd-MM-yyyy", null);
            //convertToDate(TxtFromdate.Text);  DateTime.ParseExact(TxtFromdate.Text, "dd-MM-yyyy", null);
            einfo.From_date = fromdate.ToString();
            DateTime todate = DateTime.ParseExact(TxtToDate.Text, "dd-MM-yyyy", null);
            einfo.To_date = todate.ToString();

            einfo.Number_of_dayes = hdnResultValue.Value;
            einfo.Reason_of_absence = Request.Form["textarea_reasonforAbsence"];

            blogic.save_leaveform(einfo);
            TxtId.Text = string.Empty;

        }
        private RadioButton GetSelectedRadioButton(params RadioButton[] radioButtonGroup)
        {
            // Go through all the RadioButton controls that you passed to the method
            for (int i = 0; i < radioButtonGroup.Length; i++)
            {
                // If the current RadioButton control is checked,
                if (radioButtonGroup[i].Checked)
                {
                    // return it
                    return radioButtonGroup[i];
                }
            }
            return null;
        }


    }
}