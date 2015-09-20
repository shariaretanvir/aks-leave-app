using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLayer;

namespace BusinessLayer
{
    public class BusinessLogicLayer
    {
        DataLogicLayer dlogic = null;
        public Employee_information fillTextbox(int einfo)
        {
            dlogic = new DataLogicLayer();
            return dlogic.filltxtbox(einfo).SingleOrDefault();
        }

        public void save_leaveform(Leave_information einfo)
        {
            dlogic = new DataLogicLayer();
            dlogic.save_leaveinfo(einfo);
        }
    }
}
