table 70115 StressCDXTheoreticalPrices
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Date; DateTime)
        {
            DataClassification = SystemMetadata;
        }

        field(2; Expiry; DateTime)
        {
            DataClassification = SystemMetadata;
        }

        field(3; SeriesID; BigInteger)
        {
            DataClassification = CustomerContent;
        }

        field(4; CallPut; Code[2])
        {
            DataClassification = CustomerContent;
        }

        field(5; AssetCode; Code[10])
        {
            DataClassification = CustomerContent;
        }

        field(6; StrikeRate; BigInteger)
        {

        }

        field(7; TimeToExpiration; Integer)
        {
            DataClassification = SystemMetadata;
        }

        field(8; Rate; Integer)
        {
            DataClassification = SystemMetadata;
        }

        field(9; Volatility; Decimal)
        {
            DecimalPlaces = 6;
        }
        field(10; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
    }

    keys
    {
        key(PK; "Entry No.", Date, SeriesID, AssetCode)
        {
            Clustered = true;
        }
    }
}
