table 70151 "CD_ClientLevelProfitLoss"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "CmCode"; Integer)
        {
            DataClassification = CustomerContent;
        }

        field(2; "TmCode"; Integer)
        {
            DataClassification = CustomerContent;
        }

        field(3; "ClientCode"; code[20])
        {
            DataClassification = CustomerContent;
        }
        field(4; "Entry No"; Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(5; "Margin"; Decimal)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No", "CmCode", "TmCode", "ClientCode")
        {
            Clustered = true;
        }
    }
}
