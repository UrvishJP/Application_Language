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
            column(EncodeStr; EncodeStr)
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
            trigger OnAfterGetRecord()
            var
                BarcodeSym: Enum "Barcode Symbology 2D";
                BarcodeProvider: Interface "Barcode Font Provider 2D";
            begin

                EncodeStr := "School Name";
                BarcodeProvider := Enum::"Barcode Font Provider 2D"::IDAutomation2D;
                BarcodeSym := Enum::"Barcode Symbology 2D"::"QR-Code";
                EncodeStr := BarcodeProvider.EncodeFont(EncodeStr, BarcodeSym);
            end;
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

    var
        EncodeStr: Text;
}
