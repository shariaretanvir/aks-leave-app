//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataLayer
{
    using System;
    using System.Collections.Generic;
    
    public partial class Employee_information
    {
        public Employee_information()
        {
            this.Leave_information = new HashSet<Leave_information>();
        }
    
        public int Employ_Id { get; set; }
        public string Employ_Name { get; set; }
        public string Employ_Email { get; set; }
        public string Department { get; set; }
        public string Mobile_number { get; set; }
        public string Role { get; set; }
        public string Superviser_Id { get; set; }
        public string Designation { get; set; }
    
        public virtual ICollection<Leave_information> Leave_information { get; set; }
    }
}
