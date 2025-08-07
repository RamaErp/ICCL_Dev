report 70151 "CD_ClientLevelProfitLossReport"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(CD_ClientLevelProfitLoss; CD_ClientLevelProfitLoss)
        {
            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                Sr := 0;
                ExcelBuffer.NewRow();
                ExcelBuffer.AddColumn('Sr.No', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('CmCode', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('TmCode', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Client Code', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Profit (+)/Loss(-) OnScenario1A', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Profit (+)/Loss(-) OnScenario1B', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Profit (+)/Loss(-) OnScenario2A', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Profit (+)/Loss(-) OnScenario2B', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Profit (+)/Loss(-) OnScenario3', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Profit (+)/Loss(-) OnScenario4', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Margin', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('NetLoss(-) OnScenario1A', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('NetLoss(-) OnScenario1B', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('NetLoss(-) OnScenario2A', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('NetLoss(-) OnScenario2B', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('NetLoss(-) OnScenario3', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('NetLoss(-) OnScenario4', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
            end;

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                Clear(SenPrice1A);
                Clear(SenPrice1B);
                Clear(SenPrice2A);
                Clear(SenPrice2B);
                Clear(scenario3);
                Clear(scenario4);
                ScenarioAnalysis.Reset();
                ScenarioAnalysis.SetRange(CmCode, CD_ClientLevelProfitLoss.CmCode);
                ScenarioAnalysis.SetRange(TmCode, CD_ClientLevelProfitLoss.TmCode);
                ScenarioAnalysis.SetRange(ClientCode, CD_ClientLevelProfitLoss.ClientCode);
                if ScenarioAnalysis.FindSet() then begin
                    repeat
                        SenPrice1A += ScenarioAnalysis.ProfitLossScenario1A;
                        SenPrice1B += ScenarioAnalysis.ProfitLossScenario1B;
                        SenPrice2A += ScenarioAnalysis.ProfitLossScenario2A;
                        SenPrice2B += ScenarioAnalysis.ProfitLossScenario2B;
                        scenario3 += ScenarioAnalysis.ProfitLossScenario3;
                        scenario4 += ScenarioAnalysis.ProfitLossScenario4;

                    until ScenarioAnalysis.Next() = 0
                end;

                Clear(NetPLSenPrice1A);
                if CD_ClientLevelProfitLoss.ClientCode = 'OWN' then
                    NetPLSenPrice1A := SenPrice1A
                else
                    NetPLSenPrice1A := CD_ClientLevelProfitLoss.Margin + SenPrice1A;


                if CD_ClientLevelProfitLoss.ClientCode = 'OWN' then
                    NetPLSenPrice1B := SenPrice1B
                else
                    NetPLSenPrice1B := CD_ClientLevelProfitLoss.Margin + SenPrice1B;

                if CD_ClientLevelProfitLoss.ClientCode = 'OWN' then
                    NetPLSenPrice2A := SenPrice2A
                else
                    NetPLSenPrice2A := CD_ClientLevelProfitLoss.Margin + SenPrice2A;

                if CD_ClientLevelProfitLoss.ClientCode = 'OWN' then
                    NetPLSenPrice2B := SenPrice2B
                else
                    NetPLSenPrice2B := CD_ClientLevelProfitLoss.Margin + SenPrice2B;

                if CD_ClientLevelProfitLoss.ClientCode = 'OWN' then
                    NetPLscenario3 := scenario3
                else
                    NetPLscenario3 := CD_ClientLevelProfitLoss.Margin + scenario3;

                if CD_ClientLevelProfitLoss.ClientCode = 'OWN' then
                    NetPLscenario4 := scenario4
                else
                    NetPLscenario4 := CD_ClientLevelProfitLoss.Margin + scenario4;


                Clear(NetLLossenPrice1A);
                NetLLossenPrice1A := GetAdjustedProfitLoss(NetPLSenPrice1A);
                Clear(NetLLossSenPrice1B);
                NetLLossSenPrice1B := GetAdjustedProfitLoss(NetPLSenPrice1B);
                Clear(NetLLossSenPrice2A);
                NetLLossSenPrice2A := GetAdjustedProfitLoss(NetPLSenPrice2A);
                Clear(NetLLossSenPrice2B);
                NetLLossSenPrice2B := GetAdjustedProfitLoss(NetPLSenPrice2B);
                Clear(NetLLossscenario3);
                NetLLossscenario3 := GetAdjustedProfitLoss(NetPLscenario3);
                Clear(NetLLossscenario4);
                NetLLossscenario4 := GetAdjustedProfitLoss(NetPLscenario4);
                Sr += 1;

                ExcelBuffer.NewRow;
                ExcelBuffer.AddColumn(sr, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CD_ClientLevelProfitLoss.CmCode, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(CD_ClientLevelProfitLoss.TmCode, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CD_ClientLevelProfitLoss.ClientCode, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(SenPrice1A, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(SenPrice1B, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(SenPrice2A, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(SenPrice2B, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(scenario3, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(scenario4, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CD_ClientLevelProfitLoss.Margin, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(NetLLossenPrice1A, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(NetLLossSenPrice1B, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(NetLLossSenPrice2A, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(NetLLossSenPrice2B, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(NetLLossscenario3, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(NetLLossscenario4, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);


                // StoreScenarioAnalysis(CD_ClientLevelProfitLoss)
            end;
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }


    }



    var
        myInt: Integer;
        ExcelBuffer: Record "Excel Buffer" temporary;
        Sr: Integer;
        ScenarioAnalysis: Record CurrentDerivativesOutputs;

        SenPrice1A: Decimal;
        SenPrice1B: Decimal;
        SenPrice2A: Decimal;
        SenPrice2B: Decimal;
        scenario3: Decimal;
        scenario4: Decimal;
        // scenario5: Decimal;
        //  scenario6: Decimal;
        scenario12: Decimal;
        SenPrice1: Decimal;
        SenPrice2: Decimal;
        SenPrice3: Decimal;
        SenPrice4: Decimal;
        scenario1: Decimal;
        scenario2: Decimal;
        scenario5: Decimal;
        scenario6: Decimal;
        FPSC1A: Decimal;
        FPSC1B: Decimal;
        FPSC2A: Decimal;
        FPSC2B: Decimal;
        Value1: Decimal;
        Value2: Decimal;
        Value3: Decimal;
        Value4: Decimal;
        Value5: Decimal;
        Value6: Decimal;
        Value7: Decimal;
        Value8: Decimal;
        ProfitLossSC1A: Decimal;
        ProfitLossSC1B: Decimal;
        ProfitLossSC2A: Decimal;
        ProfitLossSC2B: Decimal;
        ProfitLossSC3: Decimal;
        ProfitLossSC4: Decimal;
        optionPrice: Record "Option Pricing Input";
        BsmOutput: Record "BSM Model Pricing Uotput";
        NetPLSenPrice1A: Decimal;
        NetPLSenPrice1B: Decimal;
        NetPLSenPrice2A: Decimal;
        NetPLSenPrice2B: Decimal;
        NetPLscenario3: Decimal;
        NetPLscenario4: Decimal;
        NetLLossenPrice1A: Decimal;
        NetLLossSenPrice1B: Decimal;
        NetLLossSenPrice2A: Decimal;
        NetLLossSenPrice2B: Decimal;
        NetLLossscenario3: Decimal;
        NetLLossscenario4: Decimal;

    trigger OnPreReport()
    var
        myInt: Integer;

    begin
        ExcelBuffer.DELETEALL;
        // Clear(PeriodText);
        // Clear(PeriodText1);
        // PeriodText := Format(FromDate);
        // PeriodText1 := Format(ToDate);

        // companyinf.Reset();
        // if companyinf.FindFirst() then
        //     CompName := companyinf.Name;

        MakeExcelInfo();
        MakeExcelHeader();




    end;

    trigger OnPostReport()
    var
        myInt: Integer;
    begin
        CreateExcel();
    end;

    procedure MakeexcelInfo()
    var
        myInt: Integer;
    begin
        ExcelBuffer.SetUseInfoSheet;
        ExcelBuffer.AddInfoColumn(COMPANYNAME, FALSE, TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow();
        ExcelBuffer.AddInfoColumn(USERID, FALSE, TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow();
        ExcelBuffer.AddInfoColumn(Today, false, TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow();
        ExcelBuffer.ClearNewRow;
    end;

    procedure MakeExcelHeader()
    var
        myInt: Integer;
    begin
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn('Client Level Margin P&L', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn(CompanyName, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.NewRow();
        // ExcelBuffer.AddColumn(PeriodText, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);
        // ExcelBuffer.AddColumn(PeriodText1, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn('Details Client Level Margin P&L', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
    end;



    procedure CreateExcel()
    var
        myInt: Integer;
    begin
        ExcelBuffer.CreateNewExcelBookY('', 'Client Level Margin P&L', 'Client Level Margin P&L', CompanyName, UserId);
    end;


    procedure Logarithm(Number: Decimal; Base: Decimal): Decimal;
    var
        NaturalLogNumber: Decimal;
        NaturalLogBase: Decimal;
    begin
        if Number <= 0 then
            Error('The number must be greater than 0.');

        if Base <= 0 then
            Error('The base must be greater than 0.');

        // Calculate natural logarithms using an approximation method
        NaturalLogNumber := CalculateNaturalLog(Number);
        NaturalLogBase := CalculateNaturalLog(Base);

        // Logarithm of Number with the specified base
        exit(NaturalLogNumber / NaturalLogBase);
    end;

    procedure CalculateNaturalLog(X: Decimal): Decimal;
    var
        PreviousValue: Decimal;
        CurrentValue: Decimal;
        Difference: Decimal;
        Iterations: Integer;
        MaxIterations: Integer;
    begin
        // Newton's method for approximating natural log
        PreviousValue := 0;
        CurrentValue := X - 1; // Start approximation from (X - 1)
        Difference := CurrentValue - PreviousValue;
        Iterations := 0;
        MaxIterations := 1000; // Set a maximum number of iterations

        while (ABS(Difference) > 0.000001) and (Iterations < MaxIterations) do begin
            PreviousValue := CurrentValue;
            CurrentValue := PreviousValue - ((Exp(PreviousValue) - X) / Exp(PreviousValue)); // Newton's method step
            Difference := CurrentValue - PreviousValue;
            Iterations += 1;
        end;

        exit(CurrentValue);
    end;



    procedure CalculateLnOfTwo(): Decimal
    var
        ln2Approximation: Decimal;
        n: Integer;
        term, x : Decimal;
    begin
        ln2Approximation := 0;
        x := (2 - 1); // for ln(2), x = 1 (because ln(1+x) = ln(2) when x = 1)

        // Calculate using a simple Taylor series expansion for ln(1+x)
        for n := 1 to 100 do begin
            term := Power(x, n) / n; // Calculate each term of the series
            if n mod 2 = 0 then
                ln2Approximation -= term // Subtract even terms
            else
                ln2Approximation += term; // Add odd terms
        end;

        // Message('Approximated natural logarithm of 2: %1', ln2Approximation);
        exit(ln2Approximation);
    end;

    // procedure CalculateLn(x: Decimal): Decimal
    // var
    //     lnApproximation: Decimal;
    //     n: Integer;
    //     term, y : Decimal;
    // begin
    //     if x <= 0 then begin
    //         Error('Natural logarithm is undefined for non-positive numbers.');
    //     end;

    //     lnApproximation := 0;
    //     y := (x - 1) / (x + 1); // Change of variable for faster convergence (y = (x-1)/(x+1))

    //     // Calculate using a Taylor series expansion for ln(x)
    //     for n := 1 to 100 step 2 do begin
    //         term := Power(y, n) / n; // Calculate each term of the series for odd n
    //         lnApproximation += 2 * term; // Multiply by 2 due to change of variable
    //     end;

    //     Message('Approximated natural logarithm of %1: %2', x, lnApproximation);
    //     exit(lnApproximation);
    // end;

    procedure CalculateLn(x: Decimal): Decimal
    var
        lnApproximation: Decimal;
        n: Integer;
        term, y : Decimal;
    begin
        if x <= 0 then begin
            //   Error('Natural logarithm is undefined for non-positive numbers.');
        end;

        lnApproximation := 0;
        y := (x - 1) / (x + 1); // Change of variable for faster convergence (y = (x-1)/(x+1))

        // Calculate using a Taylor series expansion for ln(x)
        n := 1;
        while n <= 100 do begin
            term := Power(y, n) / n; // Calculate each term of the series for odd n
            lnApproximation += 2 * term; // Multiply by 2 due to change of variable
            n := n + 2; // Increment n by 2 to consider only odd numbers
        end;

        //Message('Approximated natural logarithm of %1: %2', x, lnApproximation);
        exit(lnApproximation);
    end;

    procedure InsertImageInExcel()
    var
        ImageStream: InStream;
        FilePath: Text;
        FileManagement: Codeunit "File Management";


    begin
        // Load your image from a file or Blob into a stream
        // FilePath := 'C:\Images\Logo.png';
        // if FileManagement.BLOBImportWithFilter(FilePath, ImageStream) then begin
        // Handle stream to load into Excel using external library or extension
        // Use EPPlus or OpenXML library to work with Excel files directly.
        // end;
    end;

    procedure NORMSDIST(x: Decimal): Decimal;
    var
        pi: Decimal;
        erfResult: Decimal;
    begin
        // Constant values
        pi := 3.14159265359;

        // Approximation of the cumulative normal distribution using the error function (erf)
        erfResult := ERF(x / Power(2, 1 / 2));
        //Power(2, 1 / 2)

        // Calculate the NORMSDIST result
        exit(0.5 * (1 + erfResult));
    end;

    procedure ERF(x: Decimal): Decimal;
    var
        t: Decimal;
        z: Decimal;
        tau: Decimal;
    begin
        // Using an approximation formula for the error function (erf)
        t := 1 / (1 + 0.3275911 * ABS(x));
        z := t * (0.254829592 - t * (0.284496736 - t * (1.421413741 - t * (1.453152027 - t * 1.061405429))));

        tau := 1 - z * EXP(-x * x);
        if x >= 0 then
            exit(tau)
        else
            exit(-tau);
    end;

    procedure Exp(X: Decimal): Decimal;
    var
        Result: Decimal;
        Term: Decimal;
        i: Integer;
    begin
        // Exponential series approximation: e^x = 1 + x + x^2/2! + x^3/3! + ...
        Result := 1;
        Term := 1;
        // for i := 1 to 100 do begin
        //     Term := (Term * X) / i;
        //     Result := Result + Term;
        // end;
        for i := 1 to 100 do begin
            Term := (Term * X) / i;
            if ABS(Term) < 0.000000000001 then // 10^-10 or your precision threshold
                break;
            Result := Result + Term;
        end;

        exit(Result);
    end;

    procedure MaxValue(a: Decimal; b: Decimal): Decimal;
    begin
        if a > b then
            exit(a)
        else
            exit(b);
    end;

    procedure CalculateDifference(CodeType: Text[2]; Qty: Decimal; ActualValue: Decimal; ExpectedValue: Decimal): Decimal
    var
        Difference: Decimal;
    begin
        // Calculate the difference between actual and expected
        Difference := ActualValue - ExpectedValue;

        // Apply the same logic as the Excel formula
        if ((CodeType = 'CE') or (CodeType = 'PE')) and (Qty > 0) and (Difference < 0) then
            exit(0) // All conditions are met, return 0
        else
            exit(Difference); // Otherwise return the actual difference
    end;

    local procedure GetAdjustedProfitLoss(Value: Decimal): Decimal
    begin
        if Value >= 0 then
            exit(0)
        else
            exit(Value);
    end;

    procedure FormatCents(Value: Integer): Text
    var
        TextValue: Text;
        Sign: Text;
        Length: Integer;
    begin
        // Handle sign
        if Value < 0 then begin
            Sign := '-';
            Value := -Value;
        end;

        // Convert to text
        TextValue := Format(Value);
        Length := StrLen(TextValue);

        // Pad with zeroes if needed
        while Length < 3 do begin
            TextValue := '0' + TextValue;
            Length += 1;
        end;

        // Insert decimal point
        exit(Sign + CopyStr(TextValue, 1, Length - 2) + '.' + CopyStr(TextValue, Length - 1, 2));
    end;

    local procedure StoreScenarioAnalysis(SourceRec: Record CD_ClientLevelProfitLoss)
    var
        ScenarioAnalysis: Record "CD_Client Level P&L Output";
        LastSrNo: Integer;
    begin
        ScenarioAnalysis.Init();

        if ScenarioAnalysis.FindLast() then
            LastSrNo := ScenarioAnalysis."Sr. No" + 1
        else
            LastSrNo := 1;

        ScenarioAnalysis."Sr. No" := LastSrNo;

        // Map fields from SourceRec (replace with your source logic)
        ScenarioAnalysis.CmCode := SourceRec.CmCode;
        ScenarioAnalysis.TmCode := SourceRec.TmCode;
        ScenarioAnalysis."Client Code" := SourceRec.ClientCode;
        ScenarioAnalysis."Profit On Scenario1A" := SenPrice1A;
        ScenarioAnalysis."Profit On Scenario1B" := SenPrice1B;
        ScenarioAnalysis."Profit On Scenario2A" := SenPrice2A;
        ScenarioAnalysis."Profit On Scenario2B" := SenPrice2B;
        ScenarioAnalysis."Profit On Scenario3" := scenario3;
        ScenarioAnalysis."Profit On Scenario4" := scenario4;
        ScenarioAnalysis.Margin := SourceRec.Margin;
        ScenarioAnalysis."NetLoss On Scenario1A" := NetLLossenPrice1A;
        ScenarioAnalysis."NetLoss On Scenario1B" := NetLLossSenPrice1B;
        ScenarioAnalysis."NetLoss On Scenario2A" := NetLLossSenPrice2A;
        ScenarioAnalysis."NetLoss On Scenario2B" := NetLLossSenPrice2B;
        ScenarioAnalysis."NetLoss On Scenario3" := NetLLossscenario3;
        ScenarioAnalysis."NetLoss On Scenario4" := NetLLossscenario4;

        ScenarioAnalysis.Insert();
    end;

}