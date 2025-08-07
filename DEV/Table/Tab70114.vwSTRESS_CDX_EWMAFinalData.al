table 70114 StressCDXEWMAFinalData
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ReportDate; DateTime)
        {
            DataClassification = SystemMetadata;
        }

        field(2; AssetCode; Code[10])
        {
            DataClassification = CustomerContent;
        }

        field(3; Symbol; Code[10])
        {
            DataClassification = CustomerContent;
        }

        field(4; StdDeviation0995; Decimal)
        {
            DecimalPlaces = 10;
        }

        field(5; StdDeviation094; Decimal)
        {
            DecimalPlaces = 10;
        }
        field(6; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
    }

    keys
    {
        key(PK; "Entry No.", ReportDate, AssetCode, Symbol)
        {
            Clustered = true;
        }
    }
}
