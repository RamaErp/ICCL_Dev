table 70110 StressBCXClntLevelNetPosition
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; StressTestDate; DateTime)
        {
            DataClassification = SystemMetadata;
        }

        field(2; CmCode; Code[10])
        {
            DataClassification = CustomerContent;
        }

        field(3; TmCode; Code[10])
        {
            DataClassification = CustomerContent;
        }

        field(4; ClientCode; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(5; SeriesId; Integer)
        {
            DataClassification = CustomerContent;
        }

        field(6; AssetSymbol; Code[50])
        {
            DataClassification = CustomerContent;
        }

        field(7; OptionType; Code[10])
        {
            DataClassification = CustomerContent;
        }

        field(8; StrikePrice; Decimal)
        {
            //DataClassification = Financial;
            DecimalPlaces = 4;
        }

        field(9; ExpiryDate; DateTime)
        {
            DataClassification = SystemMetadata;
        }

        field(10; TodayClosePrice; Decimal)
        {
            //DataClassification = Financial;
            DecimalPlaces = 6;
        }

        field(11; NetQty; BigInteger)
        {
            //DataClassification = Financial;
        }

        field(12; NetValue; Decimal)
        {
            // DataClassification = Financial;
            DecimalPlaces = 5;
        }
        field(13; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
    }

    keys
    {
        key(PK; "Entry No.", StressTestDate, CmCode, TmCode, ClientCode, SeriesId)
        {
            Clustered = true;
        }
    }
}
