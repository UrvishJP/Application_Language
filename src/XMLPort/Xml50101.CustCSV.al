xmlport 50101 CustCSV
{
    Caption = 'CustXML';
    Direction = Export;
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement(Customer; Customer)
            {
                fieldattribute(Number; Customer."No.") { }
                fieldattribute(Language; Customer."Language Code") { }
                fieldelement(Name; Customer.Name) { }
                textelement(Address)
                {
                    fieldelement(StreetAndNr; Customer.Address)
                    {
                        fieldattribute(Address2; customer."Address 2") { }
                    }
                    fieldelement(City; Customer.City)
                    {
                        fieldattribute(Zipcode; Customer."Post Code") { }
                    }
                }
                fieldelement(Phone; Customer."Phone No.") { }
            }
        }
    }
  
}
