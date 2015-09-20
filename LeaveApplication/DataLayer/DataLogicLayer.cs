using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{
    public class DataLogicLayer
    {
        public List<Employee_information> filltxtbox(int einfo)
        {
            Leave_formEntities linfo = new Leave_formEntities();
            Employee_information emp_info = new Employee_information();
            return linfo.Employee_information.Where(x => x.Employ_Id == einfo).ToList();

        }

        public void save_leaveinfo(Leave_information einfo)
        {
            Leave_formEntities lconn = new Leave_formEntities();
            Leave_information einformation = new Leave_information();
            einformation.Employee_id = einfo.Employee_id;
            einformation.Absence_type = einfo.Absence_type;
            einformation.From_date = einfo.From_date;
            einformation.To_date = einfo.To_date;
            einformation.Number_of_dayes = einfo.Number_of_dayes;
            einformation.Reason_of_absence = einfo.Reason_of_absence;
            lconn.Leave_information.Add(einformation);
            lconn.SaveChanges();
        }
    }
}
