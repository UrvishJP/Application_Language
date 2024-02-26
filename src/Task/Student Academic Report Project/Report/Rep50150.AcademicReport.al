report 50150 "Academic Report"
{
    ApplicationArea = All;
    Caption = 'Academic Report';
    UsageCategory = ReportsAndAnalysis;
    PreviewMode = Normal;
    DefaultRenderingLayout = RDLCLayout;


    dataset
    {
        dataitem(Student; Student)
        {

            RequestFilterFields = ID;
            column(ID; ID)
            {
            }
            column(Name; Name)
            {
            }
            column(Stream; Stream)
            {
            }
            column(ObtainMarks; "Obtain Marks")
            {
            }
            column(TotalMarks; "Total Marks")
            {
            }
            column(City; City)
            {
            }
            column(School_Name; "School Name")
            {

            }

            dataitem(Result; Result)
            {
                DataItemLink = ID = field(ID);

                column(Subject; Subject)
                {

                }

                column(Obtain_Marks; "Obtain Marks")
                {
                }
                column(Total_Marks; "Total Marks")
                {
                }

            }
        }

    }

    rendering
    {
        layout(RDLCLayout)
        {
            Type = RDLC;
            LayoutFile = './src/Task/Student Academic Report Project/Report/Academic Report.RDL';
        }
    }
}
