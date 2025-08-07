report 70152 "Client Series Level P&L New"
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Client Series Level P&L';
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(ClientSeriesLevelProfitLoss; ClientSeriesLevelProfitLoss)
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
                BsmOutput.Reset();
                BsmOutput.SetRange("Asset Code", ClientSeriesLevelProfitLoss.AssetCode);
                BsmOutput.SetRange("Series ID", ClientSeriesLevelProfitLoss.SeriesId);
                if BsmOutput.FindFirst() then begin
                    if ClientSeriesLevelProfitLoss.CallPut = 'C' then begin
                        // Call Option
                        FPSC1A := BsmOutput."Call Price SC1A";
                        FPSC1B := BsmOutput."Call Price SC1B";
                        FPSC2A := BsmOutput."Call Price SC2A";
                        FPSC2B := BsmOutput."Call Price SC2B";
                    end;
                    // Put Option 
                    if ClientSeriesLevelProfitLoss.CallPut = 'P' then begin
                        FPSC1A := BsmOutput."Put Price SC1A";
                        FPSC1B := BsmOutput."Put Price SC1B";
                        FPSC2A := BsmOutput."Put Price SC2A";
                        FPSC2B := BsmOutput."Put Price SC2B";
                    end;
                    if ClientSeriesLevelProfitLoss.CallPut = 'F' then begin
                        FPSC1A := BsmOutput."Future Price SC1A";
                        FPSC1B := BsmOutput."Future Price SC1B";
                        FPSC2A := BsmOutput."Future Price SC2A";
                        FPSC2B := BsmOutput."Future Price SC2B";
                    end;

                    scenario5 := BsmOutput.Scenario3PriceMax;
                    scenario6 := BsmOutput.Scenario4PriceMax;
                    // Clear(FPSC1A);
                    // Clear(FPSC1A);
                    // Clear(FPSC2A);
                    // Clear(FPSC2B);
                    // Clear(scenario1);
                    // Clear(scenario2);

                    // Clear(Sen);
                    // Clear(Sen1);
                    // EDX_BC.Reset();
                    // EDX_BC.SetRange("Series ID", ClientSeriesLevelProfitLoss."Series Code");
                    // IF EDX_BC.FindFirst() then begin
                    //     Sen := EDX_BC."Standard Deviation (0.995)" * EDX_BC.PSR * Power(EDX_BC.MPOR, 1 / 2);
                    //     sen1 := EDX_BC."Standard Deviation (0.94)" * EDX_BC."Sigma Scaling factor" * Power(EDX_BC.MPOR, 1 / 2);
                    //     // scenario12 := (Sen + sen1) * 100;
                    //     scenario1 := Round((Sen + sen1) * 100, 0.00000100);

                    //     Clear(Sen2);
                    //     Clear(Sen3);
                    //     Sen2 := EDX_BC."Standard Deviation (0.995)" * EDX_BC.PSR * Power(EDX_BC.MPOR, 1 / 2);
                    //     Sen3 := EDX_BC."Standard Deviation (0.995)" * EDX_BC."Sigma Scaling factor" * Power(EDX_BC.MPOR, 1 / 2);
                    //     scenario2 := Round((Sen2 + sen3) * 100, 0.00000100);

                    //     Clear(Sen4);
                    //     Clear(Sen5);
                    //     Sen4 := EDX_BC."Standard Deviation (0.995)" * EDX_BC.PSR * Power(EDX_BC.MPOR, 1 / 2);
                    //     sen5 := EDX_BC."Standard Deviation (0.94)" * EDX_BC."Sigma Scaling factor" * Power(EDX_BC.MPOR, 1 / 2);
                    //     scenario5 := Round((Sen4 + sen5) * 100 * -1, 0.00000100);
                    //     Clear(Sen6);
                    //     Clear(Sen7);
                    //     Sen6 := EDX_BC."Standard Deviation (0.995)" * EDX_BC.PSR * Power(EDX_BC.MPOR, 1 / 2);
                    //     Sen7 := EDX_BC."Standard Deviation (0.995)" * EDX_BC."Sigma Scaling factor" * Power(EDX_BC.MPOR, 1 / 2);
                    //     scenario6 := Round((Sen6 + sen7) * 100 * -1, 0.00000100);
                    // END;
                    //optionPrice.Reset();
                    // optionPrice.SetRange("Series ID", ClientSeriesLevelProfitLoss."Series Code");

                    //Clear(NetValueonTotalClosePrice);
                    //  NetValueonTotalClosePrice := ClientSeriesLevelProfitLoss.TodayClosePrice * NetQty;


                    // FPSC1A := scenario1 * Exp(7 * 0.79452);
                    // FPSC1B := scenario2 * Exp(7 * 0.79452);
                    // FPSC2A := scenario5 * Exp(7 * 0.79452);
                    // FPSC2B := scenario6 * Exp(7 * 0.79452);
                end;
                Clear(Value1);
                Value1 := ClientSeriesLevelProfitLoss.NetQty * ClientSeriesLevelProfitLoss.Scenario1AIncrease;
                Clear(Value2);
                Value2 := ClientSeriesLevelProfitLoss.NetQty * ClientSeriesLevelProfitLoss.Scenario1BIncrease;
                Clear(Value3);
                Value3 := ClientSeriesLevelProfitLoss.NetQty * ClientSeriesLevelProfitLoss.Scenario2ADecrease;
                Clear(Value4);
                Value4 := ClientSeriesLevelProfitLoss.NetQty * ClientSeriesLevelProfitLoss.Scenario2BDecrease;
                Clear(Value5);
                Value5 := ClientSeriesLevelProfitLoss.NetQty * ClientSeriesLevelProfitLoss.Scenario3PriceMax;
                Clear(Value6);
                Value6 := ClientSeriesLevelProfitLoss.NetQty * ClientSeriesLevelProfitLoss.Scenario4PriceMin;
                Clear(ProfitLossSC1A);
                //ProfitLossSC1A := CalculateResult(ClientSeriesLevelProfitLoss.CallPut, ClientSeriesLevelProfitLoss.NetValue, Value1);
                if ClientSeriesLevelProfitLoss.CallPut = ClientSeriesLevelProfitLoss.CallPut::F then
                    ProfitLossSC1A := Value1 - ClientSeriesLevelProfitLoss.NetValue
                else
                    ProfitLossSC1A := Value1;

                Clear(ProfitLossSC1B);
                //ProfitLossSC1B := CalculateResult(ClientSeriesLevelProfitLoss.CallPut, ClientSeriesLevelProfitLoss.NetValue, Value2);

                if ClientSeriesLevelProfitLoss.CallPut = ClientSeriesLevelProfitLoss.CallPut::F then
                    ProfitLossSC1B := Value2 - ClientSeriesLevelProfitLoss.NetValue
                else
                    ProfitLossSC1B := Value2;

                Clear(ProfitLossSC2A);
                //ProfitLossSC2A := CalculateResult(ClientSeriesLevelProfitLoss.CallPut, ClientSeriesLevelProfitLoss.NetValue, Value3);
                if ClientSeriesLevelProfitLoss.CallPut = ClientSeriesLevelProfitLoss.CallPut::F then
                    ProfitLossSC2A := Value3 - ClientSeriesLevelProfitLoss.NetValue
                else
                    ProfitLossSC2A := Value3;

                Clear(ProfitLossSC2B);
                // ProfitLossSC2B := CalculateResult(ClientSeriesLevelProfitLoss.CallPut, ClientSeriesLevelProfitLoss.NetValue, Value4);
                if ClientSeriesLevelProfitLoss.CallPut = ClientSeriesLevelProfitLoss.CallPut::F then
                    ProfitLossSC2B := Value4 - ClientSeriesLevelProfitLoss.NetValue
                else
                    ProfitLossSC2B := Value4;

                Clear(ProfitLossSC3);
                //ProfitLossSC3 := CalculateResult(ClientSeriesLevelProfitLoss.CallPut, ClientSeriesLevelProfitLoss.NetValue, Value5);
                if ClientSeriesLevelProfitLoss.CallPut = ClientSeriesLevelProfitLoss.CallPut::F then
                    ProfitLossSC3 := Value5 - ClientSeriesLevelProfitLoss.NetValue
                else
                    ProfitLossSC3 := Value5;



                Clear(ProfitLossSC4);
                //  ProfitLossSC4 := CalculateResult(ClientSeriesLevelProfitLoss.CallPut, ClientSeriesLevelProfitLoss.NetValue, Value6);

                if ClientSeriesLevelProfitLoss.CallPut = ClientSeriesLevelProfitLoss.CallPut::F then
                    ProfitLossSC4 := Value6 - ClientSeriesLevelProfitLoss.NetValue
                else
                    ProfitLossSC4 := Value6;



                ExcelBuffer.NewRow;
                ExcelBuffer.AddColumn(sr, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.CmCode, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.TmCode, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.ClientCode, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.ProductType, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.SeriesId, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.StrikePrice, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.CallPut, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.AssetCode, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.SeriesCode, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.MarketLot, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.UnderLyingId, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.PreDayClosePrice, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.TodayClosePrice, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.CPCode, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.NetQty, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.NetValue, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.NetValueOnTodayClosePrice, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.Scenario1AIncrease, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.Scenario1BIncrease, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.Scenario2ADecrease, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.Scenario2BDecrease, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.Scenario3PriceMax, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ClientSeriesLevelProfitLoss.Scenario4PriceMin, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(Value1, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(Value2, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(Value3, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(Value4, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(Value5, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(Value6, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ProfitLossSC1A, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ProfitLossSC1b, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ProfitLossSC2A, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ProfitLossSC2b, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ProfitLossSC3, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(ProfitLossSC4, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);



                //StoreScenarioAnalysis(ClientSeriesLevelProfitLoss)

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
        ExcelBuffer.AddColumn('Client Series Level P&L', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn(CompanyName, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.NewRow();
        // ExcelBuffer.AddColumn(PeriodText, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);
        // ExcelBuffer.AddColumn(PeriodText1, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn('Details Client Series Level P&L', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
    end;



    procedure CreateExcel()
    var
        myInt: Integer;
    begin
        ExcelBuffer.CreateNewExcelBookY('', 'Client Series Level P&L', 'Client Series Level P&L', CompanyName, UserId);
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

    procedure CalculateDifference(CodeType: Option; Qty: Decimal; ActualValue: Decimal; ExpectedValue: Decimal): Decimal
    var
        Difference: Decimal;
    begin
        // Calculate the difference between actual and expected
        Difference := ExpectedValue - ActualValue;

        // Apply the same logic as the Excel formula
        if ((CodeType = 'C') or (CodeType = 'P')) and (Qty > 0) and (Difference < 0) then
            exit(0) // All conditions are met, return 0
        else
            exit(Difference); // Otherwise return the actual difference
    end;

    procedure CalculateResult(G: Option F,P,C,; X: Decimal; P: Decimal): Decimal
    var
        Result: Decimal;
    begin
        if G = 'F' then
            Result := P - X
        else
            Result := P;

        exit(Result);
    end;

    local procedure StoreScenarioAnalysis(SourceRec: Record ClientSeriesLevelProfitLoss)
    var
        ScenarioAnalysis: Record "ClientSeriesLvlPLOutput";
        LastSrNo: Integer;
    begin
        ScenarioAnalysis.Init();

        if ScenarioAnalysis.FindLast() then
            LastSrNo := ScenarioAnalysis."Sr. No." + 1
        else
            LastSrNo := 1;

        ScenarioAnalysis."Sr. No." := LastSrNo;

        // Map fields from SourceRec (replace with your source logic)
        ScenarioAnalysis."Cm Code" := SourceRec.CmCode;
        ScenarioAnalysis."Tm Code" := SourceRec.TmCode;
        ScenarioAnalysis."Client Code" := SourceRec.ClientCode;
        ScenarioAnalysis."Product Type" := SourceRec.ProductType;
        ScenarioAnalysis."Series Id" := SourceRec.SeriesId;
        ScenarioAnalysis."Strike Price" := SourceRec.StrikePrice;
        ScenarioAnalysis.CallPut := SourceRec.CallPut;
        ScenarioAnalysis."Asset Code" := SourceRec.AssetCode;
        ScenarioAnalysis."Series Code" := SourceRec.SeriesCode;
        ScenarioAnalysis."Market Lot" := SourceRec.MarketLot;
        ScenarioAnalysis."Underlying Id" := SourceRec.UnderLyingId;
        ScenarioAnalysis."Pre Day Close Price" := SourceRec.PreDayClosePrice;
        ScenarioAnalysis."Today Close Price" := SourceRec.TodayClosePrice;
        ScenarioAnalysis."CP Code" := SourceRec.CPCode;
        ScenarioAnalysis."Net Qty" := SourceRec.NetQty;
        ScenarioAnalysis."Net Value" := SourceRec.NetValue;
        ScenarioAnalysis."Net Value on Today Close Price" := NetValueonTotalClosePrice;

        // Scenarios – assuming values are calculated or coming from SourceRec
        ScenarioAnalysis."Scenario 1A (Increase)" := SourceRec.Scenario1AIncrease;
        ScenarioAnalysis."Scenario 1B (Increase)" := SourceRec.Scenario1BIncrease;
        ScenarioAnalysis."Scenario 2A (Decrease)" := SourceRec.Scenario2ADecrease;
        ScenarioAnalysis."Scenario 2B (Decrease)" := SourceRec.Scenario2BDecrease;
        ScenarioAnalysis."Scenario 3 Price Max" := SourceRec.Scenario3PriceMax;
        ScenarioAnalysis."Scenario 4 Price Max" := SourceRec.Scenario4PriceMin;

        // Net Values in Scenarios
        ScenarioAnalysis."Net Value on Scenario 1A" := Value1;
        ScenarioAnalysis."Net Value on Scenario 1B" := Value2;
        ScenarioAnalysis."Net Value on Scenario 2A" := Value3;
        ScenarioAnalysis."Net Value on Scenario 2B" := Value4;
        ScenarioAnalysis."Net Value on Scenario 3" := Value5;
        ScenarioAnalysis."Net Value on Scenario 4" := Value6;

        // Profit/Loss in Scenarios
        ScenarioAnalysis."Profit/Loss on Scenario 1A" := ProfitLossSC1A;
        ScenarioAnalysis."Profit/Loss on Scenario 1B" := ProfitLossSC1b;
        ScenarioAnalysis."Profit/Loss on Scenario 2A" := ProfitLossSC2A;
        ScenarioAnalysis."Profit/Loss on Scenario 2B" := ProfitLossSC2b;
        ScenarioAnalysis."Profit/Loss on Scenario 3" := ProfitLossSC3;
        ScenarioAnalysis."Profit/Loss on Scenario 4" := ProfitLossSC4;

        ScenarioAnalysis.Insert();
    end;

}