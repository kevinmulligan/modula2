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
	IF m.leftArm = 0 THEN
		(* Ball *)
		result := TRUE;
	ELSE
		(* Rod *)
		
	END;
	
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
VAR	leftHeight : INTEGER;
	rightHeight : INTEGER;
BEGIN
	IF m.leftArm = 0 THEN
		(* Ball *)
		result := m.height;
	ELSE
		(* Rod *)
		Height(m.leftMobile^,leftHeight);
		Height(m.rightMobile^,rightHeight);
		IF leftHeight > rightHeight THEN
			result := leftHeight + m.height;
		ELSE
			result := rightHeight + m.height;
		END;
	END;
	
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
	B1 : MobilePointer;(*Simple balls*)
	B2 : MobilePointer;
	B3 : MobilePointer;
	R1 : MobilePointer;(*Unbalanced mobile*)
	R2 : MobilePointer;(*Simple Balanced mobile*)
	R3 : MobilePointer;(*Somewhat complex balanced mobile*)

BEGIN (* MAIN *)
	(* Allocate mobiles *)
	ALLOCATE(B1,TSIZE(Mobile));
	ALLOCATE(B2,TSIZE(Mobile));
	ALLOCATE(B3,TSIZE(Mobile));
	ALLOCATE(R1,TSIZE(Mobile));
	ALLOCATE(R2,TSIZE(Mobile));
	ALLOCATE(R3,TSIZE(Mobile));

	(* Construct test mobiles *)
	B1^.leftArm := 0;
	B1^.rightArm := 0;
	B1^.height := 30;
	B1^.weight := 10;
	
	B2^.leftArm := 0;
	B2^.rightArm := 0;
	B2^.height := 10;
	B2^.weight := 20;
	
	B3^.leftArm := 0;
	B3^.rightArm := 0;
	B3^.height := 70;
	B3^.weight := 50;
	
	R1^.leftArm := 10;
	R1^.rightArm := 50;
	R1^.height := 30;
	R1^.weight := 0;
	R1^.leftMobile := B1;
	R1^.rightMobile := B2;
	
	R2^.leftArm := 20;
	R2^.rightArm := 10;
	R2^.height := 30;
	R2^.weight := 0;
	R2^.leftMobile := B1;
	R2^.rightMobile := B2;
	
	R3^.leftArm := 40;
	R3^.rightArm := 10;
	R3^.height := 30;
	R3^.weight := 0;
	R3^.leftMobile := B3;
	R3^.rightMobile := R2;

	(* Test Single Ball *)
	WriteString('Testing simple Ball');
	WriteLn;
	IsBalanced(B1^, balanced);
	Height(B1^, height);
	Weight(B1^, weight);
	Width(B1^, width);
	
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
	WriteString('Testing unbalanced mobile');
	WriteLn;
	IsBalanced(R1^, balanced);
	Height(R1^, height);
	Weight(R1^, weight);
	Width(R1^, width);
	
	WriteString('Balanced should be FALSE: ');
	WriteBool(balanced);
	WriteLn;
	
	WriteString('Weight should be 30: ');
	WriteInt(weight,0);
	WriteLn;
	
	WriteString('Height should be 60: ');
	WriteInt(height,0);
	WriteLn;
	
	WriteString('Width should be 120: ');
	WriteInt(width,0);
	WriteLn;
	
	(* Test simple balanced mobile *)
	WriteString('Testing simple balanced mobile');
	WriteLn;
	IsBalanced(R2^, balanced);
	Height(R2^, height);
	Weight(R2^, weight);
	Width(R2^, width);
	
	WriteString('Balanced should be TRUE: ');
	WriteBool(balanced);
	WriteLn;
	
	WriteString('Weight should be 30: ');
	WriteInt(weight,0);
	WriteLn;
	
	WriteString('Height should be 60: ');
	WriteInt(height,0);
	WriteLn;
	
	WriteString('Width should be 50: ');
	WriteInt(width,0);
	WriteLn;
	
	(* Test "complex" balanced mobile *)
	WriteString('Testing complex balanced mobile');
	WriteLn;
	IsBalanced(R3^, balanced);
	Height(R3^, height);
	Weight(R3^, weight);
	Width(R3^, width);
	
	WriteString('Balanced should be TRUE: ');
	WriteBool(balanced);
	WriteLn;
	
	WriteString('Weight should be 80: ');
	WriteInt(weight,0);
	WriteLn;
	
	WriteString('Height should be 100: ');
	WriteInt(height,0);
	WriteLn;
	
	WriteString('Width should be 130: ');
	WriteInt(width,0);
	WriteLn;
	
	(* Free mobiles *)
	DEALLOCATE(B1,TSIZE(Mobile));
	DEALLOCATE(B2,TSIZE(Mobile));
	DEALLOCATE(B3,TSIZE(Mobile));
	DEALLOCATE(R1,TSIZE(Mobile));
	DEALLOCATE(R2,TSIZE(Mobile));
	DEALLOCATE(R3,TSIZE(Mobile));

END Mobiles.