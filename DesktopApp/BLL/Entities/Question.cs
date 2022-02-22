using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Question
    {
        public int Ques_No { get; set; }
        public string Ques_Desc { get; set; }
        public ChoiceList ChoiceList { get; set; }

    }
}
