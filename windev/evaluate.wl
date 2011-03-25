// A Procedure that works similar to EVALUATE in Clarion

PROCEDURE EVALUATE(LOCAL Formula is string, *)

MisVars is string = ""
FOR i = 2 _TO_ MyParameters..Occurrence
    IF MisVars <> "" THEN
        MisVars += ","
    END
    MisVars += "v" + (i - 1)
END

ProcToComp is string = [
PROCEDURE MiFuncTemp(%1)
RESULT %2
]

MiCodigo is string = StringBuild(ProcToComp, MisVars, Formula)

Result is string = Compile("MiFuncTemp", MiCodigo)
IF Result <> "" THEN
    ExceptionThrow(1, "Error compiling the procedure: " + CR + MiCodigo)
END

Resultado is variant = ExecuteProcess("MiFuncTemp", trtProcedure, MyParameters[2 TO])

Compile("MiFuncTemp", "")

RESULT Resultado


// Sample Working

a is int = 1
b is int = 2
c is int = EVALUATE("v1 + v2", a, b)
Info(c) // Will show 3

// In the formula "v1 + v2", a will take the place of v1 and b will be v2
