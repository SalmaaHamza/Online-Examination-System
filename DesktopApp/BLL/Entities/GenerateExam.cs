using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    //  @CrsID_ int,@ExamNo int, @noTF int,@examDuration time(7)
    class GenerateExam
    {
        public int CrsID_ { get; set; }
        public int ExamNo { get; set; }
        public int noTF { get; set; }
        public DateTime examDuration {get; set;}

    }
}
