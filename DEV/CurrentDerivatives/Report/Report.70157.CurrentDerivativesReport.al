report 70150 "Current Derivatives Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    dataset
    {
        dataitem(CurrentDerivativesInputs; CurrentDerivativesInputs)
        {

            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                // MakeExcelInfo();
                // MakeExcelHeader();
                Sr := 0;
                ExcelBuffer.NewRow();
                ExcelBuffer.AddColumn('Sr.No', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('CmCode', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('TmCode', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('ClientCode', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('ProductType', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('SeriesId', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('StrikePrice', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Call/Put', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('AssetCode', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('SeriesCode', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('MarketLot', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('UnderLyingId', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('PreDayClosePrice', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('TodayClosePrice', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('CPCode', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('NetQty', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('NetValue', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('NetValueOnTodayClosePrice', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Scenario 1A (Increase)', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Scenario 1B (Increase)', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Scenario 2A (Decrease)', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Scenario 2B (Decrease)', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Scenario3PriceMax', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Scenario4PriceMax', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('NetValueOnScenario1A', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('NetValueOnScenario1B', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('NetValueOnScenario2A', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('NetValueOnScenario2B', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('NetValueOnScenario3', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('NetValueOnScenario4', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Profit (+)/Loss(-) OnScenario1A', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Profit (+)/Loss(-) OnScenario1B', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Profit (+)/Loss(-) OnScenario2A', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Profit (+)/Loss(-) OnScenario2B', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Profit (+)/Loss(-) OnScenario3', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Profit (+)/Loss(-) OnScenario4', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);


                ExcelBuffer.NewRow();
            end;

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                Sr += 1;
                Clear(FPSC1A);
                Clear(FPSC1A);
                Clear(FPSC2A);
                Clear(FPSC2B);
                Clear(scenario5);
                Clear(scenario6);


                Clear(NetValueonTotalClosePrice);
                NetValueonTotalClosePrice := TodayClosePrice * NetQty;


                // FPSC1A := Scenario1A_Increase * Exp(7 * 0.79452);
                // FPSC1B := Scenario1B_Increase * Exp(7 * 0.79452);
                // FPSC2A := Scenario2A_Decrease * Exp(7 * 0.79452);
                // FPSC2B := Scenario2B_Decrease * Exp(7 * 0.79452);
                FPSC1A := Scenario1A_Increase;
                FPSC1B := Scenario1B_Increase;
                FPSC2A := Scenario2A_Decrease;
                FPSC2B := Scenario2B_Decrease;
                Clear(Value1);
                Value1 := NetQty * FPSC1A;
                Clear(Value2);
                Value2 := NetQty * FPSC1B;
                Clear(Value3);
                Value3 := NetQty * FPSC2A;
                Clear(Value4);
                Value4 := NetQty * FPSC2B;
                Clear(Value5);
                Value5 := NetQty * Scenario3PriceMax;
                Clear(Value6);
                Value6 := NetQty * Scenario4PriceMin;
                Clear(ProfitLossSC1A);
                ProfitLossSC1A := CalculateDifference(CallPut, NetQty, NetValue, Value1);
                Clear(ProfitLossSC1B);
                ProfitLossSC1B := CalculateDifference(CallPut, NetQty, NetValue, Value2);
                Clear(ProfitLossSC2A);
                ProfitLossSC2A := CalculateDifference(CallPut, NetQty, NetValue, Value3);
                Clear(ProfitLossSC2B);
                ProfitLossSC2B := CalculateDifference(CallPut, NetQty, NetValue, Value4);
                Clear(ProfitLossSC3);
                ProfitLossSC3 := CalculateDifference(CallPut, NetQty, NetValue, Value5);
                Clear(ProfitLossSC4);
                ProfitLossSC4 := CalculateDifference(CallPut, NetQty, NetValue, Value6);
                // end;

                ExcelBuffer.NewRow;
                ExcelBuffer.AddColumn(sr, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CurrentDerivativesInputs.CmCode, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(CurrentDerivativesInputs.TmCode, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CurrentDerivativesInputs.ClientCode, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CurrentDerivativesInputs.ProductType, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CurrentDerivativesInputs.SeriesId, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CurrentDerivativesInputs.StrikePrice, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CurrentDerivativesInputs.CallPut, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CurrentDerivativesInputs.AssetCode, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CurrentDerivativesInputs.SeriesCode, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CurrentDerivativesInputs.MarketLot, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CurrentDerivativesInputs.UnderLyingId, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CurrentDerivativesInputs.PreDayClosePrice, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CurrentDerivativesInputs.TodayClosePrice, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CurrentDerivativesInputs.CPCode, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CurrentDerivativesInputs.NetQty, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CurrentDerivativesInputs.NetValue, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(NetValueonTotalClosePrice, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(FPSC1A, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(FPSC1B, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(FPSC2A, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(FPSC2B, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(Scenario3PriceMax, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(Scenario4PriceMin, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(Value1, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(Value2, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(Value3, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(Value4, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(Value5, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(Value6, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ProfitLossSC1A, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ProfitLossSC1b, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ProfitLossSC2A, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ProfitLossSC2b, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ProfitLossSC3, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ProfitLossSC4, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);



                //StoreScenarioAnalysis(CurrentDerivativesInputs)

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
                    // field(Name; SourceExpression)
                    // {

                    // }
                }
            }
        }


    }



    var
        myInt: Integer;

        ExcelBuffer: Record "Excel Buffer" temporary;
        Sr: Integer;
        NetValueonTotalClosePrice: Decimal;
        EDX_BC: Record EDX_BC;
        Sen: Decimal;
        Sen1: Decimal;
        Sen2: Decimal;
        Sen3: Decimal;
        Sen4: Decimal;
        Sen5: Decimal;
        Sen6: Decimal;
        Sen7: Decimal;
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
        ExcelBuffer.AddColumn('Current Derivatives Report', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn(CompanyName, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.NewRow();
        // ExcelBuffer.AddColumn(PeriodText, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);
        // ExcelBuffer.AddColumn(PeriodText1, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn('Details Current Derivatives Report', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
    end;



    procedure CreateExcel()
    var
        myInt: Integer;
    begin
        ExcelBuffer.CreateNewExcelBookY('', 'Current Derivatives Report', 'Current Derivatives Report', CompanyName, UserId);
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
        if ExpectedValue <> 0 then
            Difference := ExpectedValue - ActualValue
        else
            Difference := (ExpectedValue - ActualValue) / 100;


        // Apply the same logic as the Excel formula
        if ((CodeType = 'CE') or (CodeType = 'PE')) and (Qty > 0) and (Difference <= 0) then
            exit(0) // All conditions are met, return 0
        else
            exit(Difference); // Otherwise return the actual difference
    end;

    // procedure CalculateScenario1AProfit(var Rec: Record CurrentDerivativesInputs): Decimal
    // var
    //     NetChange: Decimal;
    // begin
    //     NetChange := Rec. - Rec."NetValue";

    //     if ((Rec."Call/Put" = Rec."Call/Put"::Call) or (Rec."Call/Put" = Rec."Call/Put"::Put))
    //        and (Rec."NetQty" > 0)
    //        and (NetChange < 0)
    //     then
    //         exit(0)
    //     else
    //         exit(NetChange);
    // end;

    local procedure StoreScenarioAnalysis(SourceRec: Record CurrentDerivativesInputs)
    var
        ScenarioAnalysis: Record CurrentDerivativesOutputs;
        LastSrNo: Integer;
    begin
        ScenarioAnalysis.Init();

        if ScenarioAnalysis.FindLast() then
            LastSrNo := ScenarioAnalysis."Sr. No." + 1
        else
            LastSrNo := 1;

        ScenarioAnalysis."Sr. No." := LastSrNo;

        // Map fields from SourceRec (replace with your source logic)
        ScenarioAnalysis."CmCode" := SourceRec.CmCode;
        ScenarioAnalysis."TmCode" := SourceRec.TmCode;
        ScenarioAnalysis."ClientCode" := SourceRec."ClientCode";
        ScenarioAnalysis."Producttype" := SourceRec."ProductType";
        ScenarioAnalysis."SeriesId" := SourceRec."SeriesID";
        ScenarioAnalysis."StrikePrice" := SourceRec."StrikePrice";
        ScenarioAnalysis.CallPut := SourceRec.CallPut;
        ScenarioAnalysis."AssetCode" := SourceRec."AssetCode";
        ScenarioAnalysis."SeriesCode" := SourceRec."SeriesCode";
        ScenarioAnalysis."MarketLot" := SourceRec."MarketLot";
        ScenarioAnalysis."UnderlyingId" := SourceRec."UnderlyingID";
        ScenarioAnalysis."PreDayClosePrice" := SourceRec."PreDayClosePrice";
        ScenarioAnalysis."TodayClosePrice" := SourceRec."TodayClosePrice";
        ScenarioAnalysis."CPCode" := SourceRec."CPCode";
        ScenarioAnalysis."NetQty" := SourceRec.NetQty;
        ScenarioAnalysis."NetValue" := SourceRec."NetValue";
        ScenarioAnalysis."NetValueonTodayClosePrice" := NetValueonTotalClosePrice;

        // Scenarios – assuming values are calculated or coming from SourceRec
        ScenarioAnalysis.Scenario1APrice := FPSC1A;
        ScenarioAnalysis.Scenario1BPrice := FPSC1B;
        ScenarioAnalysis.Scenario2APrice := FPSC2A;
        ScenarioAnalysis.Scenario2BPrice := FPSC2B;
        ScenarioAnalysis.Scenario3PriceMax := scenario5;
        ScenarioAnalysis.Scenario4PriceMax := scenario6;

        // Net Values in Scenarios
        ScenarioAnalysis.NetValueOnScenario1A := Value1;
        ScenarioAnalysis.NetValueOnScenario1B := Value2;
        ScenarioAnalysis.NetValueOnScenario2A := Value3;
        ScenarioAnalysis.NetValueOnScenario2B := Value4;
        ScenarioAnalysis.NetValueOnScenario3 := Value5;
        ScenarioAnalysis.NetValueOnScenario4 := Value6;

        // Profit/Loss in Scenarios
        ScenarioAnalysis.ProfitLossScenario1A := ProfitLossSC1A;
        ScenarioAnalysis.ProfitLossScenario1B := ProfitLossSC1b;
        ScenarioAnalysis.ProfitLossScenario2A := ProfitLossSC2A;
        ScenarioAnalysis.ProfitLossScenario2B := ProfitLossSC2b;
        ScenarioAnalysis.ProfitLossScenario3 := ProfitLossSC3;
        ScenarioAnalysis.ProfitLossScenario4 := ProfitLossSC4;

        ScenarioAnalysis.Insert();
    end;

}