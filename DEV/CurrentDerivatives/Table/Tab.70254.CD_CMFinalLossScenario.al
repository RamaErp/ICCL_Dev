
table 70254 "CD_CMFinalLossScenario"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "CmCode"; Integer)
        {
            DataClassification = CustomerContent;
        }

        field(2; "FundsPayInPreDay"; Decimal)
        {
            Caption = 'A - FundsPayInPreDay';
        }

        field(3; "FundsPayOutPreDay"; Decimal)
        {
            Caption = 'B - FundsPayOutPreDay';
        }

        field(4; "FundsPayInAtEODPrice"; Decimal)
        {
            Caption = 'C - FundsPayInAtEODPrice';
        }

        field(5; "FundsPayOutAtEODPrice"; Decimal)
        {
            Caption = 'D - FundsPayOutAtEODPrice';
        }
        field(6; "TmCode"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(9; "ProprietaryMarginRTRMS"; Decimal)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "CmCode") { Clustered = true; }
    }
}
