﻿// Вишняков Максим Евгеньевич
// ИКБО-08-20

// cd C:\Program Files\OneScript\bin
// oscript.exe -make test.os chase.exe
// chase.exe

Перем A;
Перем A1;
Перем N;
Перем L;
Перем M;
Перем L1;
Перем M1;

Перем X;
Перем Y;

Перем H;
Перем I;
Перем J;
Перем J1;
Перем J2;
Перем K;
Перем K1;
Перем K2;

Перем Y9;
Перем N9;

Функция Запустить()

	ВыполнитьНачальныйВывод();
	
	// Инициалиациия основных переменных
	A 	= Новый Массив(10, 20);
	A1 	= Новый Массив(10, 20);
	N	= Новый Массив(12);
	L	= Новый Массив(5);
	M	= Новый Массив(5);
	L1	= Новый Массив(5);
	M1	= Новый Массив(5);
	
	ЗаполнитьИгровоеПоле();
	
КонецФункции

Процедура ВыполнитьНачальныйВывод()
 
	Сообщить(Таб(26) + "CHASE");
	Сообщить(Таб(20) + "CREATIVE COMPUTING");
	Сообщить(Таб(18) + "MORRISTOWN, NEW JERSEY");
	Сообщить(Символы.ПС + Символы.ПС + Символы.ПС);
    Сообщить("YOU ARE WITHIN THE WALLS OF A HIGH VOLTAGE MAZE");
	Сообщить("THERE ARE FIVE SECURITY MACHINES TRYING TO DESTROY YOU");
	Сообщить("YOU ARE THE '*'  THE INTERCEPTORS ARE THE '+'");
	Сообщить("THE AREAS MARKED 'X' ARE HIGH VOLTAGE");
	Сообщить("YOUR ONLY CHANCE FOR SURVIVAL IS TO MANEUVER EACH");
	Сообщить("INTERCEPTOR INTO AN 'X'.-----GOOD LUCK-----");
	Сообщить("MOVES ARE   7.8.9");
	Сообщить("            4.*.6");
	Сообщить("            1.2.3");
	Сообщить(Символы.ПС);
	Сообщить("10 = NO MOVE FOR THE REST OF THE GAME");
	Сообщить("-1 = GAVE UP, SITUATION HOPELESS.");
	Сообщить(" 0 = A TREMENDOUS (BUT UNFORTUNATELY RANDOM) LEAP");
	Сообщить(Символы.ПС);

КонецПроцедуры

Процедура ЗаполнитьИгровоеПоле()
	// GOTO 190
	ГСЧ = Новый ГенераторСлучайныхЧисел();
	// Заполнение игрового поля
	Для B = 0 По 9 Цикл
		Для C = 0 По 19 Цикл
			X = Цел(ГСЧ.СлучайноеЧисло(0, 100)/10);
			Если X = 5 Тогда
				A[B][C] = КодСимвола("X");
			Иначе
				A[B][C] = КодСимвола(" ");
			КонецЕсли;
		КонецЦикла;
	КонецЦикла;
	Для D = 0 По 9 Цикл
		A[D][0] = КодСимвола("X");
		A[D][19] = КодСимвола("X");
	КонецЦикла;
	Для F = 0 По 19 Цикл
		A[0][F] = КодСимвола("X");
		A[9][F] = КодСимвола("X");
	КонецЦикла;
	РазместитьИгроков();
	
КонецПроцедуры

Процедура РазместитьИгроков()
   	// GOTO 420
	H = 0; I = 0;
	ПустоеПоле();
	A[H][I] = КодСимвола("*");
	J = H;
	K = I;
	Для N9 = 1 По 5 Цикл
		ПустоеПоле();
		A[H][I] = КодСимвола("+");
		L[N9-1] = H;
		M[N9-1] = I;
	КонецЦикла; // 480
	
	КопироватьДанные();
	
КонецПроцедуры

