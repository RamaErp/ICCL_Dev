table 50100 "Scenario Price"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Report Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Asset Token No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Std Dev (0.995)"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 8;
        }
        field(4; "Std Dev (0.94)"; Decimal)
        {
            DecimalPlaces = 0 : 8;
            DataClassification = ToBeClassified;
        }
        field(5; "PSR"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Sigma Scaling Factor"; Decimal)
        {
            DecimalPlaces = 0 : 8;
            DataClassification = ToBeClassified;
        }
        field(7; "MPOR"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Series ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "1st Scenario %"; Decimal)
        {
            DecimalPlaces = 0 : 8;
            DataClassification = ToBeClassified;
        }
        field(10; "2nd Scenario %"; Decimal)
        {
            DecimalPlaces = 0 : 8;
            DataClassification = ToBeClassified;
        }
        field(11; "3rd Scenario %"; Decimal)
        {
            DecimalPlaces = 0 : 8;
            DataClassification = ToBeClassified;
        }
        field(12; "4th Scenario %"; Decimal)
        {
            DecimalPlaces = 0 : 8;
            DataClassification = ToBeClassified;
        }
        field(13; "Contract Underlying Price"; Decimal)
        {
            DecimalPlaces = 0 : 8;
            DataClassification = ToBeClassified;
        }
        field(14; "1st Scenario Price"; Decimal)
        {
            DecimalPlaces = 0 : 8;
            DataClassification = ToBeClassified;
        }
        field(15; "2nd Scenario Price"; Decimal)
        {
            DecimalPlaces = 0 : 8;
            DataClassification = ToBeClassified;
        }
        field(16; "3rd Scenario Price"; Decimal)
        {
            DecimalPlaces = 0 : 8;
            DataClassification = ToBeClassified;
        }
        field(17; "4th Scenario Price"; Decimal)
        {
            DecimalPlaces = 0 : 8;
            DataClassification = ToBeClassified;
        }
        field(18; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "Entry No.", "Report Date", "Asset Token No.")
        {
            Clustered = true;
        }
    }
}
