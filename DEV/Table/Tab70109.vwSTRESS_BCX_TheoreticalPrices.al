table 70109 StressBCXTheoreticalPrices
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Date; DateTime)
        {
            DataClassification = SystemMetadata;
        }

        field(2; AssetSymbol; Code[30])
        {
            DataClassification = CustomerContent;
        }

        field(3; OptionType; Code[2])
        {
            DataClassification = CustomerContent;
        }

        field(4; StrikePrice; Decimal)
        {
            // DataClassification = Financial;
            DecimalPlaces = 4;
        }

        field(5; ExpiryDate; DateTime)
        {
            DataClassification = SystemMetadata;
        }

        field(6; TimeToExpiration; Integer)
        {
            DataClassification = SystemMetadata;
        }

        field(7; Rate; Integer)
        {
            // DataClassification = Financial;
        }

        field(8; Volatility; Decimal)
        {
            // DataClassification = Financial;
            DecimalPlaces = 14;
        }
        field(9; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
    }

    keys
    {
        key(PK; "Entry No.", Date, AssetSymbol, OptionType, ExpiryDate)
        {
            Clustered = true;
        }
    }
}
