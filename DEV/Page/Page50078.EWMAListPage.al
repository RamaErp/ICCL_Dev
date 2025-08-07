page 50078 "EWMAListPage"
{
    Caption = 'EWMA List';
    PageType = List;
    SourceTable = "EWMA";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Date"; Rec."Date") { }
                field("Asset Token No."; Rec."Asset Token No.") { }
                field("Symbol / Asset Code"; Rec."Symbol / Asset Code") { }
                field("Std Dev (0.995)"; Rec."Std Dev (0.995)") { }
                field("Std Dev (0.94)"; Rec."Std Dev (0.94)") { }
            }
        }
    }
}

