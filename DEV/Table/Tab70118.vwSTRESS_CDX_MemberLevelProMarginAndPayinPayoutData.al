table 70118 StrssCDXLvlProMrgnAndPyinPyout
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PositionDate; DateTime)
        {
            DataClassification = SystemMetadata;
        }

        field(2; CmCode; Code[10])
        {
            DataClassification = CustomerContent;
        }

        field(3; FundsPayInPreDay; Decimal)
        {
            DecimalPlaces = 2;
        }

        field(4; FundsPayOutPreDay; Decimal)
        {
            DecimalPlaces = 2;
        }

        field(5; FundsPayInAtEODPrice; Decimal)
        {
            DecimalPlaces = 2;
        }

        field(6; FundsPayOutAtEODPrice; Decimal)
        {
            DecimalPlaces = 2;
        }

        field(7; ProprietaryMarginRTRMS; Decimal)
        {
            DecimalPlaces = 2;
        }
        field(8; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
    }

    keys
    {
        key(PK; "Entry No.", PositionDate, CmCode)
        {
            Clustered = true;
        }
    }
}