Процедура КопироватьДанные()

	// 490
	Для В1 = 1 По 10 Цикл
		Для В2 = 1 По 20 Цикл
			A1[В1-1][В2-1] = A[В1-1][В2-1];
		КонецЦикла;
	КонецЦикла;
	// 500
	Для В1 = 1 По 5 Цикл
		L1[В1-1] = L[В1-1];
		M1[В1-1] = M[В1-1];
	КонецЦикла;
	// 520
	J1 = J;
	K1 = K;
	
	ВывестиИгровоеПоле();

КонецПроцедуры

Процедура ВывестиИгровоеПоле()

	// 530
	Y9 = 0;
	Для D2 = 1 По 10 Цикл
		СтрокаПоля = "";
		Для B2 = 1 По 20 Цикл
			Симв = Символ(A[D2-1][B2-1]);
			СтрокаПоля = СтрокаПоля + Симв;
		КонецЦикла;
		Сообщить(СтрокаПоля);
	КонецЦикла;

	СделатьХод();
	
КонецПроцедуры

Процедура СделатьХод()

	// 610
	Если Y9 = 10 Тогда
	   	Сообщить("");
	   	// GOTO 890
	    ОбработатьПоложениеИгрока();
		Возврат;
	КонецЕсли;
	
	ВвестиСтроку(Y9, "?");
	Попытка
		Y9 = Число(Y9);
	Исключение
		Сообщить("Wrong input!");
		Возврат;
	КонецПопытки;
	J2 = J;
	K2 = K;
	
	Если Y9 = 0 Тогда
		// THEN 860
		Сообщить("$6,000,000 JUMP!!!");
		ГСЧ = Новый ГенераторСлучайныхЧисел();
		J = Цел(2 + 8*ГСЧ.СлучайноеЧисло(0, 100)/100);
		K = Цел(2 + 8*ГСЧ.СлучайноеЧисло(0, 100)/100);
		ОбработатьПоложениеИгрока();
	ИначеЕсли Y9 < 0 Тогда
		// THEN 1230
		Сообщить("GIVE UP, EH.");
		Сообщить("*** YOU HAVE BEEN DESTROYED BY A LUCKY COMPUTER ***");
		ЗавершитьИгру();
	ИначеЕсли Y9 = 10 Тогда
		// THEN 1070
		ПереместитьРоботов();
	КонецЕсли;
	
	Если Y9 = 1 Тогда
		// 820
		J = J + 1;
		K = K - 1;
	ИначеЕсли Y9 = 2 Тогда
		// 800
		J = J + 1;
	ИначеЕсли Y9 = 3 Тогда
		// 780
		J = J + 1;
		K = K + 1;
	ИначеЕсли Y9 = 4 Тогда
		// 840
		K = K - 1;
	ИначеЕсли Y9 = 5 Тогда
		// 890
		Если A[J][K] = КодСимвола("X") Тогда
			// 1260
			Сообщить("HIGH VOLTAGE!!!!!!!!!!");
	    	Сообщить("***** ZAP *****  YOU'RE DEAD!!!|");
	    	ЗавершитьИгру();
		КонецЕсли;
	ИначеЕсли Y9 = 6 Тогда
		// 760
		K = K + 1;
	ИначеЕсли Y9 = 7 Тогда
		// 700
		J = J - 1;
		K = K - 1;
	ИначеЕсли Y9 = 8 Тогда                                       
		// 720
		J = J - 1;
	ИначеЕсли Y9 = 9 Тогда
		// 740
		J = J - 1;
		K = K + 1;
	КонецЕсли;
	
	Если A[J][K] = КодСимвола("X") Тогда
		// 1260
		Сообщить("HIGH VOLTAGE!!!!!!!!!!");
    	Сообщить("***** ZAP *****  YOU'RE DEAD!!!|");
    	ЗавершитьИгру();
	КонецЕсли;
	
	A[J2][K2] = КодСимвола(" ");
	A[J][K] = КодСимвола("*");
	// GOTO 1070
	
	// 1070
	ПереместитьРоботов();
	
	// INTERCEPTOR MOVEMENT

КонецПроцедуры

