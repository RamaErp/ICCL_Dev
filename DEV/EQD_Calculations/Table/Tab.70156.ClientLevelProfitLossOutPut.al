table 70156 "Client Level P&L OutPut"
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

        field(4; "Profit/Loss Scenario1A"; Decimal)
        {
            Caption = 'Profit (+)/Loss(-) OnScenario1A';
        }

        field(5; "Profit/Loss Scenario1B"; Decimal)
        {
            Caption = 'Profit (+)/Loss(-) OnScenario1B';
        }

        field(6; "Profit/Loss Scenario2A"; Decimal)
        {
            Caption = 'Profit (+)/Loss(-) OnScenario2A';
        }

        field(7; "Profit/Loss Scenario2B"; Decimal)
        {
            Caption = 'Profit (+)/Loss(-) OnScenario2B';
        }

        field(8; "Profit/Loss Scenario3"; Decimal)
        {
            Caption = 'Profit (+)/Loss(-) OnScenario3';
        }

        field(9; "Profit/Loss Scenario4"; Decimal)
        {
            Caption = 'Profit (+)/Loss(-) OnScenario4';
        }

        field(10; "Margin"; Decimal)
        {
        }

        field(11; "NetLoss Scenario1A"; Decimal)
        {
            Caption = 'NetLoss Scenario1A';
        }

        field(12; "NetLoss Scenario1B"; Decimal)
        {
            Caption = 'NetLoss Scenario1B';
        }

        field(13; "NetLoss Scenario2A"; Decimal)
        {
            Caption = 'NetLoss Scenario2A';
        }

        field(14; "NetLoss Scenario2B"; Decimal)
        {
            Caption = 'NetLoss Scenario2B';
        }

        field(15; "NetLoss Scenario3"; Decimal)
        {
            Caption = 'NetLoss Scenario3';
        }

        field(16; "NetLoss Scenario4"; Decimal)
        {
            Caption = 'NetLoss Scenario4';
        }
        field(17; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(18; "NetLoss (-) OnScenario1A"; Decimal) { }
        field(19; "NetLoss (-) OnScenario1B"; Decimal) { }
        field(20; "NetLoss (-) OnScenario2A"; Decimal) { }
        field(21; "NetLoss (-) OnScenario2b"; Decimal) { }
        field(22; "NetLoss (-) OnScenario3"; Decimal) { }
        field(23; "NetLoss (-) OnScenario4"; Decimal) { }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
