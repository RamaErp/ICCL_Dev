table 70154 "Client Level Profit Loss"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "CmCode"; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(2; "TmCode"; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(3; "ClientCode"; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(4; "Margin"; Decimal)
        {
            DataClassification = CustomerContent;
            DecimalPlaces = 2 : 2;
        }
        field(5; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
    }

    keys
    {
        key(PK; "Entry No.", "CmCode", "TmCode", "ClientCode")
        {
            Clustered = true;
        }
    }
}
