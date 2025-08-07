table 70112 StressBCXMemberLevelProMargin
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

        field(3; FundsPayInAtEODPrice; Decimal)
        {
            //  DataClassification = Financial;
            DecimalPlaces = 6;
        }

        field(4; FundsPayOutAtEODPrice; Decimal)
        {
            //  DataClassification = Financial;
            DecimalPlaces = 6;
        }

        field(5; ProprietaryMarginRTRMS; Decimal)
        {
            // DataClassification = Financial;
            DecimalPlaces = 6;
        }
        field(6; "Entry No."; Integer)
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
