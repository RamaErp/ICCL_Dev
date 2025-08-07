page 70151 "CD_ClientLevelProfitLossInputs"
{
    PageType = List;
    SourceTable = CD_ClientLevelProfitLoss;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No") { }
                field("CmCode"; Rec."CmCode") { }
                field("TmCode"; Rec."TmCode") { }
                field("ClientCode"; Rec."ClientCode") { }
                field(Margin; Rec.Margin) { }
            }
        }
    }

    actions
    {
        area(navigation)
        {
        }

        area(processing)
        {
        }
    }
}
