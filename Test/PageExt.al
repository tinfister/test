pageextension 50100 CustomerListExt extends "Sales Order Subform"
{
    layout
    {
        modify(Description)
        {
            Visible = false;
        }
        addafter(Description)
        {
            field(Desc; Description)
            {
                StyleExpr = varStyle;
            }
        }
    }
    trigger OnAfterGetRecord();
    begin
        UpdateStyle;
    end;

    local procedure UpdateStyle();
    var        
        Item: Record Item;
    begin
        if Type = Type::Item then begin
            if Item.get("No.") then begin
                Item.CalcFields(Inventory);
                if Item.Inventory > 5 then
                    varStyle := 'Favorable'
                else
                    varStyle := 'Standard';          
            end;
        end else
            varStyle := 'Standard';
    end;

    var 
     varStyle: Text;
}