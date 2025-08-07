page 70154 "Client Level Profit Loss List"
{
    PageType = List;
    SourceTable = "Client Level Profit Loss";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("CmCode"; Rec."CmCode") { ApplicationArea = All; }
                field("TmCode"; Rec."TmCode") { ApplicationArea = All; }
                field("ClientCode"; Rec."ClientCode") { ApplicationArea = All; }
                field("Margin"; Rec."Margin") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(processing)
        {
            // action(EditList)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Edit List';
            //     Image = EditLines;
            //     RunObject = Page "Client Margin List";
            //     RunPageMode = Edit;
            // }
        }
    }
}
