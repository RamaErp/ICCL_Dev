table 70107 vwSTRESS_BCX_ClosingPrice
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; CloseDate; DateTime)
        {
            DataClassification = SystemMetadata;
        }

        field(2; AssetSymbol; Code[50])
        {
            DataClassification = CustomerContent;
        }

        field(3; OptionType; Code[2])
        {
            DataClassification = CustomerContent;
        }

        field(4; StrikePrice; Decimal)
        {
            DecimalPlaces = 4;
        }

        field(5; ExpiryDate; DateTime)
        {
            DataClassification = SystemMetadata;
        }

        field(6; TodayClosePrice; Decimal)
        {

            DecimalPlaces = 6;
        }
        field(7; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
    }

    keys
    {
        key(PK; "Entry No.", AssetSymbol, OptionType, ExpiryDate)
        {
            Clustered = true;
        }
    }
}
