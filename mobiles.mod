MODULE Mobiles;

FROM Terminal2	IMPORT WriteString, WriteInt, WriteLn;
FROM Storage 	IMPORT ALLOCATE, DEALLOCATE;
FROM SYSTEM	IMPORT TSIZE;

TYPE	MobilePointer = POINTER TO Mobile;
	Mobile = RECORD
		leftArm, rightArm, height, weight : INTEGER;
		rightMobile, leftMobile : MobilePointer;
		END;

(*Return true if the whole mobile is balanced*)
PROCEDURE IsBalanced(	m : Mobile;
			VAR result : BOOLEAN); (* Return value *)
BEGIN
	(*TODO *)
	
END IsBalanced;

(*Return the total weight of a mobile*)
PROCEDURE Weight(	m : Mobile;
			VAR result : INTEGER); (* Return value *)
VAR	leftWeight : INTEGER;
	rightWeight : INTEGER;
BEGIN
	IF m.leftArm = 0 THEN
		(* Ball *)
		result := m.weight;
	ELSE
		(* Rod *)
		Weight(m.leftMobile^, leftWeight);
		Weight(m.rightMobile^, rightWeight);
		result := leftWeight + rightWeight;
	END;
	
END Weight;

(*Return the total height of a mobile*)
PROCEDURE Height(	m : Mobile;
			VAR result : INTEGER); (* Return value *)
BEGIN
	(*TODO *)
	
END Height;

(*Return the max width of a mobile*)
PROCEDURE Width(	m : Mobile;
			VAR result : INTEGER); (* Return value *)
BEGIN
	(*TODO *)
	
END Width;

PROCEDURE WriteBool(	b : BOOLEAN);
BEGIN
	IF b THEN
		WriteString('TRUE');
	ELSE
		WriteString('FALSE');
	END;
END WriteBool;

(* Variables used in Main *)
VAR	balanced : BOOLEAN;
	weight : INTEGER;
	height : INTEGER;
	width : INTEGER;
	B1 : Mobile;
	

BEGIN (* MAIN *)
	(* Test Single Ball *)
	B1.leftArm := 0;
	B1.rightArm := 0;
	B1.height := 30;
	B1.weight := 10;
	
	WriteString('Testing simple Ball');
	WriteLn;
	IsBalanced(B1, balanced);
	Height(B1, height);
	Weight(B1, weight);
	Width(B1, width);
	
	WriteString('Balanced should be TRUE: ');
	WriteBool(balanced);
	WriteLn;
	
	WriteString('Weight should be 10: ');
	WriteInt(weight,0);
	WriteLn;
	
	WriteString('Height should be 30: ');
	WriteInt(height,0);
	WriteLn;
	
	WriteString('Width should be 10: ');
	WriteInt(width,0);
	WriteLn;
	
	(* Test unbalanced mobile *)
	

END Mobiles.