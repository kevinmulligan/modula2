MODULE Mobiles;

FROM Terminal2	IMPORT WriteString, WriteChar, WriteLn;
FROM Storage 	IMPORT ALLOCATE, DEALLOCATE;
FROM SYSTEM	IMPORT TSIZE;

TYPE	MobilePointer = POINTER TO Mobile;
	Mobile = RECORD
		leftArm, rightArm, height, weight : INTEGER;
		rightMobile, leftMobile : MobilePointer;
		END;

BEGIN (* MAIN *)
	WriteString('HELLO');
	WriteLn;

END Mobiles.