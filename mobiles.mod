MODULE Mobiles;

FROM Terminal2	IMPORT WriteString, WriteChar, WriteLn;
FROM Storage 	IMPORT ALLOCATE, DEALLOCATE;
FROM SYSTEM	IMPORT TSIZE;

TYPE	MobilePointer = POINTER TO Mobile;
	Mobile = RECORD
		leftArm, rightArm, height, weight : INTEGER;
		rightMobile, leftMobile : MobilePointer;
		END;

(*Return true if the whole mobile is balanced*)
PROCEDURE IsBalanced(	m : Mobile;
			result : BOOLEAN); (* Return value *)
BEGIN
	(*TODO *)
	
END IsBalanced;

(*Return the total weight of a mobile*)
PROCEDURE Weight(	m : Mobile;
			result : INTEGER); (* Return value *)
BEGIN
	(*TODO *)
	
END Weight;

(*Return the total height of a mobile*)
PROCEDURE Height(	m : Mobile;
			result : BOOLEAN); (* Return value *)
BEGIN
	(*TODO *)
	
END Height;

(*Return the max width of a mobile*)
PROCEDURE Width(	m : Mobile;
			result : BOOLEAN); (* Return value *)
BEGIN
	(*TODO *)
	
END Width;

BEGIN (* MAIN *)
	WriteString('HELLO');
	WriteLn;

END Mobiles.