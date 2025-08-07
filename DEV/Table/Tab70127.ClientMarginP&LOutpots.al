table 50102 "Client Margin P&L Outputs"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "SrNo"; Integer)
        {
            DataClassification = SystemMetadata;
        }
        field(2; "CmCode"; Code[10]) { }
        field(3; "TmCode"; Code[10]) { }
        field(4; "ClientCode"; Code[20]) { }

        field(5; "Scenario1A"; Decimal)
        {
            Caption = 'Sum of Profit (+)/Loss(-) OnScenario1A';
        }
        field(6; "Scenario1B"; Decimal)
        {
            Caption = 'Sum of Profit (+)/Loss(-) OnScenario1B';
        }
        field(7; "Scenario2A"; Decimal)
        {
            Caption = 'Sum of Profit (+)/Loss(-) OnScenario2A';
        }
        field(8; "Scenario2B"; Decimal)
        {
            Caption = 'Sum of Profit (+)/Loss(-) OnScenario2B';
        }
        field(9; "Scenario3"; Decimal)
        {
            Caption = 'Sum of Profit (+)/Loss(-) OnScenario3';
        }
        field(10; "Scenario4"; Decimal)
        {
            Caption = 'Sum of Profit (+)/Loss(-) OnScenario4';
        }
    }

    keys
    {
        key(PK; "SrNo")
        {
            Clustered = true;
        }
    }
}