Процедура ЗавершитьИгру()

	ВвестиСтроку(N9, "ANOTHER GAME (Y/N)");
	Если N9 <> "Y" Тогда
		ЗавершитьРаботу(0);	
	КонецЕсли;
	ВвестиСтроку(N9, "SAME SETUP (Y/N)");
	Если N9 <> "Y" Тогда
		ЗаполнитьИгровоеПоле(); // GOTO 190
	Иначе
		Для В1 = 1 По 10 Цикл
			Для В2 = 1 По 20 Цикл
				A[В1-1][В2-1] = A1[В1-1][В2-1];
			КонецЦикла;
		КонецЦикла;
		Для В1 = 1 По 5 Цикл
			L[В1-1] = L1[В1-1];
			M[В1-1] = M1[В1-1];
		КонецЦикла;
		J = J1;
		K = K1;
		ВывестиИгровоеПоле(); // GOTO 530
	КонецЕсли;
	
КонецПроцедуры

Процедура ПереместитьРоботов()
	// 1070
	Для N9 = 0 По 4 Цикл
		X = L[N9];
		Y = M[N9];
		G9 = 0;
		// GOSUB 940
		Если A[X][Y] <> КодСимвола("X") Тогда
			X2 = X;
			Y2 = Y;
			X = SGN(J - X);
			Y = SGN(K - Y);
			X = X + X2;
			Y = Y + Y2;
			Если A[X][Y] = КодСимвола("*") Тогда
				G9 = 99;
			ИначеЕсли A[X][Y] = КодСимвола(" ") Тогда
				A[X][Y] = КодСимвола("+");
				A[X2][Y2] = КодСимвола(" ");
			Иначе
				A[X2][Y2] = КодСимвола(" ");
			КонецЕсли;
		КонецЕсли; // 1060
		
		Если G9 <> 0 Тогда // 1240
			Сообщить("*** YOU HAVE BEEN DESTROYED BY A LUCKY COMPUTER ***");
			ЗавершитьИгру();
		Иначе
			L[N9] = X;
			M[N9] = Y;
		КонецЕсли;
	КонецЦикла;
	
	Для N9 = 0 По 4 Цикл
		Если A[L[N9]][M[N9]] <> КодСимвола("X") Тогда
			ВывестиИгровоеПоле();
			Возврат;			
		КонецЕсли;
	КонецЦикла;
	
	// 1210
	Сообщить("YOU HAVE DESTROYED ALL YOUR OPPONENTS - THE GAME IS YOURS");
	ЗавершитьИгру();
	
КонецПроцедуры

Процедура ОбработатьПоложениеИгрока()

	Если A[J][K] = КодСимвола("X") Тогда
	    Сообщить("HIGH VOLTAGE!!!!!!!!!!");
	    Сообщить("***** ZAP *****  YOU'RE DEAD!!!|");
	    ЗавершитьИгру();
	Иначе
		A[J2][K2] = КодСимвола(" ");
		A[J][K] = КодСимвола("*");
		ПереместитьРоботов();		
	КонецЕсли;
	
КонецПроцедуры

Процедура ПустоеПоле()
	// 370
	ГСЧ = Новый ГенераторСлучайныхЧисел();
	Повторять = Истина;
	Пока Повторять Цикл
		H = Цел(2 + 8*ГСЧ.СлучайноеЧисло(0, 100)/100);
		I = Цел(2 + 8*ГСЧ.СлучайноеЧисло(0, 100)/100);
		Повторять = A[H][I] <> КодСимвола(" ");
	КонецЦикла;

КонецПроцедуры

Функция Таб(Количество)

	Результат = "";
	Для Сч = 0 По Количество Цикл
		Результат = Результат + " "; 
   	КонецЦикла;
   	
   	Возврат Результат;

КонецФункции

Функция SGN(ВходящееЧисло)

	Если ВходящееЧисло > 0 Тогда
    	Возврат 1;
    ИначеЕсли ВходящееЧисло = 0 Тогда
    	Возврат 0;
    Иначе
    	Возврат -1;
    КонецЕсли;

КонецФункции

Запустить();
// Остановить закрытие консоли по завершении
Действие = "";
ВвестиСтроку(Действие);