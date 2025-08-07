table 70158 "CMFinalLossOnScenario_New"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "CmCode"; Code[10])
        {
            DataClassification = CustomerContent;
        }

        // field(2; "TmCode"; Code[10])
        // {
        //     DataClassification = CustomerContent;
        // }

        // field(3; "ClientCode"; Code[20])
        // {
        //     DataClassification = CustomerContent;
        // }

        // field(4; "Margin"; Decimal)
        // {
        //     DataClassification = CustomerContent;
        // }
        field(5; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
        field(6; "FundsPayInPreDay"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(7; "FundsPayOutPreDay"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(8; "FundsPayInAtEODPrice"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(9; "FundsPayOutAtEODPrice"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "ProprietaryMarginRTRMS"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }


    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
