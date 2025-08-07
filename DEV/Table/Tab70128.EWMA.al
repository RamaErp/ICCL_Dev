table 70128 "EWMA"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Date"; Date)
        {
            DataClassification = EndUserIdentifiableInformation;
        }
        field(2; "Asset Token No."; Code[20])
        {
            DataClassification = SystemMetadata;
        }
        field(3; "Symbol / Asset Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Std Dev (0.995)"; Decimal)
        {
            Caption = 'Standard Deviation (0.995)';
            DataClassification = ToBeClassified;
        }
        field(5; "Std Dev (0.94)"; Decimal)
        {
            Caption = 'Standard Deviation (0.94)';
            DataClassification = ToBeClassified;
        }
        field(6; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(PK; "Entry No.", "Date", "Asset Token No.") { Clustered = true; }
    }
}
