table 70119 "Client Level Net Position"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Date"; DateTime)
        {
            DataClassification = SystemMetadata;
        }
        field(2; "CmCode"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(3; "TmCode"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(4; "ClientCode"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(5; "ProductType"; Code[2])
        {
            DataClassification = CustomerContent;
        }
        field(6; "SeriesId"; Integer)
        {
            DataClassification = SystemMetadata;
        }
        field(7; "StrikePrice"; Decimal)
        {
            DecimalPlaces = 4;
        }
        field(8; "CallPut"; Code[2])
        {
        }
        field(9; "AssetCode"; Code[50])
        {
        }
        field(10; "SeriesCode"; Code[50])
        {
        }
        field(11; "MarketLot"; Integer)
        {
            DataClassification = SystemMetadata;
        }
        field(12; "UnderLyingId"; Code[20])
        {
            DataClassification = SystemMetadata;
        }
        field(13; "PreDayClosePrice"; Decimal)
        {
            DecimalPlaces = 6;
        }
        field(14; "TodayClosePrice"; Decimal)
        {
            DecimalPlaces = 6;
        }
        field(15; "CPCode"; Code[14])
        {
            DataClassification = CustomerContent;
        }
        field(16; "NetQty"; BigInteger)
        {
        }
        field(17; "NetValue"; Decimal)
        {
            DecimalPlaces = 5;
        }
        field(18; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
    }

    keys
    {
        key(PK; "Entry No.", "ClientCode", "Date", "SeriesId")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        // Add logic if necessary
    end;
}
